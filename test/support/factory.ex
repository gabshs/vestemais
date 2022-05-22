defmodule Vestemais.Factory do
  use ExMachina.Ecto, repo: Vestemais.Repo

  alias Vestemais.Establishments.Establishment

  def establishment_params_factory do
    %{
      name: "Lar do lar",
      cnpj: "11.1231.132/00001-12",
      phone: "(62) 9 9443-3917",
      lat: "41.40338",
      long: "2.17403"
    }
  end

  def establishment_factory do
    %Establishment{
      name: "Lar do lar",
      cnpj: "11.1231.132/00001-12",
      phone: "(62) 9 9443-3917",
      lat: "41.40338",
      long: "2.17403"
    }
  end
end
