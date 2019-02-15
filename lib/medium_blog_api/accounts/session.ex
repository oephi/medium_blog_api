defmodule MediumBlogApi.Accounts.Session do
  alias MediumBlogApi.Accounts.User
  alias MediumBlogApi.Repo

  def authenticate(args) do
    user = Repo.get_by(User, email: String.downcase(args.email))

    case check_password(user, args)  do
      true -> {:ok, user}
      _ -> {:error, "Incorrect login credentials, please try again"}
    end
  end

  defp check_password(user, args) do
    case user do
      nil -> Argon2.dummy_checkpw()
      _ -> Argon2.verify_pass(args.password, user.password_hash)
    end
  end

end