defmodule Fawkes.Schedule do
  @moduledoc """
  Module responsible for teh schedule domain
  """

  import Ecto.Query
  alias Fawkes.Repo
  alias Fawkes.Schedule.Slot
  alias Fawkes.Schedule.Speaker
  alias Fawkes.Schedule.Talk

  @typedoc """
  This param type is used to search against Fawkes.Repo.Symbol types
  """
  @type slugable :: atom | String.t

  @spec fetch() :: list(Slot.t)
  @spec fetch_by_audience(slugable) :: list(Slot.t)
  @spec fetch_by_category(slugable) :: list(Slot.t)
  @spec fetch_speakers() :: list(Speaker.t)
  @spec fetch_speakers(slugable) :: Speaker.t
  @spec fetch_talks(slugable) :: Talk.t

  defdelegate seed(), to: Fawkes.Schedule.Seed, as: :perform

  @doc """
  Returns a list of all slots in the schedule.
  """
  def fetch do
    Slot
    |> preload([:event, [talks: [:speaker, :category, :audience, :location]]])
    |> order_by([slot], slot.start)
    |> Repo.all
  end

  @doc """
  Given a string or atom used as an audience slug - returns a list of slots.

  Only talks related to the slug are returned.
  Only slugs containing talks are returned.
  """
  def fetch_by_audience(slug) do
    Slot
    |> join(:left, [slot], talks in assoc(slot, :talks))
    |> join(:left, [_slot, talks], audiences in assoc(talks, :audience))
    |> where([_slot, _talks, audiences], audiences.slug == ^slug)
    |> preload([_, talks], [:event, [talks: {talks, [:speaker, :category, :audience, :location]}]])
    |> order_by([slot], slot.start)
    |> Repo.all
  end

  @doc """
  Given a string or atom used as an audience slug - returns a list of slots.

  Only talks related to the slug are returned.
  Only slugs containing talks are returned.
  """
  def fetch_by_category(slug) do
    Slot
    |> join(:left, [slot], talks in assoc(slot, :talks))
    |> join(:left, [_slot, talks], categories in assoc(talks, :category))
    |> where([_slot, _talks, categories], categories.slug == ^slug)
    |> preload([_, talks], [:event, [talks: {talks, [:speaker, :category, :audience, :location]}]])
    |> order_by([slot], slot.start)
    |> Repo.all
  end

  @doc """
  Returns a list of all speakers.
  """
  def fetch_speakers do
    Speaker
    |> join(:right, [speaker], talk in assoc(speaker, :talk))
    |> preload([:talk])
    |> order_by([speaker], speaker.last)
    |> Repo.all
  end

  @doc """
  Given a string or atom used as a speaker slug - returns the related speaker.
  """
  def fetch_speakers(slug) do
    Speaker
    |> join(:right, [speaker], talk in assoc(speaker, :talk))
    |> where([speaker], speaker.slug == ^slug)
    |> preload([:talk])
    |> Repo.one
  end

  @doc """
  Given a string or atom used as a talk slug - returns the related talk.
  """
  def fetch_talks(slug) do
    Talk
    |> where([talk], talk.slug == ^slug)
    |> preload([:slot, :speaker, :category, :audience, :location])
    |> Repo.one
  end
end
