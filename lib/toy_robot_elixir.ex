defmodule ToyRobot do
  @moduledoc """
  Documentation for ToyRobot.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ToyRobot.hello
      :world

  """
  def hello do
    :world
  end

  defmodule Robot do
    defstruct x: 0, y: 0, facing: "NORTH"

    @turn %{
      "NORTH" => %{"LEFT" => "WEST",  "RIGHT" => "EAST"},
      "SOUTH" => %{"LEFT" => "EAST",  "RIGHT" => "WEST"},
      "EAST"  => %{"LEFT" => "NORTH", "RIGHT" => "SOUTH"},
      "WEST"  => %{"LEFT" => "SOUTH", "RIGHT" => "NORTH"}
    }

    def report(robot, _ \\ ""), do: IO.puts "#{robot.x}, #{robot.y}, #{robot.facing}"
    def left(robot, _ \\ ""), do: %{robot | facing: @turn[robot.facing]["LEFT"]}
  end
end
