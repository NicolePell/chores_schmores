defmodule ChoresSchmores.Repo.Migrations.AddHouseIdToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :house_id, references(:houses)
    end
  end
end
