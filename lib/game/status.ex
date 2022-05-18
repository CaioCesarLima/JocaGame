defmodule JocaGame.Game.Status do
  def welcome_message do
    IO.puts("Bem vindos!")
  end

  def status_players do
    IO.inspect(JocaGame.Game.info())
  end
end
