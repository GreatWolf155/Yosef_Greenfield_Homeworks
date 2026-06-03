"""
🚀 Bonus (Optional)
Add try / except:

If the user enters an invalid value (not a number), ask again
The program should not crash
Only valid numeric inputs should count as attempts
"""

def input_until_lucky(lucky_numbers: tuple) -> int:
    attempts = 1
    while True:
        try:
            user_guess = int(input("Enter your guess: "))
            if user_guess in lucky_numbers:
                return attempts
            else:
                attempts += 1
        except ValueError:
            print("Invalid input")
            continue