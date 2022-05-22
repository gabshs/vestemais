defmodule Vestemais.Repo.Migrations.CreateEstablishmentTable do
  use Ecto.Migration

  def change do
    create table(:establishments) do
      add :name, :string
      add :cnpj, :string
      add :phone, :string
      add :lat, :string
      add :long, :string

      timestamps()
    end
  end
end
