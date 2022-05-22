defmodule JocaGame.Game.Match.Shop do
  alias JocaGame.Game.Match.Match
  alias JocaGame.Game, as: State
  @swords [%{name: "Espada Simples", price: 10, power: 10, code: 1, type: :sword_simple}, %{name: "Espada Mágica", price: 20, power: 20, code: 2, type: :sword_magic}, %{name: "Espada do Rei", price: 30, power: 30, code: 3, type: :sword_king}]
  @shields [%{name: "Escudo Simples", price: 10, power: 5, code: 4, type: :shield_simple}, %{name: "Escudo Mágica", price: 20, power: 15, code: 5, type: :shield_magic}, %{name: "Escudo do Rei", price: 30, power: 25, code: 6, type: :shield_king}]


  def init_shop(player) do
    IO.puts("\n")
    IO.puts("Bem vindo ao shopping!")
    # IO.puts('''
    #  ============================================================================
    #  | code: 1                | code: 2                | code: 3                |
    #  | Espada: #{@swords[:sword_simple].name} | Espada: #{@swords[:sword_magic].name} | Espada: #{@swords[:sword_magic].name} |
    #  | Valor: #{@swords[:sword_simple].price}              | Valor: #{@swords[:sword_magic].price}              | Valor: #{@swords[:sword_magic].price}              |
    #  ============================================================================
    # ''')
    # IO.puts('''
    #  ============================================================================
    #  | code: 4                | code: 5                | code 6                 |
    #  | Espada: #{@shields[:shield_simple].name} | Espada: #{@shields[:shield_magic].name} | Espada: #{@shields[:shield_king].name}  |
    #  | Valor: #{@shields[:shield_simple].price}              | Valor: #{@shields[:shield_magic].price}              | Valor: #{@shields[:shield_king].price}              |
    #  ============================================================================
    # ''')
    IO.puts("\n")
    IO.puts("==================================================")
    IO.puts("Code: 0 - Sair do shopping")
    IO.puts("Espadas")

    @swords
    |> Enum.each(fn x -> IO.puts("Code:#{x.code} | #{x.name} - poder: #{x.power} - valor #{x.price}") end)

    IO.puts("Escudos")

    @shields
    |> Enum.each(fn x -> IO.puts("Code:#{x.code} | #{x.name} - poder: #{x.power} - valor #{x.price}") end)
    IO.puts("==================================================")
    IO.puts("\n")

    IO.gets("Digite o Code do item que deseja comprar \n")
    |> Integer.parse()
    |> get_code_buy(player)
  end

  def get_code_buy(:error, player) do
    IO.puts("Entrada invalida")
    IO.puts("====================================")
    init_shop(player)
  end

  def get_code_buy({code, _}, player) when code in 4..6 do
    item_selected = @shields
    |> Enum.find(fn x -> x[:code] == code end)
    |> verify_buy(player, :shield)

    IO.puts(:escudo)
    IO.inspect(item_selected)
    IO.puts("====================================")
  end

  def get_code_buy({code, _}, player) when code in 1..3 do
    @swords
    |> Enum.find(fn x -> x[:code] == code end)
    |> verify_buy(player, :sword)
  end

  def get_code_buy({0, _}, _player) do
    Match.player_choice()
  end

  def get_code_buy(_code, player) do
    IO.puts("Entrada invalida")
    IO.puts("====================================")
    init_shop(player)
  end

  def verify_buy(item_selected, player, type) do
    cond do
      player.money >= item_selected.price ->
        player
        |> Map.replace(type, item_selected.type)
        |> Map.replace(:money, player.money - item_selected.price)
        |> State.update_user()

        IO.puts("\n")
        :timer.sleep(500)
        IO.puts("====================================")
        IO.puts("item comprado")
        IO.puts("====================================")
        Match.change_turn()
      player.money < item_selected.price ->
        IO.puts("Dinheiro insuficiente")
        init_shop(player)
      true -> true
    end
  end

  def get_random_sword() do
    @swords
    |> Enum.random()
  end

  def get_random_shield() do
    @shields
    |> Enum.random()

  end
end
