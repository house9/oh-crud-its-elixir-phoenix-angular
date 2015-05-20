defmodule OhCrud.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    # plug PlugCors, origins: ["*"]
    plug :cors
    plug :accepts, ["json"]
  end

  scope "/", OhCrud do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/projects", ProjectController
    resources "/departments", DepartmentController
  end

  # Other scopes may use custom stacks.
  scope "/api", OhCrud do
    pipe_through :api

    resources "/projects", Api.ProjectController
    options "/projects", Api.ProjectController, :options
    options "/projects/:id", Api.ProjectController, :options

    resources "/departments", Api.DepartmentController
    options "/departments", Api.DepartmentController, :options
    options "/departments/:id", Api.DepartmentController, :options
  end

  # https://github.com/jeffweiss/todobackend-phoenix
  def cors(conn, _opts) do
    conn
    |> put_resp_header("Access-Control-Allow-Origin", "*")
    |> put_resp_header("Access-Control-Allow-Headers", "Content-Type")
    |> put_resp_header("Access-Control-Allow-Methods", "GET,PUT,PATCH,OPTIONS,DELETE,POST")
  end
end
