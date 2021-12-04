defmodule Day2Test do
  use ExUnit.Case
  import Parser

  def parse_commands(lines) do
    lines
    |> Enum.map(fn s -> s |> String.split(" ") end)
    |> Enum.map(fn [a, b] -> [String.to_atom(a), String.to_integer(b)] end)
  end

  test "part 1 - works for given example" do
    assert Day2.position_depth([
             [:forward, 5],
             [:down, 5],
             [:forward, 8],
             [:up, 3],
             [:down, 8],
             [:forward, 2]
           ]) == 150
  end

  test "part 1 - finds solution" do
    assert Day2.position_depth(lines_to_list("inputs/day2") |> parse_commands) == 1_692_075
  end

  test "part 2 - works for given example" do
    assert Day2.plan_course([
             [:forward, 5],
             [:down, 5],
             [:forward, 8],
             [:up, 3],
             [:down, 8],
             [:forward, 2]
           ]) == 900
  end

  test "part 2 - finds solution" do
    assert Day2.plan_course(lines_to_list("inputs/day2") |> parse_commands) == 1_749_524_700
  end
end
