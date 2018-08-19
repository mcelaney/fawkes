defmodule Fawkes.Profile do
  @moduledoc """
  Context responsible for managing profile information
  """

  import Ecto.Query
  alias Fawkes.Profile.AgendaItem
  alias Fawkes.Profile.Info
  alias Fawkes.Profile.User
  alias Fawkes.Repo
  @spec get_user(pos_integer) :: User.t | nil
  @spec fetch_or_create_for_user(User.t) :: Info.t
  @spec fetch_info(User.t) :: Info.t
  @spec info_changeset(Info.t | nil) :: Ecto.Changeset.t | nil
  @spec update_info(User.t, map) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  @spec agenda_item_changeset() :: Ecto.Changeset.t()
  @spec add_to_agenda(User.t, pos_integer) :: {:ok, Ecto.Schema.t()} | {:error, Ecto.Changeset.t()}
  @spec remove_from_agenda(User.t, pos_integer) :: nil | :ok
  @spec fetch_agenda_item(pos_integer, pos_integer) :: AgendaItem.t
  @spec fetch_attendance_counts(list(pos_integer)) :: [{atom, pos_integer}]
  @spec fetch_user_profiles() :: list(Info.t)

  @doc """
  Gets a single user. Returns a tuple with the status of the result.
  """
  def get_user(id) do
    User
    |> preload([[profile: [agenda_items: [:talk]]]])
    |> where([user], user.id == ^id)
    |> Repo.one
  end

  @doc """
  Given a string or atom used as an user profile slug - returns a user profile
  """
  def fetch_user_profile(slug) do
    Info
    |> where([info], info.slug == ^slug)
    |> preload([agenda_items: [:talk]])
    |> Repo.one
  end

  @doc """
  Given a User - finds or created a new user profile for that user.
  """
  def fetch_or_create_for_user(%User{} = user, default_talk_ids) do
    with %Info{} = profile <- fetch_info(user) do
      profile
    else
      nil ->  create_profile(user, default_talk_ids)
    end
  end
  def fetch_or_create_for_user(_), do: nil

  @doc """
  Given a user - returns the profile information for that user
  """
  def fetch_info(profile_user) do
    Info
    |> where([info], info.user_id == ^profile_user.id)
    |> Repo.one
  end

  @doc """
  Given profile information - returns a changeset for that information
  """
  def info_changeset(nil), do: nil
  def info_changeset(info) do
    Info.changeset(info, %{})
  end

  @doc """
  Given a user with preloaded profile information and a params map -
  attempts to updates the profile info with the given params
  """
  def update_info(%User{profile: profile}, params) when not is_nil profile do
    profile
    |> Info.changeset(params)
    |> Repo.update
  end

  @doc """
  Returns an empty AgendaItem changeset
  """
  def agenda_item_changeset do
    AgendaItem.changeset(%AgendaItem{}, %{})
  end

  @doc """
  Given a user with preloaded profile information and a talk_id -
  attempts to add an agenda item for that talk on the given profile
  """
  def add_to_agenda(%User{profile: profile}, talk_id) when not is_nil profile do
    %AgendaItem{}
    |> AgendaItem.changeset(%{profile_id: profile.id, talk_id: talk_id})
    |> Repo.insert
  end

  @doc """
  Given a user with preloaded profile information and a talk_id -
  attempts to remove an agenda item for that talk on the given profile
  """
  def remove_from_agenda(%User{profile: profile}, talk_id) when not is_nil profile do
    with %AgendaItem{} = item <- fetch_agenda_item(profile.id, talk_id) do
      Repo.delete(item)
    else
      _ -> nil
    end
  end

  @doc """
  Given a profile id an a talk id returns the related profiel agenda item
  """
  def fetch_agenda_item(profile_id, talk_id) do
    AgendaItem
    |> where([item], item.profile_id == ^profile_id and item.talk_id == ^talk_id)
    |> Repo.one
  end

  @doc """
  Given a list of talk ids returns a kewword list of talk slug/profile count
  pairs
  """
  def fetch_attendance_counts(talk_ids) do
    AgendaItem
    |> join(:inner, [item], talk in assoc(item, :talk))
    |> where([item], item.talk_id in ^talk_ids)
    |> group_by([item, talk], talk.slug)
    |> select([item, talk],
         {
           talk.slug,
           count(item.id)
         }
       )
    |> Repo.all
  end

  @doc """
  Returns the profiles for all users
  """
  def fetch_user_profiles do
    Info
    |> order_by([info], info.last)
    |> preload([agenda_items: [:talk]])
    |> Repo.all
  end

  @spec create_profile(User.t, list(pos_integer)) :: Info.t
  defp create_profile(user, default_talk_ids) do
    %Info{}
    |> Info.init_changeset(%{user_id: user.id, slug: "user_#{user.id}"})
    |> Repo.insert!
    |> build_default_agenda(user, default_talk_ids)
  end

  @spec build_default_agenda(Info.t, User.t, list(pos_integer)) :: Info.t
  defp build_default_agenda(profile, user, default_talk_ids) do
    Enum.each(default_talk_ids, fn(talk_id) ->
      add_to_agenda(%{user| profile: profile}, talk_id)
    end)

    profile
  end
end
