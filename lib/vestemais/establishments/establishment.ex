defmodule Bifrost.Establishments.Establishment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :cnpj, :category]

  @derive {Jason.Encoder, only: [:id, :name, :cnpj, :category]}

  schema "stablishments" do
    field :name, :string
    field :cnpj, :string
    field :category, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
