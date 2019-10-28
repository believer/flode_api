defmodule Flode.Schema.DataTypes do
  use Absinthe.Schema.Notation

  alias Flode.Resolvers

  object :feed do
    field :id, :id
    field :description, :string
    field :title, :string

    field :is_subscribed, :boolean do
      resolve(&Resolvers.Feeds.is_subscribed/3)
    end
  end
end
