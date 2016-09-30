defmodule ProjectEuler.Problem1 do
  @moduledoc """
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

  Find the sum of all the multiples of 3 or 5 below 1000.
  """

  @doc ~S"""
  Calculates the sum of all the multiples of 3 or 5 below `limit`.

   ## Examples

      iex> ProjectEuler.Problem1.solve(10)
      23

      iex> ProjectEuler.Problem1.solve
      233168
  """
  def solve(limit \\1000) do
    (1..limit-1)
    |> Stream.filter(fn(num) -> 0 == rem(num, 3) or 0 == rem(num, 5) end)
    |> Enum.sum
  end
end
