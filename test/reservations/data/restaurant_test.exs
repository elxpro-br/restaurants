defmodule Reservations.Data.RestaurantTest do
  use ExUnit.Case
  alias Reservations.Data.Restaurant
  import Reservations.Data.Restaurant, only: [new: 2]

  test "give a name and tables when call new/2 then return a restaurant" do
    assert %Restaurant{
             name: "BK",
             num_tables: 10,
             reserved_tables: 0,
             tables: []
           } == new("BK", 10)
  end
end
