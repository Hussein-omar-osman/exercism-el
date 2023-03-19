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
       level == 1 -> :debug
       level == 2 -> :info
       level == 3 -> :warning
       level == 4 -> :error
       level == 5 ->
        cond do
          legacy -> :unknown
          true -> :fatal
        end
       true -> :unknown
     end


  end

end
