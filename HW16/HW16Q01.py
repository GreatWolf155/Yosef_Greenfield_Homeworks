"""
Function 1
Create a function:

def get_lucky_numbers(amount: int) -> tuple[int]:
    pass

Mission:

Generate a tuple of random numbers
The tuple should contain amount numbers
Each number must be between 1 and 100

Example
get_lucky_numbers(3)

Possible output
(17, 83, 4)
"""
import random

def get_lucky_numbers(amount: int) -> tuple[int, ...]: # says the tuple can have a variable length
    return tuple(random.randint(1, 100) for _ in range(amount))