defmodule Day1 do
  def increments(depths) do
    depths
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
  end

  def window_sum_increments(list) do
    list |> Enum.chunk_every(3, 1, :discard) |> Enum.map(&Enum.sum/1) |> increments()
  end
end
