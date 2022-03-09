defmodule Reservations.Data.Restaurant do
  alias Reservations.Type

  @type t :: Type.restaurant()
  defstruct tables: [], reserved_tables: 0, name: "", num_tables: nil

  @spec new(String.t(), integer()) :: Type.restaurant()
  def new(name, num_tables) do
    %__MODULE__{num_tables: num_tables, name: name}
  end
end
