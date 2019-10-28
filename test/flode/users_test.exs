defmodule Flode.UsersTest do
  use Flode.DataCase

  alias Flode.Users

  describe "user" do
    alias Flode.Users.User

    @valid_attrs %{email: "some email"}
    @update_attrs %{email: "some updated email"}
    @invalid_attrs %{email: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_user()

      user
    end

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Users.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Users.create_user(@valid_attrs)
      assert user.email == "some email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Users.update_user(user, @update_attrs)
      assert user.email == "some updated email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end

  describe "user_feed" do
    alias Flode.Users.Feed

    @valid_attrs %{feed_id: 42, user_id: 42}
    @update_attrs %{feed_id: 43, user_id: 43}
    @invalid_attrs %{feed_id: nil, user_id: nil}

    def feed_fixture(attrs \\ %{}) do
      {:ok, feed} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_feed()

      feed
    end

    test "list_user_feed/0 returns all user_feed" do
      feed = feed_fixture()
      assert Users.list_user_feed() == [feed]
    end

    test "get_feed!/1 returns the feed with given id" do
      feed = feed_fixture()
      assert Users.get_feed!(feed.id) == feed
    end

    test "create_feed/1 with valid data creates a feed" do
      assert {:ok, %Feed{} = feed} = Users.create_feed(@valid_attrs)
      assert feed.feed_id == 42
      assert feed.user_id == 42
    end

    test "create_feed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_feed(@invalid_attrs)
    end

    test "update_feed/2 with valid data updates the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{} = feed} = Users.update_feed(feed, @update_attrs)
      assert feed.feed_id == 43
      assert feed.user_id == 43
    end

    test "update_feed/2 with invalid data returns error changeset" do
      feed = feed_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_feed(feed, @invalid_attrs)
      assert feed == Users.get_feed!(feed.id)
    end

    test "delete_feed/1 deletes the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{}} = Users.delete_feed(feed)
      assert_raise Ecto.NoResultsError, fn -> Users.get_feed!(feed.id) end
    end

    test "change_feed/1 returns a feed changeset" do
      feed = feed_fixture()
      assert %Ecto.Changeset{} = Users.change_feed(feed)
    end
  end
end
