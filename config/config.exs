# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :medium_blog_api,
  ecto_repos: [MediumBlogApi.Repo]

# Configures the endpoint
config :medium_blog_api, MediumBlogApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tKapIzWqDnrJRupLTWTmk/KFtKyHggso1TX4iRbnSF68wwJpB1aH4ylE2Nx1Upr3",
  render_errors: [view: MediumBlogApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MediumBlogApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Guardian config details
config :medium_blog_api, MediumBlogApi.Guardian,
       issuer: "medium_blog_api",
       secret_key: "6LQZMDN0ky4M+Zb+w3Y9+8eFy3pyQwbq+I48rvUW4SJS3yl2XozLAZCfiNxtQ03i"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
