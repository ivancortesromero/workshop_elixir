defmodule WorkshopWeb.PageController do
  use WorkshopWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
