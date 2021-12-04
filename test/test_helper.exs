ExUnit.start()

defmodule Parser do
  def lines_to_list(filename) do
    File.read!(filename) |> String.split("\n", trim: true)
  end

  def to_ints(list) do
    list |> Enum.map(&String.to_integer/1)
  end
end
