defmodule ChoresSchmores.HouseController do
  use ChoresSchmores.Web, :controller

  alias ChoresSchmores.House
  alias ChoresSchmores.User

  plug :scrub_params, "house" when action in [:create, :update]

  def index(conn, _params, user) do
    houses = Repo.all(House)

    render(conn, "index.html", houses: houses)
  end

  def new(conn, _params, user) do
    changeset = House.changeset(%House{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"house" => house_params}, user) do
    changeset = House.changeset(%House{}, house_params)

    case Repo.insert(changeset) do
      {:ok, _house} ->
        add_house_id_to_user(user, _house)

        conn
        |> put_flash(:info, "House created successfully.")
        |> redirect(to: house_path(conn, :show, _house))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, user) do
    house = Repo.get!(House, id)

    house_members = fetch_house_members(house)

    render(conn, "show.html", house: house, house_members: house_members)
  end

  def edit(conn, %{"id" => id}, user) do
    house = Repo.get!(House, id)
    changeset = House.changeset(house)
    render(conn, "edit.html", house: house, changeset: changeset)
  end

  def update(conn, %{"id" => id, "house" => house_params}, user) do
    house = Repo.get!(House, id)
    changeset = House.changeset(house, house_params)

    case Repo.update(changeset) do
      {:ok, house} ->
        add_house_id_to_user(user, house)

        conn
        |> put_flash(:info, "House updated successfully.")
        |> redirect(to: house_path(conn, :show, house))
      {:error, changeset} ->
        render(conn, "edit.html", house: house, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    house = Repo.get!(House, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(house)

    conn
    |> put_flash(:info, "House deleted successfully.")
    |> redirect(to: house_path(conn, :index))
  end

  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
          [conn, conn.params, conn.assigns.current_user])
  end

  defp add_house_id_to_user(user, house) do
    changed_user = Ecto.Changeset.change(user, house_id: house.id)
    Repo.update!(changed_user)
  end

  defp fetch_house_members(house) do
    query = assoc(house, :users)
    Repo.all(query)
  end

end
