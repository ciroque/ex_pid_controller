defmodule ExPidControllerTest do
  use ExUnit.Case
  doctest ExPidController

  test "greets the world" do
    assert ExPidController.hello() == :world
  end
end
