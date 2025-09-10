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
    Postgrex.query!(DB, "DROP TABLE IF EXISTS completed", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS ingredients", [], pool: DBConnection.ConnectionPool)
    Postgrex.query!(DB, "DROP TABLE IF EXISTS orders", [], pool: DBConnection.ConnectionPool)
  end

  defp create_tables() do
    IO.puts("Creating tables")

    Postgrex.query!(
      DB,
      "Create TABLE pizza (id SERIAL, name VARCHAR(255) NOT NULL, ingredients_list INTEGER[] NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(
      DB,
      "Create TABLE orders (id SERIAL, id_p INTEGER, name VARCHAR(255) NOT NULL, state BOOLEAN NOT NULL)",
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
      "Create TABLE completed (id SERIAL, id_p INTEGER, name VARCHAR(255) NOT NULL)",
      [],
      pool: DBConnection.ConnectionPool
    )


  end

  defp seed_data() do
    IO.puts("Seeding data")

    Postgrex.query!(DB, "INSERT INTO pizza(name, ingredients_list) VALUES($1, $2)", ["Margherita", [1,2,3]],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizza(name, ingredients_list) VALUES($1, $2)", ["Capricciosa", [1,2,4,5,6]],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizza(name, ingredients_list) VALUES($1, $2)", ["Marinara", [1]],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizza(name, ingredients_list) VALUES($1, $2)", ["Quattro formaggi", [1,2,7,8,9]],
      pool: DBConnection.ConnectionPool
    )

    Postgrex.query!(DB, "INSERT INTO pizza(name, ingredients_list) VALUES($1, $2)", ["Prosciutto e funghi", [1,2,4,5]],
      pool: DBConnection.ConnectionPool
    )

        Postgrex.query!(DB, "INSERT INTO pizza(name, ingredients_list) VALUES($1, $2)", ["Ortolana", [1,2,10,11,12]],
      pool: DBConnection.ConnectionPool
    )

        Postgrex.query!(DB, "INSERT INTO pizza(name, ingredients_list) VALUES($1, $2)", ["Quattro stagioni", [1,2,4,5,6,13]],
      pool: DBConnection.ConnectionPool
    )

        Postgrex.query!(DB, "INSERT INTO pizza(name, ingredients_list) VALUES($1, $2)", ["Diavola", [1,2,14,15]],
      pool: DBConnection.ConnectionPool
    )



    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Tomatsås"],
      pool: DBConnection.ConnectionPool
      #1
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Mozzarella"],
      pool: DBConnection.ConnectionPool
      #2
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Basilika"],
      pool: DBConnection.ConnectionPool
      #3
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Skinka"],
      pool: DBConnection.ConnectionPool
      #4
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Svamp"],
      pool: DBConnection.ConnectionPool
      #5
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Kronärtskocka"],
      pool: DBConnection.ConnectionPool
      #6
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Parmesan"],
      pool: DBConnection.ConnectionPool
      #7
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Pecorino"],
      pool: DBConnection.ConnectionPool
      #8
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Gorgonzola"],
      pool: DBConnection.ConnectionPool
      #9
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Paprika"],
      pool: DBConnection.ConnectionPool
      #10
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Aubergine"],
      pool: DBConnection.ConnectionPool
      #11
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Zucchini"],
      pool: DBConnection.ConnectionPool
      #12
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Oliver"],
      pool: DBConnection.ConnectionPool
      #13
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Salami"],
      pool: DBConnection.ConnectionPool
      #14
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Paprika"],
      pool: DBConnection.ConnectionPool
      #15
    )

    Postgrex.query!(DB, "INSERT INTO ingredients(name) VALUES($1)", ["Chili"],
      pool: DBConnection.ConnectionPool
      #16
    )



    # Postgrex.query!(
    #   DB,
    #   "INSERT INTO users(username, password_hash) VALUES($1, $2)",
    #   ["a", Bcrypt.hash_pwd_salt("a")],
    #   pool: DBConnection.ConnectionPool
    # )
  end
end
