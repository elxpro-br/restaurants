defmodule Reservations do
  alias Reservations.Type
  alias Reservations.Core.ReservationRules

  @spec create_restaurant(String.t(), integer()) :: Type.restaurant()
  defdelegate create_restaurant(name, num_tables), to: ReservationRules
end
