defmodule JocaGame do
  alias JocaGame.Player
  use Application

  def start(_type, _args) do
    run()
    {:ok, self()}
  end

  def run(:erro) do
    IO.gets("Quantos jogadores irão participar da partida? \n")
    |> Integer.parse()
    |> parse()
  end

  def run do
    IO.puts("Bem vindo ao jogo!")
    IO.gets("Quantos jogadores irão participar da partida? \n")
    |> Integer.parse()
    |> parse()
  end

  defp parse(:error) do
    IO.puts("Entrada invalida")
    IO.puts("====================================")
    run(:erro)
  end

  defp parse({number, _}) do
    IO.puts("====================================")
    number
    |>create_player()
  end

  defp create_player(number) when number > 0 do
    player = IO.gets("Nome do jogador? \n")
    |> Player.build()

    IO.puts('''
      -----------------------------
      | Jogador #{player.name}
      | Vida: #{player.life} - dinheiro: #{player.money}
      ---------------------------
    ''')

    create_player(number - 1)
  end

  defp create_player(0) do
    IO.puts("Todos jogadores criados!")
    IO.puts("Tenha um ótimo jogo")

  end

end
