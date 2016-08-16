defmodule ChoresSchmores.UserTest do
  use ChoresSchmores.ModelCase

  alias ChoresSchmores.User

  @valid_attrs %{name: "Ford Prefect", username: "fordprefect"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
