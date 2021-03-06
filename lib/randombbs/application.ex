defmodule Randombbs.Application do
  use Application
  require Logger

  @impl true
  def start(_type, _args) do
  children = [
      {Plug.Cowboy, scheme: :http, plug: Randombbs.Router, options: [port: 8080]}
    ]
    opts = [strategy: :one_for_one, name: Randombbs.Supervisor]

    Logger.info("Starting plug application...")

    Supervisor.start_link(children, opts)
  end
end
