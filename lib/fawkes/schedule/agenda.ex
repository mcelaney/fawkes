defmodule Fawkes.Schedule.Agenda do
  @moduledoc """
  Module responsible transforming a schedule in to an agenda
  """

  import Ecto.Query
  alias Fawkes.Repo
  alias Fawkes.Schedule.Slot

  @spec fetch(list(pos_integer)) :: list(Slot.t())

  @doc """
  Given a list of talk_ids returns a list of all slots in the schedule
  containing only the selected talks.

  Any slot which does not contain an event or talk is marked dirty with the
  `none_selected?` virtual param on Fawkes.Schedule.Slot
  """
  def fetch(talk_ids) do
    talk_ids
    |> fetch_picked_talks_grouped_by_id()
    |> _fetch()
    |> Enum.reverse()
  end

  defp _fetch(talks_grouped_by_id) do
    Slot
    |> preload([:event])
    |> order_by([slot], slot.start)
    |> Repo.all()
    |> Enum.reduce([], fn slot, acc ->
      [zip_with_selected_talks(slot, talks_grouped_by_id) | acc]
    end)
    |> Enum.reverse()
  end

  defp fetch_picked_talks_grouped_by_id(talk_ids) do
    Slot
    |> join(:left, [slot], talks in assoc(slot, :talks))
    |> where([slot, talks], talks.id in ^talk_ids)
    |> preload([_, talks], [:event, [talks: {talks, [:speaker, :category, :audience, :location]}]])
    |> order_by([slot], slot.start)
    |> Repo.all()
    |> Enum.reduce(%{}, fn %{id: slot_id} = slot, acc ->
      Map.put(acc, slot_id, Enum.map(slot.talks, fn talk -> Map.put(talk, :selected?, true) end))
    end)
  end

  defp zip_with_selected_talks(slot, talks_grouped_by_id) do
    cond do
      # replace slot talks with selected talks if available
      not is_nil(talks_grouped_by_id[slot.id]) ->
        Map.put(slot, :talks, talks_grouped_by_id[slot.id])

      # mark slot dirty is not an event
      is_nil(slot.event) ->
        Map.put(slot, :none_selected?, true)

      # If it's an event just return the slot
      true ->
        slot
    end
  end
end
