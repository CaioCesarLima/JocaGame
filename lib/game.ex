defmodule JocaGame.Game do
  use Agent

  def start(player) do
    initial_value = %{players: {player}, turn: 0, status: :attack}
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info() do
    Agent.get(__MODULE__, & &1)
  end

  def add_player(player) do
     players = Map.get(info(), :players)
    |> Tuple.append(player)

    info = Map.replace(info(), :players, players)

    Agent.update(__MODULE__, fn _ -> info end)
  end
end
