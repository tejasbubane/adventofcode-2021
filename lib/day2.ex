defmodule Day2 do
  # part 1
  def position_depth(commands) do
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

  # part 2
  def plan_course(commands) do
    commands
    |> Enum.reduce({0, 0, 0}, &navigate_with_aim/2)
    |> Tuple.delete_at(2)
    |> Tuple.product()
  end

  defp navigate_with_aim([:forward, steps], {pos, depth, aim}) do
    {pos + steps, depth + aim * steps, aim}
  end

  defp navigate_with_aim([:down, steps], {pos, depth, aim}) do
    {pos, depth, aim + steps}
  end

  defp navigate_with_aim([:up, steps], {pos, depth, aim}) do
    {pos, depth, aim - steps}
  end
end
