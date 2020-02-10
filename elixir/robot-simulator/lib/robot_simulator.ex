defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """

  @directions [:north, :east, :south, :west]

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
      cond do
        !valid_direction?(direction) ->
          {:error,  "invalid direction"}
        !valid_position?(position) ->
          {:error,  "invalid position"}
        true -> %{direction: direction, position: position}
      end
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    %{direction: direction, position: position} = robot
    {x, y} = position
    {instruction, rest} = String.split_at(instructions, 1)

    case {instruction, direction} do
      {"R", :north} -> simulate(create(:east, position), rest)
      {"R", :east}  -> simulate(create(:south, position), rest)
      {"R", :south} -> simulate(create(:west, position), rest)
      {"R", :west}  -> simulate(create(:north, position), rest)

      {"L", :north} -> simulate(create(:west, position), rest)
      {"L", :east}  -> simulate(create(:north, position), rest)
      {"L", :south} -> simulate(create(:east, position), rest)
      {"L", :west}  -> simulate(create(:south, position), rest)

      {"A", :north} -> simulate(create(direction, {x, y + 1}), rest)
      {"A", :east}  -> simulate(create(direction, {x + 1, y}), rest)
      {"A", :south} -> simulate(create(direction, {x, y - 1}), rest)
      {"A", :west}  -> simulate(create(direction, {x - 1, y}), rest)

      {"", _} -> robot
      {_, _}   -> {:error, "invalid instruction"}
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot), do: robot.position


  defp valid_direction?(direction) do
    is_atom(direction) and Enum.member?(@directions, direction)
  end

  defp valid_position?(position) do
    is_tuple(position) and
    tuple_size(position) == 2 and
    is_integer(elem(position, 0)) and
    is_integer(elem(position, 1))
  end
end
