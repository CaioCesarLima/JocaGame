defmodule JocaGame.Game.Match.Donate do
  alias JocaGame.Game
  alias JocaGame.Game.Status
  alias JocaGame.Game.Match.{Shop, Match}
  @rewards [:money, :damage, :death, :cure, :shield, :sword,  :opponent_death]
  def init_donate(player) do
    IO.puts("\n")
    IO.puts("Escolheu fazer uma doação, muito bem!")
    IO.puts("Toda doação tem uma consequência. pode ser boa ou ruim. Sua sorte que dirá")
    IO.puts("\n")
    @rewards
    |> Enum.random()
    |> reward(player)

  end

  def reward(:money, player) do
    IO.puts("\n")
    IO.puts("Ganhou 10 moedas")
    player
    |> Map.replace(:money, player.money + 10)
    |> Game.update_user()

    Match.change_turn()
  end

  def reward(:damage, player) do
    IO.puts("\n")
    IO.puts("perdeu 10 pontos de vida")

    player
    |> Map.replace(:life, player.life - 10)
    |> Game.update_user()

    Match.change_turn()
  end

  def reward(:death, player) do
    IO.puts("\n")
    IO.puts("Você morreu")

    player
    |> Game.player_dead()

    Match.change_turn(:no_turn)
  end

  def reward(:cure, player) do
    IO.puts("\n")
    IO.puts("Ganhou 10 pontos de vida")

    player
    |> Map.replace(:life, player.life + 10)
    |> Game.update_user()

    Match.change_turn()
  end

  def reward(:shield, player) do
    IO.puts("\n")
    IO.puts("Ganhou um escudo novo")

    shield = Shop.get_random_shield()
    player
    |> Map.replace(:shield, shield.type)
    |> Game.update_user()

    Match.change_turn()
  end

  def reward(:sword, player) do
    IO.puts("\n")
    IO.puts("Ganhou uma espada nova")

    sword = Shop.get_random_sword()
    player
    |> Map.replace(:sword, sword.type)
    |> Game.update_user()

    Match.change_turn()
  end

  def reward(:opponent_death, _player) do
    IO.puts("\n")
    IO.puts("Um oponente vai morrer")

    Match.random_player(Status.status_game())
    |> Game.player_dead()

    Match.change_turn(:no_turn)
  end
end
