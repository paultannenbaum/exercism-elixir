defmodule Bob do
  def hey(input) do
    s = String.trim(input)
    u = String.upcase(s)
    l = String.last(s)

    cond do
      u == s and l == "?" -> "Calm down, I know what I'm doing!"
      s == "" -> "Fine. Be that way!"
      u == s -> "Whoa, chill out!"
      l == "?" -> "Sure."
      true -> "Whatever."
    end
  end
end
