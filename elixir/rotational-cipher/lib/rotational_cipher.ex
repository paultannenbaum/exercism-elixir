defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.split(" ", trim: true)
    |> Enum.map(&rotate_word(&1, shift))
    |> Enum.join(" ")
  end

  @spec rotate_word(word :: String.t(), shift :: integer) :: String.t()
  defp rotate_word(word, shift) do
    word
    |> String.to_charlist
    |> Enum.map(fn x ->
      lowercase_letter? = (?a <= x and x <= ?z)
      uppercase_letter? = (?A <= x and x <= ?Z)
      cond do
        lowercase_letter? ->
          rotate_char(x, shift, ?a, ?z)
        uppercase_letter? ->
          rotate_char(x, shift, ?A, ?Z)
        true ->
          x
      end
    end)
    |> to_string
  end

  @spec rotate_char(start :: integer, shift :: integer, low :: integer, high :: integer) :: integer
  defp rotate_char(start, shift, low, high) do
    if start+shift <= high do
      start+shift
    else
      low+(start+shift-high-1)
    end
  end
end
