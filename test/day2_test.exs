defmodule Day2Test do
  use ExUnit.Case
  import Parser

  def parse_commands(lines) do
    lines
    |> Enum.map(fn s -> s |> String.split(" ") end)
    |> Enum.map(fn [a, b] -> [String.to_atom(a), String.to_integer(b)] end)
  end

  test "part 1 - works for given example" do
    assert Day2.position([
             [:forward, 5],
             [:down, 5],
             [:forward, 8],
             [:up, 3],
             [:down, 8],
             [:forward, 2]
           ]) == 150
  end

  test "part 1 - finds solution" do
    assert Day2.position(lines_to_list("inputs/day2") |> parse_commands) == 1_692_075
  end
end
