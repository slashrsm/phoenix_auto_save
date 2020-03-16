defmodule PhoenixAutoSaveWeb.PageController do
  use PhoenixAutoSaveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
