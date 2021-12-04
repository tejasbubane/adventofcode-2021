ExUnit.start()

defmodule Parser do
  def lines_to_list(filename) do
    File.read!(filename) |> String.split("\n", trim: true) |> Enum.map(&String.to_integer/1)
  end
end
