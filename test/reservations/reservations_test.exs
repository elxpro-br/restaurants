defmodule ReservationsTest do
  use ExUnit.Case
  alias Reservations.Data.Restaurant
  import Reservations

  test "give a name and tables when call create_restaurant/2 then return a restaurant" do
    assert %Restaurant{name: "BK", num_tables: 10, reserved_tables: 0, tables: []} ==
             create_restaurant("BK", 10)
  end
end
