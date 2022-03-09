defmodule Reservations.Core.ReservationRules do
  alias Reservations.Data.Restaurant
  @type restaurant :: Restaurant.t()

  @spec create_restaurant(String.t(), integer()) :: restaurant()
  def create_restaurant(name, num_tables) do
    Restaurant.new(name, num_tables)
  end

  def make_reservation(%{tables: tables} = restaurant, {name, seats}) do
    new_table = %{
      food_plate: "Steak",
      forks: seats,
      knives: seats,
      name: name,
      seats: seats,
      spoons: seats
    }

    %{restaurant | tables: tables ++ [new_table]}
  end
end
