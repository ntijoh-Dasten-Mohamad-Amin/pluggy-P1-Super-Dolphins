defmodule Pluggy.Router do
  use Plug.Router
  use Plug.Debugger

  # alias Pluggy.FruitController
  # alias Pluggy.PizzaController
  alias Pluggy.OrdersController

  plug(Plug.Static, at: "/", from: :pluggy)
  plug(:put_secret_key_base)

  plug(Plug.Session,
    store: :cookie,
    key: "_my_app_session",
    encryption_salt: "cookie store encryption salt",
    signing_salt: "cookie store signing salt",
    log: :debug
  )

  plug(:fetch_session)
  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])
  plug(:match)
  plug(:dispatch)

  get("/", do: Index.Controller.index(conn))

  get("/orders", do: OrdersController.orders(conn))

  get("/pizza", do: PizzaController.index(conn))

  get("/kundkorg", do: KundController.index(conn))

  get("/orders/:id", do: OrdersController.show(conn, id))

  get("/pizza/:id", do: FruitController.show(conn, id))

  get("/kundvagn", do: KundvagnController.index(conn))

  post("/orders/:id/edit", do: OrdersController.update(conn,id,conn.body_params))

  post("/kundvagn/send", do: KundvagnController.insert(conn,conn.body_params))

  post("/pizza", do: FruitController.create(conn, conn.body_params))

  post("/pizza/:id/edit", do: FruitController.update(conn, id, conn.body_params))

  post("/orders/:id/destroy", do: OrdersController.destroy(conn, id))

  match _ do
    send_resp(conn, 404, "oops")
  end

  defp put_secret_key_base(conn, _) do
    put_in(
      conn.secret_key_base,
      "-- LONG STRING WITH AT LEAST 64 BYTES LONG STRING WITH AT LEAST 64 BYTES --"
    )
  end
end
