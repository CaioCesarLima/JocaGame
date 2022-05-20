defmodule JocaGame do
  alias JocaGame.{Game.Status, Player, Game.Match.Match}
  use Application

  def start(_type, _args) do
    JocaGame.Game.start()
    IO.ANSI.clear()
    run()
    {:ok, self()}
  end

  def run(:erro) do
    IO.puts("\n")
    IO.gets("Quantos jogadores irão participar da partida? \n")
    |> Integer.parse()
    |> parse()
  end

  def run do
    Status.welcome_message
    IO.puts("\n")
    IO.gets("Quantos jogadores irão participar da partida? \n")
    |> Integer.parse()
    |> parse()
  end

  defp parse(:error) do
    :timer.sleep(500)
    IO.puts("\n")
    IO.puts("Entrada invalida")
    IO.puts("====================================")
    run(:erro)
  end

  defp parse({number, _}) do
    :timer.sleep(500)
    number
    |>create_player()
  end

  defp create_player(number) when number > 0 do
    IO.puts("\n")
    player = IO.gets("Nome do jogador? \n")
    |> String.trim()
    |> Player.build()

    JocaGame.Game.add_player(player)


    # IO.puts('''
    #   -----------------------------
    #   | Jogador #{player.name}
    #   | Vida: #{player.life} - dinheiro: #{player.money}
    #   ---------------------------
    # ''')

    create_player(number - 1)
  end

  defp create_player(0) do
    IO.ANSI.color_background(2, 4, 5)
    IO.ANSI.clear()

    Match.match_start()

  end

end
