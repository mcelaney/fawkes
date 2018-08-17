defmodule FawkesWeb.Plugs.VerifyProfileCreated do
  @moduledoc """
  Plug that ensures the current_user assigns contains a profile
  """

  def init(opts), do: opts

  def call(%{assigns: %{current_user: nil}} = conn, _opts), do: conn

  def call(%{assigns: %{current_user: user}} = conn, _opts) do
    if is_nil user.profile do
      Phoenix.Controller.redirect(conn, to: FawkesWeb.Router.Helpers.profile_path(conn, :edit))
    else
      conn
    end
  end
end
