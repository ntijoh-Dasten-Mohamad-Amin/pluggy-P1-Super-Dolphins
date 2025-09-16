defmodule Pluggy.Pizza do
  defstruct(id: nil, name: "", img: "", ingredients: [])

  require IEx
  alias Pluggy.Pizza

  def all do
    query = "SELECT * FROM pizza JOIN pizza_recipes ON pizza.id = pizza_recipes.pizza_id JOIN ingredients ON pizza_recipes.ingredient_id = ingredients.id"
    grouped = Postgrex.query!(DB, query, []).rows

    |> Enum.group_by(&Enum.at(&1, 0))

    Enum.map(grouped, fn {_id, rows} -> to_struct_list(rows) end )

    #IEx.pry

    #|> to_struct_list
  end

  # {1,
  #  [
  #   [5, "Prosciutto e funghi", 5, 1, 1, "Tomatsås"],
  #   [5, "Prosciutto e funghi", 5, 2, 2, "Mozzarella"],
  #   [5, "Prosciutto e funghi", 5, 4, 4, "Skinka"],
  #   [5, "Prosciutto e funghi", 5, 5, 5, "Svamp"]
  # ]
  #}

#  %Pizza{id: 5, name: "Prosciutto e funghi", ingredients:
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
    #
    [id, namn, _, _, _, _ingredient] = Enum.at(rows, 0)
    pizza = %Pizza{id: id, name: namn}
    Enum.reduce(rows, pizza, fn [id, name, _, _, _ingredient_id, ingredient], acc ->
      %Pizza {
        ingredients:
        [ingredient | acc.ingredients]
      }
    end)
  end
end
