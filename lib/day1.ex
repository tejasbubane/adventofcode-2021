defmodule Day1 do
  def increments(depths) do
    depths
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
  end
end
