defmodule FawkesWeb.ProfileView do
  use FawkesWeb, :view

  def employment(title, company) do
    cond do
      is_nil(title) and is_nil(company) -> nil
      is_nil company -> company
      is_nil title -> title
      true -> "#{title} at #{company}"
    end
  end
end
