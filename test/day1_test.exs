defmodule Day1Test do
  use ExUnit.Case

  test "increments - works for give example" do
    assert Day1.increments([199, 200, 208, 210, 200, 207, 240, 269, 260, 263]) == 7
  end

  test "increments - finds solution" do
    assert Day1.increments(Parser.lines_to_list("inputs/day1")) == 1288
  end
end
