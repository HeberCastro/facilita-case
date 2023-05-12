defmodule FacilitaCase.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FacilitaCaseWeb.Telemetry,
      # Start the Ecto repository
      FacilitaCase.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: FacilitaCase.PubSub},
      # Start Finch
      {Finch, name: FacilitaCase.Finch},
      # Start the Endpoint (http/https)
      FacilitaCaseWeb.Endpoint
      # Start a worker by calling: FacilitaCase.Worker.start_link(arg)
      # {FacilitaCase.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FacilitaCase.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FacilitaCaseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
