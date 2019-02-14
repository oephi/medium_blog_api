defmodule MediumBlogApi.Accounts.User do
  # Database plug
  use Ecto.Schema
  import Ecto.Changeset

  # this returns a struct with predefined values
  schema "users" do
    field(:email, :string, unique: true)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:password_confrmation, :string, virtual: true)
    field(:role, :string, default: "user")

    timestamps()
  end

  @doc false
  # changeset accepts a user struct and accepts an argument called attributes
  def changeset(user, attrs) do
    user
    # puts the attributes into the user struct
    |> cast(attrs, [:first_name, :last_name, :email, :password, :password_confirmation, :role])
    # validates info
    |> validate_required([:first_name, :last_name, :email, :password, :role])
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, &String.downcase(&1))
    |> validate_length(:password, min: 6, max: 100)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> hash_password
  end

  defp hash_password(changeset) do
    changeset
  end
end
