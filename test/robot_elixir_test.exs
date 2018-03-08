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

  test "default Robot report" do
    subject = %ToyRobot.Robot{}
    assert capture_io(
      fn -> ToyRobot.Robot.report(subject) end
    ) == "0, 0, NORTH\n"
  end

  test "turn Robot left" do
    subject = %ToyRobot.Robot{}
    new_subject = ToyRobot.Robot.left(subject)
    assert new_subject.facing == "WEST"
  end

  test "turn Robot right" do
    subject = %ToyRobot.Robot{}
    new_subject = ToyRobot.Robot.right(subject)
    assert new_subject.facing == "EAST"
  end

  test "move Robot to 0,1,NORTH" do
    subject = %ToyRobot.Robot{}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 0
    assert new_subject.y == 1
    assert new_subject.facing == "NORTH"
  end

  test "move Robot to 1,0,EAST" do
    subject = %ToyRobot.Robot{facing: "EAST"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 1
    assert new_subject.y == 0
    assert new_subject.facing == "EAST"
  end

  test "move Robot from 0,3,SOUTH to 0,2,SOUTH" do
    subject = %ToyRobot.Robot{y: 3, facing: "SOUTH"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 0
    assert new_subject.y == 2
    assert new_subject.facing == "SOUTH"
  end

  test "move Robot from 2,1,WEST to 1,1,WEST" do
    subject = %ToyRobot.Robot{x: 2, y: 1, facing: "WEST"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 1
    assert new_subject.y == 1
    assert new_subject.facing == "WEST"
  end

  test "Robot does not move off the table from 0,4,NORTH" do
    subject = %ToyRobot.Robot{x: 0, y: 4, facing: "NORTH"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 0
    assert new_subject.y == 4
    assert new_subject.facing == "NORTH"
  end

  test "Robot does not move off the table from 4,4,NORTH" do
    subject = %ToyRobot.Robot{x: 4, y: 4, facing: "NORTH"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 4
    assert new_subject.y == 4
    assert new_subject.facing == "NORTH"
  end

  test "Robot does not move off the table from 0,0,SOUTH" do
    subject = %ToyRobot.Robot{x: 0, y: 0, facing: "SOUTH"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 0
    assert new_subject.y == 0
    assert new_subject.facing == "SOUTH"
  end

  test "Robot does not move off the table from 4,0,SOUTH" do
    subject = %ToyRobot.Robot{x: 4, y: 0, facing: "SOUTH"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 4
    assert new_subject.y == 0
    assert new_subject.facing == "SOUTH"
  end

  test "Robot does not move off the table from 0,0,WEST" do
    subject = %ToyRobot.Robot{x: 0, y: 0, facing: "WEST"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 0
    assert new_subject.y == 0
    assert new_subject.facing == "WEST"
  end

  test "Robot does not move off the table from 0,4,WEST" do
    subject = %ToyRobot.Robot{x: 0, y: 4, facing: "WEST"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 0
    assert new_subject.y == 4
    assert new_subject.facing == "WEST"
  end

  test "Robot does not move off the table from 4,0,EAST" do
    subject = %ToyRobot.Robot{x: 4, y: 0, facing: "EAST"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 4
    assert new_subject.y == 0
    assert new_subject.facing == "EAST"
  end

  test "Robot does not move off the table from 4,4,EAST" do
    subject = %ToyRobot.Robot{x: 4, y: 4, facing: "EAST"}
    new_subject = ToyRobot.Robot.move(subject)
    assert new_subject.x == 4
    assert new_subject.y == 4
    assert new_subject.facing == "EAST"
  end
end
