defmodule Day4 do
  def play(numbers, boards) do
    numbers
    |> Enum.reduce({:go, boards}, &draw_boards/2)
    |> elem(1)
    |> score
  end

  defp score({board, number}) do
    number *
      (board
       |> Enum.filter(fn board -> elem(board, 1) == :unmarked end)
       |> Enum.map(fn {n, _} -> n end)
       |> Enum.sum())
  end

  defp draw_boards(_, result = {:won, _}), do: result

  defp draw_boards(number, {:go, boards}) do
    marked = boards |> Enum.map(&mark(&1, number))

    if winner = Enum.find(marked, &winner?/1) do
      {:won, {winner, number}}
    else
      {:go, marked}
    end
  end

  defp winner?(board) do
    row_board = board |> Enum.chunk_every(5)
    column_board = row_board |> Enum.zip_with(& &1)

    check(row_board) || check(column_board)
  end

  defp check(board) do
    board |> Enum.any?(fn x -> x |> Enum.all?(&(elem(&1, 1) == :marked)) end)
  end

  defp mark(board, number) do
    board |> Enum.map(fn sq = {n, _} -> if n == number, do: {n, :marked}, else: sq end)
  end
end
