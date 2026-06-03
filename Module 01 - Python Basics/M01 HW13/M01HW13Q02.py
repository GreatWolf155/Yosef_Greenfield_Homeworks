"""
Function 2
Create a function:

def input_until_lucky(lucky_numbers: tuple) -> int:
    pass

Mission:
The function receives the tuple of lucky numbers
Ask the user to input numbers
Continue asking until the user guesses one of the lucky numbers
When the user guesses correctly, stop the loop
Return the number of attempts the user needed

Example

Lucky numbers
(17, 83, 4)

User inputs
10
25
83

Output
3
"""

def input_until_lucky(lucky_numbers: tuple) -> int:
    attempts = 1
    while True:
        user_guess = int(input("Enter your guess: "))
        if user_guess in lucky_numbers:
            return attempts
        else:
            attempts += 1
