defmodule JocaGame.Game.Match.Match do

  alias JocaGame.Game.Status

  def match_start(), do: IO.puts("Ok")

  def get_player_info(name) do
    Status.status_game()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> Enum.find_index(fn x -> x.name == name end)
  end
  def player_attack() do
    random_player(Status.status_game())

  end

  defp random_player(%{players: players, turn: turn}) do
    oponent = players_list(players)
    |> Enum.random()
    cond do
      oponent.name == turn -> random_player(Status.status_game())
      true -> oponent
    end
  end

  defp players_list(players), do: players |> Tuple.to_list()


end
