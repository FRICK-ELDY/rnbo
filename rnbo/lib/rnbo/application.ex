defmodule Rnbo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      RnboWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rnbo.PubSub},
      # Start the Endpoint (http/https)
      RnboWeb.Endpoint
      # Start a worker by calling: Rnbo.Worker.start_link(arg)
      # {Rnbo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rnbo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RnboWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
