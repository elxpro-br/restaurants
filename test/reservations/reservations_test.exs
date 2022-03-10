defmodule ReservationsTest do
  use ExUnit.Case
  alias Reservations.Data.Restaurant
  alias Reservations.Data.Table
  import Reservations

  test "give a name and tables when call create_restaurant/2 then return a restaurant" do
    assert %Restaurant{name: "BK", num_tables: 10, reserved_tables: 0, tables: []} ==
             create_restaurant("BK", 10)
  end

  test "should make a reservation" do
    assert %Restaurant{
             name: "BK",
             num_tables: 9,
             reserved_tables: 1,
             tables: [
               %Table{food_plate: "Steak", forks: 3, knives: 3, name: "Gus", seats: 3, spoons: 3}
             ]
           } ==
             "BK"
             |> create_restaurant(10)
             |> make_reservation({"Gus", 3})
  end

  test "should delete a reservation" do
    assert %Restaurant{
             name: "BK",
             num_tables: 10,
             reserved_tables: 0,
             tables: []
           } ==
             "BK"
             |> create_restaurant(10)
             |> make_reservation({"Gus", 3})
             |> delete_reservation("Gus")
  end
end
