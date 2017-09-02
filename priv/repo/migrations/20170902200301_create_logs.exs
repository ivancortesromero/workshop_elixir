defmodule Workshop.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs) do
      add :user, :string
      add :message, :string

      timestamps()
    end

  end
end
