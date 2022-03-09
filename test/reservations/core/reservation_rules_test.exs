defmodule Reservations.Core.ReservationRulesTest do
  use ExUnit.Case
  alias Reservations.Data.Restaurant
  import Reservations.Core.ReservationRules

  test "give a name and tables when call create_restaurant/2 then return a restaurant" do
    assert %Restaurant{name: "BK", num_tables: 10, reserved_tables: 0, tables: []} ==
             create_restaurant("BK", 10)
  end

  test "given a restaurant and the informations to book when call the function make_reservation then return the new restaurant`s status" do
    expect = %Restaurant{
      name: "BK",
      num_tables: 10,
      reserved_tables: 0,
      tables: [
        %{
          food_plate: "Steak",
          forks: 3,
          knives: 3,
          name: "Gus",
          seats: 3,
          spoons: 3
        }
      ]
    }

    assert expect == "BK" |> create_restaurant(10) |> make_reservation({"Gus", 3})
  end
end
