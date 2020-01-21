defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.graphemes
    |> Enum.chunk_by(fn x -> x end)
    |> Enum.map(fn
      [x | []] -> x
      [h | t] -> Integer.to_string(length(t) + 1) <> h
    end)
    |> Enum.join
  end

  @spec decode(String.t()) :: String.t()
  def decode(string, acc \\ "") do
    {x, tail} =  case Integer.parse(string) do
		    :error ->
		      String.split_at(string, 1)
		    {i, rest} ->
		      {h, t} = String.split_at(rest, 1)
		      {String.duplicate(h, i), t}
		  end

    case String.length(string) do
      0 -> acc
      _ -> decode(tail, acc <> cs)
    end
  end
end
