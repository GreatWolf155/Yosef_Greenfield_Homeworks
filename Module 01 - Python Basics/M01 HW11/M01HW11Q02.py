"""
Question 2 – Basic math list (returns a list)
Write a function that gets two numbers a and b and returns a
list in this exact order:

[a+b, a-b, a/b, a*b]

Notes:
The function returns the list
Assume b != 0 (no need to handle division by zero)
Demo (example usage)
result = basic_math_list(10, 2)
print(result)
# expected output:
# [12, 8, 5.0, 20]
"""

def basic_math_list(a, b):
    return [a+b, a-b, a/b, a*b]

result = basic_math_list(10, 2)
print(result)