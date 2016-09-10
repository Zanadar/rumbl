defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "Jose", username: "JoseValim", password: "elixir"},
      %Rumbl.User{id: "2", name: "Bruce", username: "redrapids", password: "elixir"},
      %Rumbl.User{id: "3", name: "Chris", username: "chrisMccord", password: "elixir"}
    ]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find(all(module), &(&1.id == id))
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all? params, fn {k, v} -> Map.get(map, k) == v end
    end
  end
end
