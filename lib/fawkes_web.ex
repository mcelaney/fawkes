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



      def display_time(%{start: start, finish: finish}) do
        display_time(start) <> " - " <> display_time(finish)
      end
      def display_time(time), do: Timex.format!(time, "%l:%M %P", :strftime)

      def display_date(%{start: start}), do: display_date(start)
      def display_date(date), do: Timex.format!(date, "%A %B %e, %Y", :strftime)
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
