defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @dict [M: 1000, D: 500, C: 100, L: 50, X: 10, V: 5, I: 1]

  @spec numeral(pos_integer) :: String.t()
  def numeral(number, acc \\ "") do
    cond do
      Enum.each(@dict, fn {k,v} ->
        number - v >= 0 -> numeral(number - v, acc <> k)
      end)
      true -> acc
    end
  end
end
