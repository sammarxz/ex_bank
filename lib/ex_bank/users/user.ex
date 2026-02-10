defmodule ExBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:name, :email, :password_hash, :cep]

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :cep, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 3)
    |> validate_length(:email, min: 3)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+\.[^\s]+$/)
    |> unique_constraint(:email)
    |> validate_length(:password_hash, min: 6)
    |> validate_length(:cep, is: 8)
  end
end
