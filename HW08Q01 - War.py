"""
Card Game: WAR
Objective
Build a simple card game between a player and the computer
The goal is to be the first to reach 10 points

Game Rules
The player gets one random card

The computer gets one random card

Card values:

A (Ace) → highest
K (King)
Q (Queen)
J (Jack)
10, 9, 8, .... 2
Use this code to generate random cards: click here

Scoring Rules
Player card > Computer card → Player gets +1 point
Computer card > Player card → Computer gets +1 point
Draw (same value) → 0 points to both
Game Flow
Start both scores at 0

Repeat rounds:

Deal one card to the player
Deal one card to the computer
Show both cards and their values
Update scores according to the rules
The game ends when:

Player score reaches 10 → Player wins
Computer score reaches 10 → Computer wins
"""



import random

player_score = 0
computer_score = 0
while player_score < 10 and computer_score < 10:
    #player gets a card
    player_suit = random.choice(["❤️", "♦️", "♣️", "♠️"])
    player_card = random.choice([2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'])
    print("Your card is:", player_card, player_suit)
    if player_card == 'J':
        player_power = 11
    elif player_card == 'Q':
        player_power = 12
    elif player_card == 'K':
        player_power = 13
    elif player_card == 'A':
        player_power = 14
    else:
        player_power = player_card

    #computer gets a card, but we need to make sure it isnt the same card
    while True:
        computer_suit = random.choice(["❤️", "♦️", "♣️", "♠️"])
        computer_card = random.choice([2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'])
        if player_card == computer_card and player_suit == computer_suit:
            continue
        break

    print("Computer's card is:", computer_card, computer_suit)
    if computer_card == 'J':
        computer_power = 11
    elif computer_card == 'Q':
        computer_power = 12
    elif computer_card == 'K':
        computer_power = 13
    elif computer_card == 'A':
        computer_power = 14
    else:
        computer_power = computer_card

    if player_power > computer_power:
        player_score += 1
    elif computer_power > player_power:
        computer_score += 1
    else:
        continue
    print()
    print("Player score:", player_score)
    print("Computer score:", computer_score)
    input()

if player_score == 10:
    print("Player wins")
else:
    print("Computer wins")