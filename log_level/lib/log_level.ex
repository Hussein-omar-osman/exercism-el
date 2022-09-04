defmodule LogLevel do
  @spec to_label(any, any) :: :debug | :error | :fatal | :info | :trace | :unknown | :warning
  def to_label(level, legacy) do
    # Please implement the to_label/2 function
    cond do
      level == 0 ->
        cond do
          legacy -> :unknown
          true -> :trace
        end

      level == 1 ->
        :debug

      level == 2 ->
        :info

      level == 3 ->
        :warning

      level == 4 ->
        :error

      level == 5 ->
        cond do
          legacy -> :unknown
          true -> :fatal
        end

      true ->
        :unknown
    end
  end

  @spec alert_recipient(any, any) :: :dev1 | :dev2 | false | :ops
  def alert_recipient(level, legacy) do
    # Please implement the alert_recipient/2 function
    label = to_label(level, legacy)

    case label do
      n when n == :error or n == :fatal ->
        :ops

      :unknown ->
        case legacy do
          true -> :dev1
          false -> :dev2
        end

      _ ->
        false
    end
  end
end
