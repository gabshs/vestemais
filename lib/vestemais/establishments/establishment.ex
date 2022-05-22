defmodule Vestemais.Establishments.Establishment do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :cnpj, :phone, :lat, :long]

  @derive {Jason.Encoder, only: [:id, :name, :cnpj, :phone, :lat, :long]}

  schema "establishments" do
    field :name, :string
    field :cnpj, :string
    field :phone, :string
    field :lat, :string
    field :long, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
