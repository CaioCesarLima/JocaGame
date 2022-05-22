defmodule JocaGame.Game.Match.Match do

  alias JocaGame.Game.Status
  alias JocaGame.Game.Match.{Shop, Attack, Donate}
  alias JocaGame.Game, as: State

  def match_start(), do: change_turn()

  def get_player_info(name) do
    Status.status_game()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> Enum.find_index(fn x -> x.name == name end)
  end

  defp players_list(players), do: players |> Tuple.to_list()

  def change_turn() do
    cond do
      Status.players_alive() > 1 ->
        Status.status_players()
        State.change_turn()
        Status.alert_turn()
        player_choice()
      Status.players_alive() == 1 ->
        game_over()
    end

  end
  def change_turn(:no_turn) do
    cond do
      Status.players_alive() > 1 ->
        Status.status_players()
        State.change_turn(:no_turn)
        Status.alert_turn()
        player_choice()
      Status.players_alive() == 1 ->
        State.change_turn(:no_turn)
        game_over()
    end

  end

  def player_choice() do
    turn = Status.get_turn()
    :timer.sleep(1000)
    IO.gets("Qual sua jogada? (atacar, comprar ou doar)\n")
    |> String.trim()
    |> String.to_atom()
    |> choice(turn)

  end

  defp choice(:atacar, turn) do
    oponent = random_player(Status.status_game())
    player = State.get_player_by_name(turn)
    Attack.init_attack(player, oponent)
  end
  defp choice(:doar, turn) do
    :timer.sleep(1000)
    player = State.get_player_by_name(turn)
    Donate.init_donate(player)
  end
  defp choice(:comprar, turn) do
    :timer.sleep(1000)
    Shop.init_shop(State.get_player_by_name(turn))
  end
  defp choice(_outro, _turn) do
    :timer.sleep(1000)
    IO.puts("escolha invalida")
    player_choice()
  end

  def random_player(%{players: players, turn: turn}) do
    oponent = players_list(players)
    |> Enum.random()
    cond do
      oponent.name == turn -> random_player(Status.status_game())
      true -> oponent
    end
  end

  def game_over() do
    Status.get_turn()
    |> State.get_player_by_name()
    |> Status.game_over()
  end
end
