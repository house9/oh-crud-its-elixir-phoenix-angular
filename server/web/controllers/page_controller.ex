defmodule OhCrud.PageController do
  use OhCrud.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
