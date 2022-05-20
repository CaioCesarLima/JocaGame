defmodule JocaGame.Game.Status do
  alias JocaGame.Game
  def welcome_message do
    IO.puts("Bem vindos!")
  end

  def status_players do
    IO.puts("\n")
    Map.get(Game.info(), :players)
    |> Tuple.to_list()
    |> Enum.each(fn x ->
      :timer.sleep(500)
      IO.puts('''
      -----------------------------
      | Jogador #{x.name}
      | Vida: #{x.life} - dinheiro: #{x.money}
      ---------------------------
    ''')
      :timer.sleep(500)
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

  def alert_turn() do
    turn = status_game()
    |> Map.get(:turn)
    :timer.sleep(500)
    IO.puts("\n")
    IO.puts("================================================================")
    IO.puts("Vez do jogador: #{turn}")
    IO.puts("================================================================")
    IO.puts("\n")
    :timer.sleep(500)
  end

  def players_alive do
    Game.info()
    |> Map.get(:players)
    |> Tuple.to_list()
    |> length()
  end

  def get_turn() do
    Game.info()
    |> Map.get(:turn)
  end

  def game_over(player) do
    IO.puts("\n")
    :timer.sleep(500)
    IO.puts("**********")
    IO.puts("Game over")
    IO.puts("**********")
    :timer.sleep(500)
    IO.puts("\n")
    IO.puts("===================================================")
    IO.puts("Vencedor: #{player.name}!")
    IO.puts("===================================================")
    IO.puts("\n")
    :timer.sleep(1000)
    IO.puts('''

    < Obrigado por jogar! >
    ------------------------
          ||   ^__^
          ||   (oo)|_______
               (__)|       |_/
                   ||----w |
                   ||     ||
    ''')
  end
end
