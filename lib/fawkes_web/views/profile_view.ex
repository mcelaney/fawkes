defmodule FawkesWeb.ProfileView do
  use FawkesWeb, :view

  @spec employment(String.t() | nil, String.t() | nil) :: String.t() | nil

  @doc """
  Returns a formatted string of a given profile title and company values
  """
  def employment(title, company) do
    cond do
      is_nil(title) and is_nil(company) -> nil
      is_nil(company) -> company
      is_nil(title) -> title
      true -> "#{title} at #{company}"
    end
  end
end
