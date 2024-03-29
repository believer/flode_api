defmodule Flode.Feeds.Feed do
  use Ecto.Schema
  import Ecto.Changeset

  schema "feed" do
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(feed, attrs) do
    feed
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
