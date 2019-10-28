defmodule Flode.Resolvers.Feeds do
  def all_feeds(_parent, _args, _resolution) do
    {:ok, Flode.Feeds.list_feed()}
  end

  def get_feed(_parent, %{id: id}, _resolution) do
    case Flode.Feeds.get_feed(id) do
      nil ->
        {:error, "Feed not found"}

      feed ->
        {:ok, feed}
    end
  end

  def is_subscribed(parent, _args, _resolution) do
    feed_user = Flode.Users.get_by_feed(parent.id)

    {:ok, feed_user.user_id === 1}
  end
end
