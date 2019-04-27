defmodule ServerWeb.PageController do
  use ServerWeb, :controller

  def index(conn, _params), do: render(conn, "index.html")
  def feedback(conn, _params), do: render(conn, "feedback.html")
  def train1(conn, _params), do: render(conn, "train1.html")
  def breeding(conn, _params), do: render(conn, "breeding.html")
  def event(conn, _params), do: render(conn, "event.html")
  
  def check_email(conn, _params) do
    render(conn, "check_email.html")
  end
  
  def verify(conn, params) do
    case Server.Accounts.verify_email(params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Successfully verified email address")
        |> ServerWeb.Auth.login(user)
        |> redirect(to: Routes.page_path(conn, :index))
      {:error, msg} ->
        conn
        |> put_flash(:error, msg)
        |> render("index.html")
      error ->
        IO.inspect error, label: "Unexpected verification error"
        conn
        |> put_flash(:error, "Invalid Verification")
        |> render("index.html")
    end
  end
  
end
