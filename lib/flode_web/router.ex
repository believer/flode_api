defmodule FlodeWeb.Router do
  use FlodeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FlodeWeb do
    pipe_through :api
  end

  forward "/graphiql",
          Absinthe.Plug.GraphiQL,
          schema: Flode.Schema,
          interface: :simple
end
