defmodule FawkesWeb.AgendaItemController do
  use FawkesWeb, :controller

  def index(conn, _params) do
    talk_ids = conn |> agenda_talk_ids()

    render(
      conn,
      FawkesWeb.ScheduleView,
      "index.html",
      schedules: talk_ids |> Schedule.fetch() |> group_schedule_by_dates(),
      talk_counts: Profile.fetch_attendance_counts(talk_ids),
      agenda_item_slugs: talk_slug_mapset(conn)
    )
  end

  def create(conn, %{"agenda_item" => %{"talk_id" => talk_id}}) do
    case Profile.add_to_agenda(conn.assigns.current_user, talk_id) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Item Added Successfully.")
        |> redirect(to: agenda_item_path(conn, :index))

      {:error, %Ecto.Changeset{} = _} ->
        conn
        |> put_flash(:info, "Item Could Not Be Added.")
        |> redirect(to: agenda_item_path(conn, :index))
    end
  end

  def delete(conn, %{"id" => talk_id}) do
    Profile.remove_from_agenda(conn.assigns.current_user, talk_id)

    conn
    |> put_flash(:info, "Item removed Successfully.")
    |> redirect(to: agenda_item_path(conn, :index))
  end

  defp agenda_talk_ids(conn) do
    conn.assigns.current_agenda_items
    |> Enum.map(fn %{id: id} -> id end)
  end
end
