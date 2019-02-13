defmodule MediumBlogApiWeb.Router do
  use MediumBlogApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", MediumBlogApiWeb do
    pipe_through(:api)
  end
end
