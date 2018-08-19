defmodule FawkesWeb.LayoutView do
  use FawkesWeb, :view

  def display_name(%{profile: profile}) when not is_nil(profile) do
    "#{profile.first} #{profile.last}"
  end

  def display_name(_), do: nil

  def display_title(%{profile: %{title: title}}) when not is_nil(title) do
    title
  end

  def display_title(_), do: nil

  def display_company(%{profile: %{company: company}}) when not is_nil(company) do
    company
  end

  def display_company(_), do: nil
end
