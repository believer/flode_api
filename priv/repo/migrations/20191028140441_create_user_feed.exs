defmodule Flode.Repo.Migrations.CreateUserFeed do
  use Ecto.Migration

  def change do
    create table(:user_feed) do
      add :user_id, :integer
      add :feed_id, :integer

      timestamps()
    end

  end
end
