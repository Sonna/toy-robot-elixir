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

    @turn %{
      "NORTH" => %{"LEFT" => "WEST",  "RIGHT" => "EAST"},
      "SOUTH" => %{"LEFT" => "EAST",  "RIGHT" => "WEST"},
      "EAST"  => %{"LEFT" => "NORTH", "RIGHT" => "SOUTH"},
      "WEST"  => %{"LEFT" => "SOUTH", "RIGHT" => "NORTH"}
    }

    def report(robot, _ \\ ""), do: IO.puts "#{robot.x}, #{robot.y}, #{robot.facing}"
    def left(robot, _ \\ ""), do: %{robot | facing: @turn[robot.facing]["LEFT"]}
    def right(robot, _ \\ ""), do: %{robot | facing: @turn[robot.facing]["RIGHT"]}

    def move(robot, _ \\ "")

    def move(%Robot{x: x, facing: facing} = robot, _) when x >= 0 and facing != "WEST" do
      %{robot | x: robot.x + @move[robot.facing][:x], y: robot.y + @move[robot.facing][:y] }
    end

    # def move(robot, _ \\ "") when robot.x < 4 and robot.facing != "EAST" do
    def move(%Robot{x: x, facing: facing} = robot, _) when x <= 4 and facing != "EAST" do
      %{robot | x: robot.x + @move[robot.facing][:x], y: robot.y + @move[robot.facing][:y] }
    end

    # def move(robot, _ \\ "") when robot.y > 0 and robot.facing != "SOUTH" do
    def move(%Robot{y: y, facing: facing} = robot, _) when y >= 0 and facing != "SOUTH" do
      %{robot | x: robot.x + @move[robot.facing][:x], y: robot.y + @move[robot.facing][:y] }
    end

    # def move(robot, _ \\ "") when robot.y < 4 and robot.facing != "NORTH" do
    def move(%Robot{y: y, facing: facing} = robot, _) when y <= 4 and facing != "NORTH" do
      %{robot | x: robot.x + @move[robot.facing][:x], y: robot.y + @move[robot.facing][:y] }
    end

    # def move(robot, _ \\ "") do
    #   new_robot = %{robot |
    #     x: robot.x + @move[robot.facing][:x],
    #     y: robot.y + @move[robot.facing][:y]
    #   }

    #   if (new_robot.x < 0 || new_robot.x >= 4) do
    #     new_robot = %{new_robot | x: robot.x - @move[robot.facing][:x]}
    #   end

    #   if (new_robot.y < 0 || new_robot.y >= 4) do
    #     new_robot = %{new_robot | y: robot.y - @move[robot.facing][:y]}
    #   end
    #   new_robot
    # end
  end
end
