defmodule Reservations.Type do
  alias Reservations.Data.Restaurant

  @type restaurant :: %Restaurant{
          tables: list(),
          reserved_tables: integer(),
          name: String.t(),
          num_tables: integer()
        }
end
