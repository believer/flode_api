defmodule Flode.Repo.Migrations.CreateFeed do
  use Ecto.Migration

  def change do
    create table(:feed) do
      add :title, :string
      add :description, :string

      timestamps()
    end

  end
end
