defmodule Day3Test do
  use ExUnit.Case
  import Parser

  setup do
    example_input = [
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
    ]

    puzzle_input =
      lines_to_list("inputs/day3")
      |> Enum.map(&String.split(&1, "", trim: true))
      |> Enum.map(fn a -> a |> Enum.map(&String.to_integer/1) end)

    {:ok, example_input: example_input, puzzle_input: puzzle_input}
  end

  test "part 1 - works for given example", context do
    assert Day3.power_consumption(context[:example_input]) == 198
  end

  test "part 1 - solves the puzzle", context do
    assert Day3.power_consumption(context[:puzzle_input]) == 852_500
  end

  test "oxygen_rating - works for given example", context do
    assert Day3.oxygen_rating(context[:example_input], 4) == 23
  end

  test "co2_scrubber_rating - works for given example", context do
    assert Day3.co2_scrubber_rating(context[:example_input], 4) == 10
  end

  test "part 2 - works for given example", context do
    assert Day3.life_support_rating(context[:example_input], 4) == 230
  end

  test "part 2 - solves the puzzle", context do
    assert Day3.life_support_rating(context[:puzzle_input], 11) == 1_007_985
  end
end
