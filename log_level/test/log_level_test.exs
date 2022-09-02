defmodule LogLevelTest do
  use ExUnit.Case
  doctest LogLevel

  describe "LogLevel.to_label/2" do
    @tag task_id: 1
    test "level 0 has label trace only in a non-legacy app" do
      assert LogLevel.to_label(0, false) == :trace
      assert LogLevel.to_label(0, true) == :unknown
    end

    @tag task_id: 1
    test "level 1 has label debug" do
      assert LogLevel.to_label(1, false) == :debug
      assert LogLevel.to_label(1, true) == :debug
    end

    @tag task_id: 1
    test "level 2 has label info" do
      assert LogLevel.to_label(2, false) == :info
      assert LogLevel.to_label(2, true) == :info
    end

    @tag task_id: 1
    test "level 3 has label warning" do
      assert LogLevel.to_label(3, false) == :warning
      assert LogLevel.to_label(3, true) == :warning
    end

    @tag task_id: 1
    test "level 4 has label error" do
      assert LogLevel.to_label(4, false) == :error
      assert LogLevel.to_label(4, true) == :error
    end

    @tag task_id: 1
    test "level 5 has label fatal only in a non-legacy app" do
      assert LogLevel.to_label(5, false) == :fatal
      assert LogLevel.to_label(5, true) == :unknown
    end

    @tag task_id: 1
    test "level 6 has label unknown" do
      assert LogLevel.to_label(6, false) == :unknown
      assert LogLevel.to_label(6, true) == :unknown
    end

    @tag task_id: 1
    test "level -1 has label unknown" do
      assert LogLevel.to_label(-1, false) == :unknown
      assert LogLevel.to_label(-1, true) == :unknown
    end
  end
end
