defmodule RnboWeb.PageController do
  use RnboWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
