defmodule Reservations.Core.ReservationRules do
  alias Reservations.Data.Restaurant
  alias Reservations.Data.Table
  @type restaurant :: Restaurant.t()

  @spec create_restaurant(String.t(), integer()) :: restaurant()
  def create_restaurant(name, num_tables) do
    Restaurant.new(name, num_tables)
  end

  def make_reservation(restaurant, {name, seats}) do
    restaurant
    |> check_reservations
    |> create_reservation({name, seats})
  end

  defp check_reservations(restaurant) do
    restaurant
    |> then(&(&1.reserved_tables <= &1.num_tables))
    |> then(&{&1, restaurant})
  end

  defp create_reservation({true, restaurant}, {name, seats}) do
    new_table = Table.new(name, seats)

    %{
      restaurant
      | tables: restaurant.tables ++ [new_table],
        num_tables: restaurant.num_tables - 1,
        reserved_tables: restaurant.reserved_tables + 1
    }
  end

  defp create_reservation({false, _}, _), do: {:error, "There is not available tables"}
end
