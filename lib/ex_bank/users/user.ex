defmodule ExBank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params_create [:name, :email, :password, :cep]
  @required_params_update [:name, :email, :cep]

  @derive {Jason.Encoder, only: [:id, :name, :email, :cep]}
  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :cep, :string

    timestamps()
  end

  def create_changeset(user, attrs) do
    user
    |> cast(attrs, @required_params_create)
    |> do_validations(@required_params_create)
    |> add_password_hash()
  end

  def update_changeset(user, attrs) do
    user
    |> cast(attrs, @required_params_update)
    |> do_validations(@required_params_update)
    |> add_password_hash()
  end

  defp do_validations(changeset, fields) do
    changeset
    |> validate_required(fields)
    |> validate_length(:name, min: 3)
    |> validate_length(:email, min: 3)
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+\.[^\s]+$/)
    |> unique_constraint(:email)
    |> validate_length(:cep, is: 8)
  end

  defp add_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    put_change(changeset, :password_hash, Argon2.hash_pwd_salt(password))
  end

  defp add_password_hash(changeset), do: changeset
end
