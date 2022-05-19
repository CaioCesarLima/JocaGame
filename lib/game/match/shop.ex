defmodule JocaGame.Game.Match.Shop do
  @swords %{sword_simple: %{name: "Espada Simples", price: 10, power: 10}, sword_magic: %{name: "Espada Mágica", price: 20, power: 20}, sword_king: %{name: "Espada do Rei", price: 30, power: 30}}
  @shields %{shield_simple: %{name: "Escudo Simples", price: 10, power: 5}, shield_magic: %{name: "Escudo Mágica", price: 20, power: 15}, shield_king: %{name: "Escudo do Rei", price: 30, power: 25}}


  def init_shop(player) do
    IO.puts("Bem vindo ao shopping!")
    IO.puts('''
     ============================================================================
     | code: 1                | code: 2                | code: 3                |
     | Espada: #{@swords[:sword_simple].name} | Espada: #{@swords[:sword_magic].name} | Espada: #{@swords[:sword_magic].name} |
     | Valor: #{@swords[:sword_simple].price}              | Valor: #{@swords[:sword_magic].price}              | Valor: #{@swords[:sword_magic].price}              |
     ============================================================================
    ''')
    IO.puts('''
     ============================================================================
     | code: 4                | code: 5                | code 6                 |
     | Espada: #{@shields[:shield_simple].name} | Espada: #{@shields[:shield_magic].name} | Espada: #{@shields[:shield_king].name}  |
     | Valor: #{@shields[:shield_simple].price}              | Valor: #{@shields[:shield_magic].price}              | Valor: #{@shields[:shield_king].price}              |
     ============================================================================
    ''')

    IO.gets("Digite o Code do item que deseja comprar \n")
    |> Integer.parse()
    |> get_code_buy(player)
  end

  def get_code_buy(:error, player) do
    IO.puts("Entrada invalida")
    IO.puts("====================================")
    init_shop(player)
  end
  def get_code_buy({code, _},_player) when code in 4..6 do
    IO.puts(:escudo)
    IO.puts("====================================")
  end
  def get_code_buy({code, _},_player) when code in 1..3 do
    IO.puts(:espada)
    IO.puts("====================================")
  end



end
