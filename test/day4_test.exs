defmodule Day4Test do
  use ExUnit.Case
  import Parser

  def init(board) do
    board |> Enum.map(fn board -> board |> Enum.map(&{&1, :unmarked}) end)
  end

  setup do
    example_numbers = [
      7,
      4,
      9,
      5,
      11,
      17,
      23,
      2,
      0,
      14,
      21,
      24,
      10,
      16,
      13,
      6,
      15,
      25,
      12,
      22,
      18,
      20,
      8,
      19,
      3,
      26,
      1
    ]

    example_boards = [
      [22, 13, 17, 11, 0, 8, 2, 23, 4, 24, 21, 9, 14, 16, 7, 6, 10, 3, 18, 5, 1, 12, 20, 15, 19],
      [3, 15, 0, 2, 22, 9, 18, 13, 17, 5, 19, 8, 7, 25, 23, 20, 11, 10, 24, 4, 14, 21, 16, 12, 6],
      [14, 21, 17, 24, 4, 10, 16, 15, 9, 19, 18, 8, 23, 26, 20, 22, 11, 13, 6, 5, 2, 0, 12, 3, 7]
    ]

    [nums | boards] = lines_to_list("inputs/day4")
    puzzle_numbers = nums |> String.split(",", trim: true) |> to_ints()

    puzzle_boards =
      boards
      |> Enum.chunk_every(5)
      |> Enum.map(&Enum.join(&1, " "))
      |> Enum.map(&String.split/1)
      |> Enum.map(&to_ints/1)

    {:ok,
     example_numbers: example_numbers,
     example_boards: init(example_boards),
     puzzle_numbers: puzzle_numbers,
     puzzle_boards: puzzle_boards}
  end

  test "part 1 - works for given example", context do
    assert Day4.play(context[:example_numbers], context[:example_boards]) == 4512
  end

  test "part 1 - solves the puzzle", context do
    assert Day4.play(context[:puzzle_numbers], init(context[:puzzle_boards])) == 11536
  end
end
