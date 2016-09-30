defmodule ProjectEuler.Problem3 do
  @moduledoc """
  The prime factors of 13195 are 5, 7, 13 and 29.

  What is the largest prime factor of the number 600851475143 ?
  """

  @doc ~S"""
  Calculates the largest prime factor of the `number`.

   ## Examples

      iex> ProjectEuler.Problem3.solve(13195)
      29

      iex> ProjectEuler.Problem3.solve(600851475143)
      6857
  """
  def solve(number), do: largest_prime_factor(number, 2)

  defp largest_prime_factor(number, factor) do
    case {div(number, factor), rem(number, factor)} do
      {1, 0} ->
        factor
      {_, 0} ->
        largest_prime_factor(div(number, factor), factor+1)
      {_, _} ->
        largest_prime_factor(number, factor+1)
    end
  end
end
