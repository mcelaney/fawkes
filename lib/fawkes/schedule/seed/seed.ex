defmodule Fawkes.Schedule.Seed do
  alias Fawkes.Schedule.Seed.Audience
  alias Fawkes.Schedule.Seed.Category
  alias Fawkes.Schedule.Seed.Location
  alias Fawkes.Schedule.Seed.Slot
  alias Fawkes.Schedule.Seed.Speaker
  alias Fawkes.Schedule.Seed.Talk
  alias Fawkes.Repo

  def perform do
    Slot.perform()
    Speaker.perform()
    Location.perform()
    Category.perform()
    Audience.perform()
    Talk.perform()
  end

  def fetch_by_slug(module) do
    module
    |> Repo.all
    |> Enum.group_by(fn(%{slug: slug}) -> slug end)
  end
end
