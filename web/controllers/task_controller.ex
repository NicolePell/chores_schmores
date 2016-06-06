defmodule ChoresSchmores.TaskController do
  use ChoresSchmores.Web, :controller

  def task(conn, %{"name" => name}) do
    render conn, "tasks.html",
    name: name
  end
end
