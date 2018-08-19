defmodule Fawkes.Repo do
  use Ecto.Repo, otp_app: :fawkes

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end

  @doc """
  Fetches a single result from the query and returns a tagged tuple.

  Returns a tagged tuple if no result was found.

  ## Options
  See the [“Shared options”](Shared options) section for the Ecto.Repo behaviour

  ## Example

  iex> Fawkes.Repo.fetch_by(Post, title: "My post")

  {:ok, %Post{id: 1, title: "My post"}}
  """
  @spec fetch_by(Ecto.Queryable.t(), Keyword.t() | map, Keyword.t()) ::
          {:ok, Ecto.Schema.t()} | {:not_found, Ecto.Queryable.t()}
  def fetch_by(queryable, clauses, opts \\ []) do
    queryable
    |> get_by(clauses, opts)
    |> case do
      nil -> {:not_found, queryable}
      obj -> {:ok, obj}
    end
  end

  @doc """
  Fetches a single result from the query and returns a tagged tuple.

  Returns a tagged tuple if no result was found.

  ## Options
  See the [“Shared options”](Shared options) section for the Ecto.Repo behaviour

  ## Example

  iex> Fawkes.Repo.fetch_by(Post, title: "My post")

  {:ok, %Post{id: 1, title: "My post"}}
  """
  @spec fetch(Ecto.Queryable.t(), pos_integer | String.t()) ::
          {:ok, Ecto.Schema.t()} | {:error, :not_found}
  def fetch(module, id) do
    with %_{} = result <- get(module, id) do
      {:ok, result}
    else
      nil -> {:error, :not_found}
    end
  end
end
