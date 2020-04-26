defmodule Covid66live.Info.Virus do
  #defstruct [:code, :name, :description]
  use Ecto.Schema
  import Ecto.Changeset

  schema "viruses" do
    field :code, :string
    field :name, :string
    field :description, :string

    timestamps()
  end

end
