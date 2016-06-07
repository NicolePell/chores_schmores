defmodule ChoresSchmores.UserView do 
  use ChoresSchmores.Web, :view
  alias ChoresSchmores.User

  def first_name(%User{name: name}) do name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
