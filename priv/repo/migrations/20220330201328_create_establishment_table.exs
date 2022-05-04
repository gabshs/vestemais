defmodule Vestemais.Repo.Migrations.CreateEstablishmentTable do
  use Ecto.Migration

  def change do
    create table(:establishments) do
      add :name, :string
      add :cnpj, :string
      add :category, :string

      timestamps()
    end
  end
end
