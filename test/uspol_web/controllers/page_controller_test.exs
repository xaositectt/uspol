defmodule UspolWeb.PageControllerTest do
  use UspolWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to UsPol!"
  end
end
