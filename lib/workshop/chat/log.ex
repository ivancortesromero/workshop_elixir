defmodule Workshop.Chat.Log do
  use Ecto.Schema
  import Ecto.Changeset
  alias Workshop.Chat.Log


  schema "logs" do
    field :message, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(%Log{} = log, attrs) do
    log
    |> cast(attrs, [:user, :message])
    |> validate_required([:user, :message])
  end
end
