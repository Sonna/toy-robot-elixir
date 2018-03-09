defmodule ToyRobotCLITest do
  use ExUnit.Case
  doctest ToyRobot.CLI

  import ExUnit.CaptureIO

  test "Robot CLI EXIT" do
    # assert capture_io([input: "EXIT", capture_prompt: false], fn ->
    assert capture_io("EXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == ""
  end

  test "Robot CLI REPORT" do
    assert capture_io("REPORT\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == "0, 0, NORTH\n"
  end

  test "Robot CLI MOVE" do
    assert capture_io("MOVE\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == ""
  end

  test "Robot CLI MOVE and then REPORT" do
    assert capture_io("MOVE\nREPORT\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == "0, 1, NORTH\n"
  end

  test "Robot CLI LEFT" do
    assert capture_io("LEFT\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == ""
  end

  test "Robot CLI LEFT and then REPORT" do
    assert capture_io("LEFT\nREPORT\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == "0, 0, WEST\n"
  end

  test "Robot CLI RIGHT" do
    assert capture_io("RIGHT\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == ""
  end

  test "Robot CLI RIGHT and then REPORT" do
    assert capture_io("RIGHT\nREPORT\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == "0, 0, EAST\n"
  end

  test "Robot CLI PLACE" do
    assert capture_io("PLACE 3,3,SOUTH\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == ""
  end

  test "Robot CLI PLACE and then REPORT" do
    assert capture_io("PLACE 3,3,SOUTH\nREPORT\nEXIT\n", fn ->
      assert ToyRobot.CLI.main == :ok
    end) == "3, 3, SOUTH\n"
  end

  test "Robot CLI process_input EXIT" do
    assert capture_io("EXIT\n", fn ->
      assert ToyRobot.CLI.process_input() == :ok
    end) == ""
  end

  test "Robot CLI process_input REPORT" do
    assert capture_io("REPORT\nEXIT\n", fn ->
      assert ToyRobot.CLI.process_input() == :ok
    end) == "0, 0, NORTH\n"
  end

  test "Robot CLI process_input MOVE" do
    assert capture_io("MOVE\nREPORT\nEXIT\n", fn ->
     assert ToyRobot.CLI.process_input() == :ok
    end) == "0, 1, NORTH\n"
  end

  test "Robot CLI process_input LEFT" do
    assert capture_io("LEFT\nREPORT\nEXIT\n", fn ->
     assert ToyRobot.CLI.process_input() == :ok
    end) == "0, 0, WEST\n"
  end

  test "Robot CLI process_input RIGHT" do
    assert capture_io("RIGHT\nREPORT\nEXIT\n", fn ->
     assert ToyRobot.CLI.process_input() == :ok
    end) == "0, 0, EAST\n"
  end

  test "Robot CLI process_input PLACE" do
    assert capture_io("PLACE 2,2,SOUTH\nREPORT\nEXIT\n", fn ->
     assert ToyRobot.CLI.process_input() == :ok
    end) == "2, 2, SOUTH\n"
  end

  test "Robot CLI process example_a.txt file" do
    assert capture_io(fn ->
      ToyRobot.CLI.main ["test/data/example_a.txt"]
    end) == "0, 0, NORTH\n"
  end

  test "Robot CLI process example_b.txt file" do
    assert capture_io(fn ->
      ToyRobot.CLI.main ["test/data/example_b.txt"]
    end) == "0, 1, NORTH\n2, 1, EAST\n"
  end
end
