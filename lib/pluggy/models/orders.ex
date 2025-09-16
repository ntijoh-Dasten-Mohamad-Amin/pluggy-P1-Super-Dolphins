defmodule Pluggy.Orders do
  defstruct(id: nil, name: "", gluten: false, size: "", ingredients: [])

  alias Pluggy.Orders

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
    gluten =
    case params["gluten"] do
      "true" -> true
      "false" -> false
      _ -> false
    end
    name = params["name"]
    size = params["size"]
    ingredients = params["ingredients"]
    id = String.to_integer(id)
    Postgrex.query!(DB,"INSERT INTO completed (name,gluten,size,ingredients) VALUES ($1,$2,$3,$4)",
    [name,gluten,size,ingredients])
    Postgrex.query!(DB,"DELETE FROM orders WHERE id = $1",
    [id])
  end



  def to_struct([id, name, gluten, size, ingredients]) do
    %Orders{id: id, name: name, gluten: gluten, size: size, ingredients: ingredients}
  end


  def to_struct_list(rows) do
    for [id, name ,gluten,size,ingredients] <- rows, do: %Orders{id: id, name: name, gluten: gluten, size: size, ingredients: ingredients}
  end
end
