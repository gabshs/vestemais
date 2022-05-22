defmodule Vestemais.Establishments.Get do
  alias Vestemais.{Error, Repo}
  alias Vestemais.Establishments.Establishment

  def all do
    case Repo.all(Establishment) do
      establishments -> {:ok, establishments}
    end
  end

  def by_id(id) do
    case Repo.get(Establishment, id) do
      nil -> {:error, Error.establishment_not_found_error()}
      establishment -> {:ok, establishment}
    end
  end
end
