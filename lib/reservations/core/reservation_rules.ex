defmodule Reservations.Core.ReservationRules do
  alias Reservations.Data.Restaurant
  alias Reservations.Data.Table
  @type restaurant :: Restaurant.t()

  @spec create_restaurant(String.t(), integer()) :: restaurant()
  def create_restaurant(name, num_tables) do
    Restaurant.new(name, num_tables)
  end

  @spec make_reservation(restaurant(), {String.t(), integer()}) ::
          restaurant() | {:error, String.t()}
  def make_reservation(restaurant, {name, seats}) do
    restaurant
    |> check_reservations()
    |> check_reservations_already_exist(name)
    |> create_reservation({name, seats})
  end

  defp check_reservations(restaurant) do
    restaurant
    |> then(&(&1.reserved_tables <= &1.num_tables))
    |> then(&validate_reservation(&1, restaurant))
  end

  defp validate_reservation(true, restaurant), do: {:ok, restaurant}
  defp validate_reservation(false, _restaurant), do: {:error, "There is not available tables"}

  defp check_reservations_already_exist({:ok, %{tables: tables} = restaurant}, name) do
    tables
    |> Enum.find(fn table -> table.name == name end)
    |> then(&is_reservation_already_exist?(&1, restaurant))
  end

  defp check_reservations_already_exist({:error, _} = error, _name), do: error

  defp is_reservation_already_exist?(nil, restaurant), do: {:ok, restaurant}

  defp is_reservation_already_exist?(_, _restaurant),
    do: {:error, "This Reservation already exist"}

  defp create_reservation({:ok, restaurant}, {name, seats}) do
    new_table = Table.new(name, seats)

    %{
      restaurant
      | tables: restaurant.tables ++ [new_table],
        num_tables: restaurant.num_tables - 1,
        reserved_tables: restaurant.reserved_tables + 1
    }
  end

  defp create_reservation({:error, message}, _), do: {:error, message}
end
