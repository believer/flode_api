defmodule Flode.UserTest do
  use Flode.DataCase

  alias Flode.User

  describe "user_feed" do
    alias Flode.User.Feed

    @valid_attrs %{feed_id: 42, user_id: 42}
    @update_attrs %{feed_id: 43, user_id: 43}
    @invalid_attrs %{feed_id: nil, user_id: nil}

    def feed_fixture(attrs \\ %{}) do
      {:ok, feed} =
        attrs
        |> Enum.into(@valid_attrs)
        |> User.create_feed()

      feed
    end

    test "list_user_feed/0 returns all user_feed" do
      feed = feed_fixture()
      assert User.list_user_feed() == [feed]
    end

    test "get_feed!/1 returns the feed with given id" do
      feed = feed_fixture()
      assert User.get_feed!(feed.id) == feed
    end

    test "create_feed/1 with valid data creates a feed" do
      assert {:ok, %Feed{} = feed} = User.create_feed(@valid_attrs)
      assert feed.feed_id == 42
      assert feed.user_id == 42
    end

    test "create_feed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = User.create_feed(@invalid_attrs)
    end

    test "update_feed/2 with valid data updates the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{} = feed} = User.update_feed(feed, @update_attrs)
      assert feed.feed_id == 43
      assert feed.user_id == 43
    end

    test "update_feed/2 with invalid data returns error changeset" do
      feed = feed_fixture()
      assert {:error, %Ecto.Changeset{}} = User.update_feed(feed, @invalid_attrs)
      assert feed == User.get_feed!(feed.id)
    end

    test "delete_feed/1 deletes the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{}} = User.delete_feed(feed)
      assert_raise Ecto.NoResultsError, fn -> User.get_feed!(feed.id) end
    end

    test "change_feed/1 returns a feed changeset" do
      feed = feed_fixture()
      assert %Ecto.Changeset{} = User.change_feed(feed)
    end
  end
end
