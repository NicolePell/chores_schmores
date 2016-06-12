defmodule ChoresSchmores.HomeControllerTest do
  use ChoresSchmores.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to ChoresSchmores!"
  end
end
