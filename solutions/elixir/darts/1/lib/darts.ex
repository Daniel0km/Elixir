defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  
  def score({x, y}) do
    distancia = x * x + y * y

    cond do
      distancia <= 1 -> 10
      distancia <= 25 -> 5
      distancia <= 100 -> 1
      true -> 0
    end
  end
end
