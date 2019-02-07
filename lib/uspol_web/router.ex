defmodule UspolWeb.Router do
  use UspolWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Uspol.Plugs.SetUser
  end

  pipeline :auth do
    plug UspolWeb.Plugs.RequireAuth
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", UspolWeb do
    pipe_through [:browser, :auth]

    resources "/videos", VideoController, only: [:new, :create, :delete]
  end

  scope "/", UspolWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/videos", VideoController, only: [:index, :show]

  end

  scope "/auth", UspolWeb do
    pipe_through :browser

    # using :provider instead of google, can use the same route for any authentication solution
    get "/signout", SessionController, :delete
    get "/:provider", SessionController, :request
    get "/:provider/callback", SessionController, :create
  end
end
