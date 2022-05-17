defmodule GameJoca.Game do
  use Agent

  def start(players) do
    initial_value = %{players: players, turn: 0, status: :attack}
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end
end
