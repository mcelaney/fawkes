defmodule FawkesWeb.LayoutView do
  use FawkesWeb, :view

  @spec display_name(%{profile: Fawkes.Profile.Info.t()} | any) :: String.t() | nil
  @spec display_title(%{profile: Fawkes.Profile.Info.t()} | any) :: String.t() | nil
  @spec display_company(%{profile: Fawkes.Profile.Info.t()} | any) :: String.t() | nil

  @doc """
  Helper to produce a string of the name associated with the profile of a given
  user
  """
  def display_name(%{profile: profile}) when not is_nil(profile) do
    "#{profile.first} #{profile.last}"
  end

  def display_name(_), do: nil

  @doc """
  Rteurns the title from the profile of a given user
  """
  def display_title(%{profile: %{title: title}}) when not is_nil(title) do
    title
  end

  def display_title(_), do: nil

  @doc """
  Rteurns the company from the profile of a given user
  """
  def display_company(%{profile: %{company: company}}) when not is_nil(company) do
    company
  end

  def display_company(_), do: nil
end
