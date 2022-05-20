defmodule JocaGame.Game.Match.Attack do
  alias JocaGame.Game.Match.Match
  alias JocaGame.Game, as: State
  def init_attack(player, oponent) do
    IO.puts("\n")
    IO.puts("===========================")
    IO.puts("O jogador #{player.name} vai atacar #{oponent.name}")
    IO.puts("===========================")
    :timer.sleep(500)
    damage = calculate_damage(player, oponent)
    cond do
      oponent.life - damage <=0 ->
        State.player_dead(oponent)
        IO.puts("#{oponent.name} morreu!")
      oponent.life - damage > 0 ->
        oponent
        |> Map.replace(:life, oponent.life - damage)
        |> State.update_user()
    end
    player
    |> Map.replace(:money, player.money + 10)
    |> State.update_user()

    Match.change_turn()
  end

  def calculate_damage(player, oponent) do
    damage = case player.sword do
      :hands -> 100
      :sword_simple -> 10
      :sword_magic -> 20
      :sword_king -> 30
    end
    defense = case oponent.shield do
      :none -> 0
      :shield_simple -> 5
      :shield_magic -> 15
      :shield_king -> 25
    end
    cond do
      damage - defense >= 0 -> damage - defense
      damage - defense < 0 -> 0
    end
  end
end
