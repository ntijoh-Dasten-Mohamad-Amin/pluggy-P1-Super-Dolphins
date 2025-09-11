defmodule Pluggy.Orders do
  defstruct(id: nil, id_p: nil, name: "", state: false)

  alias Pluggy.Orders

  def all do
    Postgrex.query!(DB, "SELECT * FROM orders", []).rows
    |> to_struct_list
  end

  def get(id) do
    Postgrex.query!(DB, "SELECT * FROM orders WHERE id = $1", [String.to_integer(id)]
    ).rows
    |> to_struct
  end

  def delete(id) do
    Postgrex.query!(DB, "DELETE FROM orders WHERE id = $1", [String.to_integer(id)])
  end

  def to_struct([[id, id_p, name, state]]) do
    %Orders{id: id, id_p: id_p, name: name, state: state}
  end

  def to_struct_list(rows) do
    for [id, id_p, name, state: state] <- rows, do: %Orders{id: id, id_p: id_p, name: name, state: state}
  end
end
