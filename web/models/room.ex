defmodule Peepchat.Room do
  use Peepchat.Web, :model

  schema "rooms" do
    field :name, :string
    belongs_to :owner, Peepchat.Owner

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 4)
    |> unique_constraint(:name)
  end
end
