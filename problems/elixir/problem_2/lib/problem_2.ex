defmodule Problem2 do
  require Integer
  @moduledoc """
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

  1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
  """

  @doc ~S"""
  Calculates the sum of the even-valued terms up to `limit` of the Fibonacci sequence.

   ## Examples

      iex> Problem2.solve(89)
      44

      iex> Problem2.solve(4_000_000)
      4613732
  """
  def solve(limit \\4_000_000 ) do
    fibonacci_stream
    |> Stream.take_while(&(&1 <= limit))
    |> Stream.filter(&Integer.is_even/1)
    |> Enum.sum
  end

  defp fibonacci_stream do
    Stream.unfold({1, 1}, fn {a, b} ->  
      {a, {b, a + b}}
    end)
  end
end
