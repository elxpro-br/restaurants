defmodule Reservations.Data.Restaurant do
  defstruct tables: [], reserved_tables: 0, name: "", num_tables: nil

  def new(name, num_tables) do
    %__MODULE__{num_tables: num_tables, name: name}
  end
end
