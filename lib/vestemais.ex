defmodule Vestemais do
  alias Vestemais.Establishments.Create, as: CreateEstablishment
  alias Vestemais.Establishments.Get, as: GetEstablishment

  defdelegate create_establishment(params), to: CreateEstablishment, as: :call
  defdelegate get_all_establishments, to: GetEstablishment, as: :all
end
