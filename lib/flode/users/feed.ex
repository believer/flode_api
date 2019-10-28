defmodule Flode.Users.Feed do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_feed" do
    field :feed_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(feed, attrs) do
    feed
    |> cast(attrs, [:user_id, :feed_id])
    |> validate_required([:user_id, :feed_id])
  end
end
