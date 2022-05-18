defmodule JocaGame.Game.Status do
  def welcome_message do
    IO.puts("Bem vindos!")
  end

  def status_players do

    Map.get(JocaGame.Game.info(), :players)
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
end
