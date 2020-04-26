defmodule Covid66liveWeb.VirusListLive do
  use Phoenix.LiveView
  alias Covid66live.Wiki
  require Logger

  @topic "live"
  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), :tick)

    Covid66liveWeb.Endpoint.subscribe(@topic)

    viruses = Wiki.get_all_viruses()

    {:ok, assign(socket, viruses: viruses, date: NaiveDateTime.local_now())}
  end

  def handle_info(:tick, socket) do
    {:noreply, put_date(socket)}
  end

  defp put_date(socket) do
    assign(socket, date: NaiveDateTime.local_now())
  end

  def render(assigns) do
    Logger.debug "Render"
    ~L"""
    <h1> <%= @date %></h1>
    <div>

    <table>
        <%= for virus <- @viruses do %>
        <tr>
          <td><b><%= virus.name %></b> (<%= virus.code %>)</td>
        </tr>
        <% end %>
      </table>
    </div>
    """
  end
end
