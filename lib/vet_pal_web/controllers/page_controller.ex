defmodule VetPalWeb.PageController do
  use VetPalWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
