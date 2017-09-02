defmodule WorkshopWeb.LogController do
  use WorkshopWeb, :controller

  alias Workshop.Chat
  alias Workshop.Chat.Log

  def index(conn, _params) do
    logs = Chat.list_logs()
    render(conn, "index.html", logs: logs)
  end
end
