defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_head|tail]), do: 1 + count(tail)

  @spec reverse(list) :: list
  def reverse(list), do: priv_reverse(list, [])
  # Make private so only only reverse/1 is available
  defp priv_reverse([], acc), do: acc
  defp priv_reverse([head|tail], acc), do: priv_reverse(tail, [head|acc])

  @spec map(list, (any -> any)) :: list
  def map([], _), do: []
  def map([head|tail], f) do
    [f.(head)|map(tail, f)]
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter([head|tail], f) do
    if f.(head) do
      [head|filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head|tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reverse(a) |> priv_reverse(b)
  end

  @spec concat([[any]]) :: [any]
  def concat(list) do
    reverse(list)
    |> reduce([], fn list, acc -> append(list, acc) end)
  end
end
