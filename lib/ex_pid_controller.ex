defmodule ExPidController do
  @moduledoc """
  Documentation for ExPidController.
  """

  @behaviour ExPidControllerBehaviour

  use GenServer

  ## Public API

  def input(%{set_point: set_point, process_variable: process_variable}) do
    GenServer.call(__MODULE__, {:input, set_point, process_variable})
  end

  ## GenServer

  def start_link(), do: start_link(%{p_gain: 1.0, i_gain: 0.0, d_gain: 0.0})

  def start_link(%{p_gain: _, i_gain: _, d_gain: _} = opts),
    do: GenServer.start_link(__MODULE__, opts, name: __MODULE__)

  def init(state), do: {:ok, Map.merge(state, %{previous_error: 0, integral: 0, last_loop_time: :os.system_time(:millisecond)})}

  ## Implementations

  def handle_call(
        {:input, set_point, process_variable},
        _from,
        %{
          p_gain: p_gain,
          i_gain: i_gain,
          d_gain: d_gain,
          previous_error: previous_error,
          integral: integral,
          last_loop_time: last_loop_time
        } = state
      ) do

    interval = (:os.system_time(:millisecond) - last_loop_time)
    error = set_point - process_variable
    proportional = error
    integral = integral + error * interval
    derivative = (error - previous_error) / interval

    output = p_gain * proportional + i_gain * integral + d_gain * derivative

    state = state
    |> Map.put(:previous_error, error)
    |> Map.put(:integral, integral)
    |> Map.put(:last_loop_time, :os.system_time(:millisecond))

    {:reply, output, state}
  end
end

