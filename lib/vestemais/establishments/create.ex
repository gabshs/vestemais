defmodule Vestemais.Establishments.Create do
  alias Vestemais.{Error, Repo}
  alias Vestemais.Establishments.Establishment

  def call(params) do
    params
    |> Establishment.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Establishment{}} = establishment), do: establishment

  defp handle_insert({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end
end
