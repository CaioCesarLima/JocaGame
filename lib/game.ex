defmodule JocaGame.Game do
  use Agent

  def start() do
    initial_value = %{players: {}, turn: 0, status: :attack}
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def info() do
    Agent.get(__MODULE__, & &1)
  end

  def add_player(player) do
     players = Map.get(info(), :players)
    |> Tuple.append(player)

    Map.replace(info(), :players, players)
    |> update_state()
  end

  def change_status(status) do
    info()
    |> Map.replace(:status, status)
    |> update_state()

  end

  def update_state(info) do
    Agent.update(__MODULE__, fn _ -> info end)
  end
end
