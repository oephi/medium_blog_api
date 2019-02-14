defmodule MediumBlogApiWeb.Router do
  use MediumBlogApiWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api" do
    pipe_through(:api)

    forward("/graphql", Absinthe.Plug, schema: MediumBlogApiWeb.Schema)

    if Mix.env() == :dev do
     forward("/graphiql", Absinthe.Plug.GraphiQL, schema: MediumBlogApiWeb.Schema)      
    end

  end
end
