defmodule Reservations.Core.ReservationRules do
  alias Reservations.Data.Restaurant

  def create_restaurant(name, num_tables) do
    Restaurant.new(name, num_tables)
  end
end
