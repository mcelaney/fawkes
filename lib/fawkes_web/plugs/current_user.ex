defmodule FawkesWeb.Plugs.CurrentUser do
  @moduledoc """
  Plug that populates the current_user assigns
  """

  alias Fawkes.Auth.Guardian.Plug, as: GuardianPlug
  alias Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
    |> GuardianPlug.current_resource()
    |> assign_current_user_values(conn)
  end

  defp assign_current_user_values(user, conn) do
    conn
    |> Conn.assign(:current_user, user)
    |> Conn.assign(:current_agenda_items, agenda_items(user))
  end

  defp agenda_items(%{profile: %{agenda_items: items}}) do
    Enum.map(items, fn(%{talk: talk}) -> talk end)
  end
  defp agenda_items(_), do: []
end
