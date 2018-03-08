defmodule RobotTest do
  use ExUnit.Case
  doctest ToyRobot.Robot

  import ExUnit.CaptureIO

  test "default Robot" do
    subject = %ToyRobot.Robot{}
    assert subject.x == 0
    assert subject.y == 0
    assert subject.facing == "NORTH"
  end

  test "construct Robot at x: 1" do
    subject = %ToyRobot.Robot{x: 1}
    assert subject.x == 1
  end

  test "construct Robot at y: 2" do
    subject = %ToyRobot.Robot{y: 2}
    assert subject.y == 2
  end

  test "construct Robot at facing: NORTH" do
    subject = %ToyRobot.Robot{facing: "NORTH"}
    assert subject.facing == "NORTH"
  end

  test "default Robot report " do
    subject = %ToyRobot.Robot{}
    assert capture_io(
      fn -> ToyRobot.Robot.report(subject, "") end
    ) == "0, 0, NORTH\n"
  end
end
