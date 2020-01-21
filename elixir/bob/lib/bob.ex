defmodule Bob do
  def hey(input) do
    last_char = input
    |> String.split("", trim: true)
    |> List.last

    case last_char do
      "?" -> "Sure."
      "!" -> "Whoa, chill out!"
      _ -> "Whatever."
    end
  end
end
