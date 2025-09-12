defmodule Pluggy.Orders do
  defstruct(id: nil, id_p: nil, name: "")

  alias Pluggy.Orders
  alias Pluggy.OrdersController

  def all do
    Postgrex.query!(DB, "SELECT * FROM orders", []).rows
    |> to_struct_list
  end

  def all_completed do
  Postgrex.query!(DB, "SELECT * FROM completed", []).rows
  |> to_struct_list()
  end

  def get(id) do
    Postgrex.query!(DB, "SELECT * FROM orders WHERE id = $1", [String.to_integer(id)]
    ).rows
    |> to_struct
  end

  def delete(id) do
    Postgrex.query!(DB, "DELETE FROM completed WHERE id = $1", [String.to_integer(id)])
  end

  def update(id, params) do
    name = params["name"]
    id_p = String.to_integer(params["id_p"])
    id = String.to_integer(id)
    Postgrex.query!(DB,"INSERT INTO completed (name,id_p) VALUES ($1,$2)",
    [name,id_p])
    Postgrex.query!(DB,"DELETE FROM orders WHERE id = $1",
    [id])
  end

  def to_struct([[id, id_p, name]]) do
    %Orders{id: id, id_p: id_p, name: name}
  end


  #   def update(id, params) do
  #   name = params["name"]
  #   tastiness = String.to_integer(params["tastiness"])
  #   id = String.to_integer(id)

  #   Postgrex.query!(
  #     DB,
  #     "UPDATE fruits SET name = $1, tastiness = $2 WHERE id = $3",
  #     [name, tastiness, id]
  #   )
  # end

  def to_struct_list(rows) do
    for [id, id_p, name] <- rows, do: %Orders{id: id, id_p: id_p, name: name}
  end
end
