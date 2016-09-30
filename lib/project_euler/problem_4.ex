defmodule ProjectEuler.Problem4 do
  @moduledoc """
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

  Find the largest palindrome made from the product of two 3-digit numbers.
  """

  @doc ~S"""
  Calculates the palindrome made from the product of two `n`-digit numbers.

   ## Examples

      iex> ProjectEuler.Problem4.solve(2)
      9009

      iex> ProjectEuler.Problem4.solve(3)
      906609
      
  """
  def solve(n) do 
    l = "1#{1..n-1 |> Enum.map(fn(_) -> 0 end) |> Enum.join}" |> String.to_integer
    r = "9#{1..n-1 |> Enum.map(fn(_) -> 9 end) |> Enum.join}" |> String.to_integer
    l..r
    |> products(l..r)
    |> Enum.filter(&palindrome?/1)
    |> Enum.max
  end

  defp products(l, r) do
    Enum.flat_map l, fn(m) ->
      Enum.map r, fn(n) ->
        m * n
      end
    end
  end

  defp palindrome?(n) do
    chars = Integer.to_char_list(n)
    chars == Enum.reverse(chars)
  end
end