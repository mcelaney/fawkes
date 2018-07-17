defmodule Fawkes.Profile do
  @moduledoc """
  Context responsible for managing profile information
  """

  alias Fawkes.Profile.User
  alias Fawkes.Repo
  @spec get_user(pos_integer) :: {:ok, User.t} | {:error, :not_found}

  @doc """
  Gets a single user. Returns a tuple with the status of the result.
  """
  def get_user(id), do: Repo.fetch(User, id)
end
