defmodule TweeterWeb.Router do
  use TweeterWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TweeterWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/", PageController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", TweeterWeb do
  #   pipe_through :api
  # end
end
