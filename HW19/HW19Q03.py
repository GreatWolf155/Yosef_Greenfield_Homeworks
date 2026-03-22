"""
Question 3 -- BONUS – Casino Slot Machine
Starter code:

rate    = [   2,     3,    9,     7,   11]
symbols = ["🍒", "🍋", "⭐", "🔔", "💎"]
money = 50
print("=== SLOT MACHINE === \n")
Goal: build a slot machine with 3 spinning slots

Rules:

Each spin shows 3 random symbols
The player starts with 50 money
Before each spin, ask the user how much they want to bet
The bet must be between 1 and the current money
The user can choose to quit the game
Update the player’s money after each round
Winning rules:

All 3 symbols different → player loses the bet
2 of a kind → player gets bet * rate
3 of a kind → player gets bet * 777 * rate
Spin examples:

🍒 🍋 ⭐ → all different → lose
💎 💎 🍋 → 2 of a kind → win bet * 11
⭐ ⭐ ⭐ → 3 of a kind → win bet * 777 * 9
🔔 🍒 🔔 → 2 of a kind → win bet * 7
Important:

The correct rate depends on the matching symbol
Example: 3 × 🍋 → use rate 3
Example: 2 × 💎 → use rate 11
Game ends when:

The player chooses to quit
OR the player runs out of money
Hints:

Use random.choice or random.randint
Keep track of symbol indexes to match the correct rate
First check for 3 matches, then for 2 matches
"""
import random

def receive_bet(current_cash) -> int:
    """
    player decides how much to bet
    :param current_cash:
    :return: place_bet int: (bet amount, cash remaining)
    """
    while True:
        try:
            place_bet = int(input(f"You have up to ${current_cash} to spend\nHow much do you want to gamble?\nEnter a number, or press 0 to exit\n"))
            if place_bet == 0:
                return 0
            elif place_bet < 0:
                print("Lemme just double that negative winnings for you right now...")
            elif place_bet > current_cash:
                print("Sorry, you don't have enough money")
            else:
                return place_bet
        except ValueError:
            print("Invalid input. Please enter a whole number.")

def check_roller(roll, _rate, _symbols) -> int:
    """
    check the outcome of the roll
    :param roll: list of symbols
    :param _rate: list of rates
    :param _symbols: master list of symbols
    :return: the win rate
    """
    for item in roll:
        if roll.count(item) == 3:
            return _rate[_symbols.index(item)] * 777
        elif roll.count(item) == 2:
            return _rate[_symbols.index(item)]
    return 0

def spin_roller(bet) -> int:
    """
    spin the roller, win big
    :param bet: how much the player bet
    :return: winnings
    """
    print("=== SLOT MACHINE === \n")
    roll = list(random.choice(symbols) for _ in range(3))
    print(roll)
    return check_roller(roll, rate, symbols) * bet

def update_wallet(current_cash, winnings, bet) -> int:
    """
    :param current_cash: how much money the player has left
    :param winnings: how much the player has won
    :param bet: how much the player bet
    :return: updated cash
    """
    return current_cash + winnings - bet


rate    = [   2,     3,    9,     7,   11]
symbols = ["🍒", "🍋", "⭐", "🔔", "💎"]
money = 50
while True:
    print("=== SLOT MACHINE === \n")
    wager = receive_bet(money)
    if wager == 0:
        break
    prize = spin_roller(wager)
    if prize > 0:
        print(f"WINNER! You won ${prize}!")
    else:
        print(f"No luck. You lost your ${wager} bet.")
    money = update_wallet(money, prize, wager)
    if money == 0:
        break
print(f"Thank you for playing!\nYour money is now ${money}")