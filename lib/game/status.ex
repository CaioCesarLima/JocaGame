defmodule JocaGame.Game.Status do
  alias JocaGame.Game
  def welcome_message do
    IO.puts("Bem vindos!")
  end

  def status_players do

    Map.get(Game.info(), :players)
    |> Tuple.to_list()
    |> Enum.each(fn x ->
      IO.puts('''
      -----------------------------
      | Jogador #{x.name}
      | Vida: #{x.life} - dinheiro: #{x.money}
      ---------------------------
    ''')
    end)
  end

  def status_game() do
    Game.info()
  end

  def get_player_info(name) do
    status_game()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> Enum.find_index(fn x -> x.name == name end)
  end
end
