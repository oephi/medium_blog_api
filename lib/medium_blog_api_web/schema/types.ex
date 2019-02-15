defmodule MediumBlogApiWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias MediumBlogApiWeb.Schema.Types

  import_types(Types.UserType)
  import_types(Types.SessionType)
end