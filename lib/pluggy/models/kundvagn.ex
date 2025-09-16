defmodule Pluggy.Kundvagn do
  defstruct name: "", gluten: false, size: "", ingredients: []

  alias Pluggy.Kundvagn

  def insert(params) do
    params["list"]
    |> String.split("\r\n")
    |> Enum.map(&String.split(&1, ","))
    |> from_rows()
    |> Enum.each(&ordering/1)
  end

  def from_rows(rows) do
    rows
    |> Enum.filter(fn row -> Enum.any?(row, &(&1 != "")) end)
    |> Enum.map(fn
      [name, gluten_str, size | ingrs] ->
        gluten = case gluten_str do
          "true" -> true
          "false" -> false
          other -> other
        end

        ingredients = Enum.reject(ingrs, &(&1 == ""))

        %Kundvagn{
          name: name,
          gluten: gluten,
          size: size,
          ingredients: ingredients
        }

      _ -> nil
    end)
    |> Enum.reject(&is_nil/1)
  end

  def ordering(struct) do
    name = struct.name
    gluten = struct.gluten
    size = struct.size
    ingredients = struct.ingredients
    Postgrex.query!(DB,"INSERT INTO orders (name,gluten,size,ingredients) VALUES ($1,$2,$3,$4)",
    [name,gluten,size,ingredients])
  end

end
