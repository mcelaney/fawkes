defmodule FawkesWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use FawkesWeb, :controller
      use FawkesWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: FawkesWeb
      import Plug.Conn
      import FawkesWeb.Router.Helpers
      import FawkesWeb.Gettext
      alias Fawkes.Profile
      alias Fawkes.Schedule

      defp talk_slug_mapset(conn) do
        conn.assigns.current_agenda_items
        |> Enum.map(fn(%{slug: slug}) -> slug end)
        |> MapSet.new()
      end

      defp group_schedule_by_dates(slots) do
        Enum.group_by(slots, fn(slot) -> slot.start |> NaiveDateTime.to_date() end)
      end

      defp talk_counts(schedule) do
        schedule
        |> Schedule.to_talk_ids()
        |> Profile.fetch_attendance_counts()
      end
    end
  end

  def view do
    quote do
      use Phoenix.View, root: "lib/fawkes_web/templates",
                        namespace: FawkesWeb

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import FawkesWeb.Router.Helpers
      import FawkesWeb.ErrorHelpers
      import FawkesWeb.Gettext
      alias FawkesWeb.SharedView
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import FawkesWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
