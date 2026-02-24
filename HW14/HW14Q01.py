"""
Question 1 – Print numbers in range (no return)
Write a function that gets two int parameters: start and stop

The function should print all numbers from start to stop (inclusive)

Notes:
This function does not return a value
Use a loop (for with range) inside the function
Demo (example usage)
print_numbers(3, 7)
# expected output:
# 3
# 4
# 5
# 6
# 7
"""

def print_numbers(start, stop):
    for n in range(start, stop+1):
        print(n)

print_numbers(3, 7)