defmodule ChoresSchmores.House do
  use ChoresSchmores.Web, :model

  schema "houses" do
    field :name, :string

    has_many :users, ChoresSchmores.User

    timestamps()
  end

  @required_fields ~w(name)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields)
    |> validate_required([:name])
  end
end
