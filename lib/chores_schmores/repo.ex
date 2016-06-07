defmodule ChoresSchmores.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(ChoresSchmores.User) do
    [
      %ChoresSchmores.User{id: "1", name: "Nicole", username: "nicpell", password: "elixir"},
      %ChoresSchmores.User{id: "2", name: "Gareth", username: "predders", password: "elixir"},
      %ChoresSchmores.User{id: "3", name: "Raquel", username: "raq", password: "elixir"},
      %ChoresSchmores.User{id: "4", name: "Chris", username: "chrees", password: "elixir"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module),
    fn map ->
      Enum.all?(params, fn {key, val} ->
        Map.get(map, key) == val end)
    end
  end

end
