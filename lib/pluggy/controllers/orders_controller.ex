defmodule Pluggy.OrdersController do

  require IEx


  alias Pluggy.Orders
  alias Pluggy.User
  import Pluggy.Template, only: [render: 2]
  import Plug.Conn, only: [send_resp: 3]

def orders(conn) do
    # get user if logged in
    session_user = conn.private.plug_session["user_id"]

    current_user =
      case session_user do
        nil -> nil
        _ -> User.get(session_user)
      end

    send_resp(conn, 200, render("orders/orderpanel", orders: Orders.all(), user: current_user))
  end

  @spec show(Plug.Conn.t(), binary()) :: Plug.Conn.t()
  def show(conn, id), do: send_resp(conn, 200, render("", orders: Orders.get(id)))


  def update(conn, id, params) do
    Orders.update(id, params)
    redirect(conn, "/orders")
  end


  defp redirect(conn, url) do
    Orders.Conn.put_resp_header(conn, "location", url) |> send_resp(303, "")
  end
end

