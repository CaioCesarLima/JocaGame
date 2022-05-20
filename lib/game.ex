defmodule JocaGame.Game do
  use Agent

  def start() do
    initial_value = %{players: {}, turn: "Caio", status: :attack}
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

  def change_turn() do
    player_index = info()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> Enum.find_index(fn x -> x.name == info().turn end)

    total_players = info()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> length()

    next_player_index = case player_index < total_players - 1 do
      true -> player_index + 1
      false -> 0
    end

    next_player_turn = info()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> Enum.at(next_player_index)

    info()
    |> Map.replace(:turn, next_player_turn.name)
    |> update_state()
  end

  def player_dead(player) do
    player_index = info()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> Enum.find_index(fn x -> x.name == player.name end)

    players = info()
    |> Map.get(:players)
    |> Tuple.delete_at(player_index)

    info()
    |> Map.replace(:players, players)
    |> update_state()
  end

  def get_player_by_name(name) do
    info()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> Enum.find(fn x -> x.name == name end)
  end


  def update_user(player) do
    player_index = info()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> Enum.find_index(fn x -> x.name == player.name end)

    players = info()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> List.replace_at(player_index, player)
    |> List.to_tuple()

    info()
    |> Map.replace(:players, players)
    |> update_state()
  end
end
