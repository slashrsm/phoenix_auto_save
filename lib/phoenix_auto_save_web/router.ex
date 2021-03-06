defmodule PhoenixAutoSaveWeb.Router do
  use PhoenixAutoSaveWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixAutoSaveWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixAutoSaveWeb do
  #   pipe_through :api
  # end
end
