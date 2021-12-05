defmodule Day3 do
  # Part 1
  def power_consumption(report) do
    integer_of(common_bits(report, :most)) * integer_of(common_bits(report, :least))
  end

  # Part 2
  def life_support_rating(report, size) do
    oxygen_rating(report, size) * co2_scrubber_rating(report, size)
  end

  def oxygen_rating(report, size), do: report |> rating(:most, size)

  def co2_scrubber_rating(report, size), do: report |> rating(:least, size)

  # Private functions
  defp rating(report, strategy, bit_length) do
    Enum.to_list(0..bit_length)
    |> Enum.reduce(report, fn i, acc -> filter(acc, i, strategy) end)
    |> List.first()
    |> integer_of()
  end

  # Filters if list has more than one elements
  defp filter([x], _, _), do: [x]

  defp filter(report, index, strategy) do
    bits = report |> common_bits(strategy) |> List.to_tuple()
    report |> Enum.filter(fn item -> elem(List.to_tuple(item), index) == elem(bits, index) end)
  end

  defp integer_of(common_bits) do
    common_bits |> Enum.join() |> Integer.parse(2) |> elem(0)
  end

  def common_bits(report, strategy) do
    report |> transpose() |> Enum.map(&Enum.frequencies/1) |> Enum.map(&common_bit(strategy, &1))
  end

  defp transpose(list_of_lists) do
    list_of_lists |> Enum.zip_with(& &1)
  end

  defp common_bit(:most, map) do
    if map[1] >= map[0], do: 1, else: 0
  end

  defp common_bit(:least, map) do
    if map[0] <= map[1], do: 0, else: 1
  end
end
