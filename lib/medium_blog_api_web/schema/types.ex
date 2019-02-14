defmodule MediumGraphqlApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias MediumBlogApiWeb.Schema.Types

  import_types(Types.UserType)
end