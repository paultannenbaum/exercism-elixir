defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(" ", trim: true)
    |> Enum.map(&(String.capitalize(String.at(&1, 0))))
    |> Enum.join("")
  end
end
