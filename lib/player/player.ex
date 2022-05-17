defmodule JocaGame.Player do
  @enforce_keys [:name, :life, :shield, :sword, :money]
  defstruct [:name, :life, :shield, :sword, :money]

  def build(name) do
    %JocaGame.Player{
      name: name,
      life: 100,
      shield: :none,
      sword: :hands,
      money: 0
    }
  end
end
