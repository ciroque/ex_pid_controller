defmodule ExPidControllerBehaviour do
  @moduledoc """

  Public interface definition for ExPidController.

  """

  @typedoc """
  The values needed to initialize the PID Controller.

  `proportional_gain`: Used to tune the proportional calculation.

  `integral_gain`: Used to tune the integral calculation.

  `derivative_gain`: Used to tune th derivative calculation.

  """
  @type initialization_t :: %{
          proportional_gain: float(),
          integral_gain: float(),
          derivative_gain: float()
        }

  @typedoc """
  Set Point. The desired value.

  Often denoted as `r(t)`.
  """
  @type set_point_t :: float()

  @typedoc """
  Process variable, the output from the control action.

  Often denoted as `y(t)`.
  """
  @type process_variable_t :: float()

  @typedoc """
  Control variable. The corrective value to apply in the control function.

  The result of the PID calculation which represents the Manipulated Value that incorporates the past, current, and
  predicted future value of the error.
  """
  @type control_variable_t :: float()

  @doc """
  Initialze the instance.
  """
  @callback start_link(initialization_t) :: GenServer.on_start()

  @doc """
  Main entry point to trigger PID calcaulations.
  """
  @callback input(%{set_point: set_point_t, process_variable: process_variable_t}) ::
              {:ok, control_variable_t}
              | {:error, any()}
end
