defmodule OhCrud.Project do
  use OhCrud.Web, :model

  schema "projects" do
    field :name, :string
    field :description, :string

    timestamps
  end

  @required_fields ~w(name description)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ nil) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
