defmodule ChoresSchmores.HouseTest do
  use ChoresSchmores.ModelCase

  alias ChoresSchmores.User

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  # test "user belongs_to a house"

  # test "username length is validated - test invalid and valid"

  # test "password length is validated - test invalid and valid"
end
