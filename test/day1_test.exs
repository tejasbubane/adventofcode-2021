defmodule Day1Test do
  use ExUnit.Case
  import Parser

  test "part 1 - works for given example" do
    assert Day1.increments([199, 200, 208, 210, 200, 207, 240, 269, 260, 263]) == 7
  end

  test "part 1 - finds solution" do
    assert Day1.increments(lines_to_list("inputs/day1") |> to_ints) == 1288
  end

  test "part 2 - works for given example" do
    assert Day1.window_sum_increments([199, 200, 208, 210, 200, 207, 240, 269, 260, 263]) == 5
  end

  test "part 2 - finds solution" do
    assert Day1.window_sum_increments(lines_to_list("inputs/day1") |> to_ints) == 1311
  end
end
