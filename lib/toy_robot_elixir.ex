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

    @move %{
      "NORTH" => %{:x =>  0, :y =>  1},
      "SOUTH" => %{:x =>  0, :y => -1},
      "EAST"  => %{:x =>  1, :y =>  0},
      "WEST"  => %{:x => -1, :y =>  0}
    }

    @separators_regex ~r/[ |,\s*]/

    @turn %{
      "NORTH" => %{"LEFT" => "WEST",  "RIGHT" => "EAST"},
      "SOUTH" => %{"LEFT" => "EAST",  "RIGHT" => "WEST"},
      "EAST"  => %{"LEFT" => "NORTH", "RIGHT" => "SOUTH"},
      "WEST"  => %{"LEFT" => "SOUTH", "RIGHT" => "NORTH"}
    }

    def report(robot, _ \\ ""), do: IO.puts "#{robot.x}, #{robot.y}, #{robot.facing}"
    def left(robot, _ \\ ""), do: %{robot | facing: @turn[robot.facing]["LEFT"]}
    def right(robot, _ \\ ""), do: %{robot | facing: @turn[robot.facing]["RIGHT"]}

    def move(%Robot{x: x, y: y, facing: facing} = robot, _ \\ "") do
      cond do
        (y == 0 and facing == "SOUTH") or (y == 4 and facing == "NORTH") ->
          %{robot | x: x + @move[facing][:x] }
        (x == 0 and facing == "WEST") or (x == 4 and facing == "EAST") ->
          %{robot | y: y + @move[facing][:y] }
        true ->
          %{robot | x: x + @move[facing][:x], y: y + @move[facing][:y] }
      end
    end

    def place(_robot, coordinates) do
      [dx, dy, dfacing] = String.split(coordinates, @separators_regex)
      {xi, _} = Integer.parse(dx)
      {yi, _} = Integer.parse(dy)
      %Robot{x: xi, y: yi, facing: dfacing}
    end
  end
end
