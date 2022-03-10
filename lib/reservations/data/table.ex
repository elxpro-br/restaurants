defmodule Reservations.Data.Table do
  alias Reservations.Type

  @type t :: Type.table()
  defstruct food_plate: 0, forks: nil, knives: nil, name: nil, seats: nil, spoons: nil

  def new(name, seats) do
    %__MODULE__{
      food_plate: "Steak",
      forks: seats,
      knives: seats,
      name: name,
      seats: seats,
      spoons: seats
    }
  end
end
