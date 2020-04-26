defmodule Covid66liveWeb.Counter do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, val: 0, x: "x")}
  end

  def handle_event("inc", _, socket) do
    update_socket = update(socket, :val, &(&1 + 1))
    {:noreply, assign(update_socket, x: "y")}
  end

  def handle_event("dec", _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end

  def render(assigns) do
    ~L"""
    <div>
      <h1>The count is: <%= @val %><%= @x %></h1>
      <button phx-click="dec">-</button>
      <button phx-click="inc">+</button>
    </div>
    """
  end
end
