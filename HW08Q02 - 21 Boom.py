"""
Card Game: 21 Boom 🃏
Objective
Build a simple two-player card game. The goal is to get as close as possible to 21 without going over

Card Rules
Number cards → value is the number
J / Q / K → value is 10
A (Ace) → value is 1
Use this code to generate random cards: click here
Game Setup
There are 2 players: Player 1 and Player 2
Each player starts with 2 random cards
Each player plays one at a time
Player Turn Rules
During a player turn:

Show the current cards and total value
Ask the player to choose:
0 = STOP
1 = CONTINUE
If the player chooses CONTINUE (1) → give one more card
If the player chooses STOP (0) → end the turn
If total equals 21 → instant win
If total is greater than 21 → player is disqualified
Game Flow
Player 1 plays first
Player 1 keeps choosing STOP or CONTINUE until:

they stop
reach 21
or are disqualified
Player 2 plays second
Player 2 plays only after Player 1 finishes
Same rules apply
Winner Decision
If one player is disqualified → the other player wins

If both players are valid:

the player closer to 21 wins
If both totals are equal → draw
"""


import random

#initialize score
player_1_power = 0
player_2_power = 0
deal = 1
first_deal = 2

while player_1_power <= 21 and deal == 1:
    for i in range(first_deal):
        player_suit = random.choice(["❤️", "♦️", "♣️", "♠️"])
        player_card = random.choice([2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'])
        print("Player 1's card is:", player_card, player_suit)
        if player_card in ['J', 'Q', 'K']:
            card_value = 10
        elif player_card == 'A':
            card_value = 1
        else:
            card_value = player_card
        player_1_power += card_value

    first_deal = 1
    print("Player 1 current tally:", player_1_power)
    if player_1_power >= 21:
        break
    print("Would you like to continue?")
    print("CONTINUE (1)")
    print("STOP (0)")
    deal = int(input())
if player_1_power == 21:
    print("Player 1 wins!")
elif player_1_power > 21:
    print("Player 1 disqualified!")
else:
    #reinitialize
    deal = 1
    first_deal = 2

    while player_2_power <= 21 and deal == 1:
        for i in range(first_deal):
            player_suit = random.choice(["❤️", "♦️", "♣️", "♠️"])
            player_card = random.choice([2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'])
            print("Player 2's card is:", player_card, player_suit)
            if player_card in ['J', 'Q', 'K']:
                card_value = 10
            elif player_card == 'A':
                card_value = 1
            else:
                card_value = player_card
            player_2_power += card_value

        first_deal = 1
        print("Player 2 current tally:", player_2_power)
        if player_2_power >= 21:
            break
        print("Would you like to continue?")
        print("CONTINUE (1)")
        print("STOP (0)")
        deal = int(input())

    if player_2_power > 21:
        print("Player 2 disqualified!")
    elif player_2_power == 21 or player_2_power > player_1_power:
        print("Player 2 wins!")
if player_2_power < player_1_power < 21:
    print("Player 1 wins!")
elif player_1_power == player_2_power:
    print("Draw!")

#note: 1am, im not dealing with duplicated cards right now