defmodule Reservations.Data.TableTest do
  use ExUnit.Case
  alias Reservations.Data.Table
  import Reservations.Data.Table

  test "give a name and tables when call new/2 then return a restaurant" do
    assert %Table{food_plate: "Steak", forks: 4, knives: 4, name: "Gus", seats: 4, spoons: 4} ==
             new("Gus", 4)
  end
end
