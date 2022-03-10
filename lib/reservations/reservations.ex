defmodule Reservations do
  alias Reservations.Core.ReservationRules
  alias Reservations.Type

  @type restaurant :: Type.restaurant()

  @spec create_restaurant(String.t(), integer()) :: restaurant()
  defdelegate create_restaurant(name, num_tables), to: ReservationRules

  @spec make_reservation(restaurant(), {String.t(), integer()}) ::
          restaurant() | {:error, String.t()}
  defdelegate make_reservation(restaurant, info), to: ReservationRules

  @spec delete_reservation(restaurant(), String.t()) :: restaurant() | {:error, String.t()}
  defdelegate delete_reservation(restaurant, name), to: ReservationRules

  @spec reserved_places(restaurant()) :: String.t()
  defdelegate reserved_places(restaurant), to: ReservationRules
end
