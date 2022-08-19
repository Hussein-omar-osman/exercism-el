defmodule GuessingTest do
  use ExUnit.Case

  @tag task_id: 1
  test "correct when the guessed number equals secret" do
    assert Guessing.compare(7, 7) == "Correct"
  end

  @tag task_id: 2
  test "too high when guessed number is greater than the secret" do
    assert Guessing.compare(9, 18) == "Too high"
  end

  @tag task_id: 3
  test "too low when guessed number is less than the secret" do
    assert Guessing.compare(42, 30) == "Too low"
  end

  @tag task_id: 4
  test "so close when guess differs from secret by -1" do
    assert Guessing.compare(64, 63) == "So close"
  end

  @tag task_id: 4
  test "so close when guess differs from secret by +1" do
    assert Guessing.compare(52, 53) == "So close"
  end

  @tag task_id: 5
  test "when no guess is supplied, ask the player to make a guess" do
    assert Guessing.compare(15) == "Make a guess"
  end

  @tag task_id: 5
  test "when the atom :no_guess is supplied, ask the player to make a guess" do
    assert Guessing.compare(16, :no_guess) == "Make a guess"
  end
end
