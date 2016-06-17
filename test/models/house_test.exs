defmodule ChoresSchmores.HouseTest do
  use ChoresSchmores.ModelCase

  alias ChoresSchmores.House

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = House.changeset(%House{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = House.changeset(%House{}, @invalid_attrs)
    refute changeset.valid?
  end

  # test "houses has many users"
end
