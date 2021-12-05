defmodule Day3 do
  def power_consumption(report) do
    frequencies =
      report
      |> Enum.zip_with(& &1)
      |> Enum.map(&Enum.frequencies/1)

    calculate(:most, frequencies) * calculate(:least, frequencies)
  end

  defp calculate(strategy, frequencies) do
    frequencies
    |> Enum.map(&common_bit(strategy, &1))
    |> Enum.join()
    |> Integer.parse(2)
    |> elem(0)
  end

  defp common_bit(:most, map) do
    if map[0] > map[1], do: 0, else: 1
  end

  defp common_bit(:least, map) do
    if map[0] > map[1], do: 1, else: 0
  end
end
