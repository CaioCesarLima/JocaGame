# JocaGame

**my son had the idea and i executed it with elixir lang**

On a road trip my son came up with the idea for the game that has the following rules:

1. The game can have as many participants as you want
   1. two is the minimum number of participants allowed
2. all players start with full health, no sword and no shield and must only enter their name
3. The game is divided into turns
   1. the sequence of turns follows the sequence of players registered at the beginning of the game
   2. on each turn the player will be able to choose what his move will be
      1. Attack: the player who chooses to attack will attack a player that the game randomly draws and the sword that the player is equipped will be taken into account and also the shield that the opponent is using to defend himself and thus the total damage that will hit the opponent will be calculated.
      2. Purchase: the player will enter the store and will be able to choose to buy among the items offered
      3. Donate: when choosing to donate the player will donate ten coins to some other participant
4. About the attack:
    1. the power of the attack will be defined by the attack item that is equipped to the player, the power of the items being as follows:
      1.  simple sword: the value is 10 coins and the power is 10 damage
      1.  magic sword: the value is 20 coins and the power is 20 damage
      2.  king's sword: the value is 30 coins and the power is 30 damage
    2. all players start with no sword and their damage is 5 life
5. About the shields:
   1. the strength to defend against an attack will be defined by the defense item that is equipped to the player, the defense power of the items being the following:
      1. simple shield: the value is 10 coins and the defense power is 5
      2. magic shield: the value is 20 coins and the defense power is 15
      3. king's shield: the value is 30 coins and the defense power is 25
   2. all participants start with no defense items and defense strength value is zero
6. On the calculation of damage to the opponent:
   1. The calculation of damage to the opponent takes into account two factors: the attacking power of the attacking player and the opponent's defensive power. the result of the calculation will be the damage that the opponent will suffer on that turn
7. About donates:
   1. the donation will always be the fixed amount of 10 coins
   2. the recipient of the donation will be chosen randomly by the game
   3. when making the donation, the player will receive a reward, which can be a good or bad reward. The possible rewards are the following:
      1. hit points increase, loss points of life, win a sword, win a shield, the player who made the donation dies, an opponent dies or earn coins
      2. the reward is randomly chosen by the game
8. Game over:
   1. the end of the game occurs when there is only one player left alive and she will be the winner
