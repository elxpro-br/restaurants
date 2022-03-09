defmodule Reservations.Core.ReservationRulesTest do
  use ExUnit.Case
  alias Reservations.Data.Restaurant
  alias Reservations.Data.Table
  import Reservations.Core.ReservationRules

  test "give a name and tables when call create_restaurant/2 then return a restaurant" do
    assert %Restaurant{name: "BK", num_tables: 10, reserved_tables: 0, tables: []} ==
             create_restaurant("BK", 10)
  end

  test "given a restaurant and the informations to book when call the function make_reservation then return the new restaurant`s status" do
    expect = %Restaurant{
      name: "BK",
      num_tables: 9,
      reserved_tables: 1,
      tables: [
        %Table{
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

  test "should create two reservations" do
    expect = %Restaurant{
      name: "BK",
      num_tables: 8,
      reserved_tables: 2,
      tables: [
        %Table{
          food_plate: "Steak",
          forks: 3,
          knives: 3,
          name: "Gus",
          seats: 3,
          spoons: 3
        },
        %Table{
          food_plate: "Steak",
          forks: 4,
          knives: 4,
          name: "Ana",
          seats: 4,
          spoons: 4
        }
      ]
    }

    assert expect ==
             "BK"
             |> create_restaurant(10)
             |> make_reservation({"Gus", 3})
             |> make_reservation({"Ana", 4})
  end

  test "should throw an error message when does not have available tables" do
    assert {:error, "There is not available tables"} ==
             "BK"
             |> create_restaurant(1)
             |> make_reservation({"Gus", 3})
             |> make_reservation({"Ana", 4})
  end
end
