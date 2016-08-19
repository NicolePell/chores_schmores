defmodule ChoresSchmores.Router do
  use ChoresSchmores.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug ChoresSchmores.Auth, repo: ChoresSchmores.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChoresSchmores do
    pipe_through :browser

    get "/", HomeController, :index

    resources "/user", UserController, only: [:index, :show, :new, :create]
    resources "/session", SessionController, only: [:new, :create, :delete]
  end

  scope "/", ChoresSchmores do
    pipe_through [:browser, :authenticate_user]

    resources "/house", HouseController
  end

end
