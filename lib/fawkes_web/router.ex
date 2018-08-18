defmodule FawkesWeb.Router do
  use FawkesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug FawkesWeb.Plugs.Auth
    plug FawkesWeb.Plugs.CurrentUser
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :ensure_profile do
    plug FawkesWeb.Plugs.VerifyProfileCreated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Definitely logged in scope
  scope "/", FawkesWeb do
    pipe_through [:browser, :auth, :ensure_auth]
    resources "/profile", ProfileController, only: [:edit, :update], singleton: true
  end

  scope "/", FawkesWeb do
    pipe_through [:browser, :auth, :ensure_profile]
    get "/", PageController, :index
    post "/", PageController, :login
    post "/logout", PageController, :logout

    scope "/signup", Signup, as: :signup do
      resources "/users", UserController, only: [:new, :create]
    end

    get "/timeline", PageController, :timeline
    resources "/schedule", ScheduleController, only: [:index]
    resources "/audience", AudienceController, only: [:show]
    resources "/category", CategoryController, only: [:show]
    resources "/speaker", SpeakerController, only: [:index, :show]
    resources "/talk", TalkController, only: [:show]
    resources "/profile", ProfileController, only: [:show]
  end

  # Definitely logged in scope
  scope "/", FawkesWeb do
    pipe_through [:browser, :auth, :ensure_auth, :ensure_profile]
    resources "/my_agenda", AgendaItemController, only: [:index, :create, :delete]
  end
end
