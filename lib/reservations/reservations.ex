defmodule Reservations do
  alias Reservations.Core.ReservationRules
  alias Reservations.Type

  @spec create_restaurant(String.t(), integer()) :: Type.restaurant()
  defdelegate create_restaurant(name, num_tables), to: ReservationRules

  defdelegate make_reservation(restaurant, info), to: ReservationRules
  defdelegate delete_reservation(restaurant, name), to: ReservationRules
end
