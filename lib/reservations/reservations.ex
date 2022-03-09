defmodule Reservations do
  alias Reservations.Core.ReservationRules
  alias Reservations.Type

  @spec create_restaurant(String.t(), integer()) :: Type.restaurant()
  defdelegate create_restaurant(name, num_tables), to: ReservationRules
end
