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

    def report(robot, _), do: IO.puts "#{robot.x}, #{robot.y}, #{robot.facing}"
  end
end
