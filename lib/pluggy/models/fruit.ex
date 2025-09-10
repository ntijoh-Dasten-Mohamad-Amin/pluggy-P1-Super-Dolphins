defmodule Pluggy.Pizza do
  defstruct(id: nil, name: "", ingredients_list: [])

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

  def update(id, params) do
    name = params["name"]
    ingredients_list = String.to_integer(params["ingredients_list"])
    id = String.to_integer(id)

    Postgrex.query!(
      DB,
      "UPDATE pizza SET name = $1, ingredients_list = $2 WHERE id = $3",
      [name, ingredients_list, id]
    )
  end

  def create(params) do
    name = params["name"]
    ingredients_list = String.to_integer(params["ingredients_list"])

    Postgrex.query!(DB, "INSERT INTO pizza (name, ingredients_list) VALUES ($1, $2)", [name, ingredients_list])
  end

  def delete(id) do
    Postgrex.query!(DB, "DELETE FROM pizza WHERE id = $1", [String.to_integer(id)])
  end

  def to_struct([[id, name, ingredients_list]]) do
    %Pizza{id: id, name: name, ingredients_list: ingredients_list}
  end

  def to_struct_list(rows) do
    for [id, name, ingredients_list] <- rows, do: %Pizza{id: id, name: name, ingredients_list: ingredients_list}
  end
end
