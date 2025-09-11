defmodule Pluggy.Pizza do
  defstruct(id: nil, name: "")

  alias Pluggy.Pizza

  def all do
    Postgrex.query!(DB, "SELECT * FROM pizza", []).rows
    |> to_struct_list
  end

  def get(id) do
    Postgrex.query!(DB, "SELECT * FROM pizza WHERE id = $1 LIMIT 1", [String.to_integer(id)]
    ).rows
    |> to_struct
  end

  def delete(id) do
    Postgrex.query!(DB, "DELETE FROM pizza WHERE id = $1", [String.to_integer(id)])
  end

  def to_struct([[id, name]]) do
    %Pizza{id: id, name: name}
  end

  def to_struct_list(rows) do
    for [id, name] <- rows, do: %Pizza{id: id, name: name}
  end
end
