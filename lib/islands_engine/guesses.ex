defmodule IslandsEngine.Guesses do
  alias IslandsEngine.{Coordinate, Guesses}
  alias __MODULE__

  @enforce_keys [:hits, :misses]
  defstruct [:hits, :misses]

  def new(), do: %Guesses{hits: MapSet.new(), misses: MapSet.new()}

  def add(%Guesses{} = guesess, :hit, %Coordinate{} = coordinate),
    do: update_in(guesess.hits, &MapSet.put(&1, coordinate))

  def add(%Guesses{} = guesess, :miss, %Coordinate{} = coordinate),
    do: update_in(guesess.misses, &MapSet.put(&1, coordinate))
end
