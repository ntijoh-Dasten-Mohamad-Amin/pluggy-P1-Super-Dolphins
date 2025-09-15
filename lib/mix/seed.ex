defmodule Mix.Tasks.Seed do
  use Mix.Task

  @shortdoc "Resets & seeds the DB."
  def run(_) do
    Mix.Task.run("app.start")
    drop_tables()
    create_tables()
    seed_data()
  end

  defp drop_tables() do
    IO.puts("Dropping tables")

    Postgrex.query!(DB, "DROP TABLE IF EXISTS pizza", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS pizza_recipes", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS completed", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS ingredients", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS orders", [], pool: DBConnection.ConnectionPool)
  end

  defp create_tables() do
    IO.puts("Creating tables")

    Postgrex.query!(
      DB,
      "Create TABLE pizza (id SERIAL, name VARCHAR(255) NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(
      DB,
      "Create TABLE pizza_recipes (pizza_id INTEGER NOT NULL, ingredient_id INTEGER NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(
      DB,
      "Create TABLE orders (id SERIAL,
      name VARCHAR(255) NOT NULL,
      gluten BOOLEAN NOT NULL,
      size VARCHAR(255) NOT NULL,
      ingredients character[] NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(
      DB,
      "Create TABLE ingredients (id SERIAL, name VARCHAR(255) NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )


    Postgrex.query!(
      DB,
      "Create TABLE completed (id SERIAL,
      name VARCHAR(255) NOT NULL,
      gluten BOOLEAN NOT NULL,
      size VARCHAR(255) NOT NULL,
      ingredients VARCHAR(255) NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )


  end

  defp seed_data() do
    IO.puts("Seeding data")

    Postgrex.query!(DB, """
    INSERT INTO pizza (name)
    VALUES
      ($1),
      ($2),
      ($3),
      ($4),
      ($5),
      ($6),
      ($7),
      ($8)

    """, [
    "Margherita",
    "Capricciosa",
    "Marinara",
    "Quattro formaggi",
    "Prosciutto e funghi",
    "Ortolana",
    "Quattro Stagioni",
    "Diavola"

    ],
      pool: DBConnection.ConnectionPool
    )


    Postgrex.query!(DB, """
    INSERT INTO ingredients (name)
    VALUES
      ($1),
      ($2),
      ($3),
      ($4),
      ($5),
      ($6),
      ($7),
      ($8),
      ($9),
      ($10),
      ($11),
      ($12),
      ($13),
      ($14),
      ($15),
      ($16)


    """, [

    "Tomatsås", #1
    "Mozzarella", #2
    "Basilika", #3
    "Skinka", #4
    "Svamp", #5
    "Kronärtskocka", #6
    "Parmesan", #7
    "Pecorino", #8
    "Gorgonzola", #9
    "Paprika", #10
    "Aubergine", #11
    "Zucchini", #12
    "Oliver", #13
    "Salami", #14
    "Chili", #15
    "Familjepizza" #16


    ],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, """
    INSERT INTO pizza_recipes (pizza_id, ingredient_id)
    VALUES

      ($1, $2),
      ($3, $4),
      ($5, $6),
      ($7, $8),
      ($9, $10),
      ($11, $12),
      ($13, $14),
      ($15, $16),
      ($17, $18),
      ($19, $20),
      ($21, $22),
      ($23, $24),
      ($25, $26),
      ($27, $28),
      ($29, $30),
      ($31, $32),
      ($33, $34),
      ($35, $36),
      ($37, $38),
      ($39, $40),
      ($41, $42),
      ($43, $44),
      ($45, $46),
      ($47, $48),
      ($49, $50),
      ($51, $52),
      ($53, $54),
      ($55, $56),
      ($57, $58),
      ($59, $60),
      ($61, $62),
      ($63, $64),
      ($65, $66)


    """, [

    1, 1,
    1, 2,
    1, 3,
    2, 1,
    2, 2,
    2, 4,
    2, 5,
    2, 6,
    3, 1,
    4, 2,
    4, 7,
    4, 8,
    4, 9,
    5, 1,
    5, 2,
    5, 4,
    5, 5,
    6, 1,
    6, 2,
    6, 10,
    6, 11,
    6, 12,
    7, 1,
    7, 2,
    7, 4,
    7, 5,
    7, 6,
    7, 13,
    8, 1,
    8, 2,
    8, 14,
    8, 10,
    8, 15

    ],
      pool: DBConnection.ConnectionPool
    )


  end
end
