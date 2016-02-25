defmodule PhoenixMailmanExample.Router do
  use PhoenixMailmanExample.Web, :router

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

  scope "/", PhoenixMailmanExample do
    pipe_through :browser # Use the default browser stack
    resources "/jobs", JobController
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixMailmanExample do
  #   pipe_through :api
  # end
end
