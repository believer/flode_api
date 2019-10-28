defmodule Flode.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
