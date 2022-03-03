defmodule Reservations.Core.ReservationRules do
  alias Reservations.Data.Restaurant
  @type restaurant :: Restaurant.t()

  @spec create_restaurant(String.t(), integer()) :: restaurant()
  def create_restaurant(name, num_tables) do
    Restaurant.new(name, num_tables)
  end
end
