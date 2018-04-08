defmodule ExPidController do
  @moduledoc """
  Documentation for ExPidController.
  """

  @behaviour ExPidControllerBehaviour

  use GenServer

  ## Public API

  def input(%{set_point: _set_point, process_variable: _process_variable}) do
    {:ok, 0.0}
  end

  ## GenServer

  def start_link(
        %{
          proportional_gain: _,
          integral_gain: _,
          derivative_gain: _
        } = opts
      ) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(state) do
    {:ok, state}
  end

  ## Implementations
end
