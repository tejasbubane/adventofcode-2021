defmodule Day3Test do
  use ExUnit.Case
  import Parser

  def parse_report(lines) do
    lines
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(fn a -> a |> Enum.map(&String.to_integer/1) end)
  end

  test "part 1 - works for given example" do
    assert Day3.power_consumption([
             [0, 0, 1, 0, 0],
             [1, 1, 1, 1, 0],
             [1, 0, 1, 1, 0],
             [1, 0, 1, 1, 1],
             [1, 0, 1, 0, 1],
             [0, 1, 1, 1, 1],
             [0, 0, 1, 1, 1],
             [1, 1, 1, 0, 0],
             [1, 0, 0, 0, 0],
             [1, 1, 0, 0, 1],
             [0, 0, 0, 1, 0],
             [0, 1, 0, 1, 0]
           ]) == 198
  end

  test "part 1 - solves the puzzle" do
    assert Day3.power_consumption(lines_to_list("inputs/day3") |> parse_report) == 852_500
  end
end
