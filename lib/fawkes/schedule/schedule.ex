defmodule Fawkes.Schedule do
  import Ecto.Query
  alias Fawkes.Repo
  alias Fawkes.Schedule.Slot

  @typedoc """
  This param type is used to search against Fawkes.Repo.Symbol types
  """
  @type slugable :: atom | String.t

  @spec fetch() :: list(Slot.t)
  @spec fetch_by_audience(slugable) :: list(Slot.t)
  @spec fetch_by_category(slugable) :: list(Slot.t)

  defdelegate seed(), to: Fawkes.Schedule.Seed, as: :perform

  @doc """
  Returns a list of all slots in the schedule.
  """
  def fetch do
    Slot
    |> preload([:event, [talks: [:speaker, :category, :audience, :location]]])
    |> order_by([slot], slot.slug)
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
    |> order_by([slot], slot.slug)
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
    |> order_by([slot], slot.slug)
    |> Repo.all
  end
end
