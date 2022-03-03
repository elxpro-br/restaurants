defmodule Reservations do
  alias Reservations.Core.ReservationRules

  defdelegate create_restaurant(name, num_tables), to: ReservationRules
end
