defmodule Flode.Schema do
  use Absinthe.Schema

  import_types(Flode.Schema.DataTypes)

  alias Flode.Resolvers

  query do
    @desc "All feeds"
    field :feeds, list_of(:feed) do
      resolve(&Resolvers.Feeds.all_feeds/3)
    end

    @desc "Get information on a specific feed"
    field :feed_by_id, :feed do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Feeds.get_feed/3)
    end
  end
end
