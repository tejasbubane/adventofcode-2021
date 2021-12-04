defmodule Day2 do
  def position(commands) do
    commands |> Enum.reduce({0, 0}, &navigate/2) |> Tuple.product()
  end

  defp navigate([:forward, steps], {pos, depth}) do
    {pos + steps, depth}
  end

  defp navigate([:down, steps], {pos, depth}) do
    {pos, depth + steps}
  end

  defp navigate([:up, steps], {pos, depth}) do
    {pos, depth - steps}
  end
end
