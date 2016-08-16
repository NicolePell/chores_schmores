defmodule ChoresSchmores.HouseControllerTest do
  use ChoresSchmores.ConnCase

  test "requires user authentication on all actions", %{conn: conn} do
    Enum.each([
      get(conn, house_path(conn, :new)),
      get(conn, house_path(conn, :index)),
      get(conn, house_path(conn, :show, "123")),
      get(conn, house_path(conn, :edit, "123")),
      put(conn, house_path(conn, :update, "123", %{})),
      post(conn, house_path(conn, :create, %{})),
      delete(conn, house_path(conn, :delete, "123")),
      ], fn conn ->
        assert html_response(conn, 302)
        assert conn.halted
      end)
  end

end
