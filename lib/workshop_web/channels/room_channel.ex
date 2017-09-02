defmodule WorkshopWeb.RoomChannel do
  use WorkshopWeb, :channel

	alias Workshop.Chat
  require Logger

  def join("room:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", %{"user_name" => user, "user_message" => message} = payload,socket) do
    filtered = message |> to_string
                       |> String.replace("hp", "**")
                       |> String.replace("gonorrea", "******")
                       |> String.replace("marica", "******")
                       |> String.replace("joder", "******")
                       |> String.replace("pichurria", "******")
                       |> String.replace("maricón", "******")
                       |> String.replace("huevón", "******")
    payload = %{payload | "user_message" => filtered}
    case Chat.create_log(%{user: user, message: filtered}) do
      {:ok, _} ->
        broadcast socket, "shout", payload
      {:error, _} ->
        Logger.info("Error saving with payload: #{inspect payload}")
    end
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end

