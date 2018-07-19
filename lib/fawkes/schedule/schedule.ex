defmodule Fawkes.Schedule do
  defdelegate seed(), to: Fawkes.Schedule.Seed, as: :perform
end
