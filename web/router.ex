defmodule ChoresSchmores.Router do
  use ChoresSchmores.Web, :router

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

  scope "/", ChoresSchmores do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index

    get "/:name/tasks", TaskController, :task

    get "/users", UserController, :index
    get "/users/:id", UserController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChoresSchmores do
  #   pipe_through :api
  # end
end
