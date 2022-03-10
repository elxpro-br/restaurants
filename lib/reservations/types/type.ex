defmodule Reservations.Type do
  alias Reservations.Data.Restaurant
  alias Reservations.Data.Table

  @type restaurant :: %Restaurant{
          tables: list(),
          reserved_tables: integer(),
          name: String.t(),
          num_tables: integer()
        }

  @type table :: %Table{
          food_plate: String.t(),
          forks: integer(),
          knives: integer,
          name: String.t(),
          seats: integer,
          spoons: integer
        }
end
