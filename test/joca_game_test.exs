defmodule JocaGameTest do
  use ExUnit.Case
  doctest JocaGame

  test "greets the world" do
    assert JocaGame.hello() == :world
  end
end
