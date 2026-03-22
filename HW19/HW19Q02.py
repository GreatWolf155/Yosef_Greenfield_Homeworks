"""
🔐 Question 2 – Safe Code
You are given a secret code:

[77, 12, 43, 100, 51]

Goal: the user must enter the numbers exactly in the correct sequence

Rules:

Go through the secret code in order
Each time, the user enters one number
If the number is correct → move to the next number
If the user makes even ONE mistake → reset progress and start again from the beginning
The loop only ends when the full sequence is entered correctly
Example:

4, 10, 77, 12, 43, 77

Explanation:

4 → wrong
10 → wrong
77 → correct (start)
12 → correct
43 → correct
77 → wrong → reset to start
Hint:

Use an index variable to track your position in the code
Reset the index to 0 when there is a mistake
"""

secret_code = [77, 12, 43, 100, 51]

# Solution 1
while True:
    _one = int(input("First digit: "))
    if _one != secret_code[0]:
        continue
    _two = int(input("Second digit: "))
    if _two != secret_code[1]:
        continue
    _three = int(input("Third digit: "))
    if _three != secret_code[2]:
        continue
    _four = int(input("Fourth digit: "))
    if _four != secret_code[3]:
        continue
    _five = int(input("Fifth digit: "))
    if _five != secret_code[4]:
        continue
    break

# Solution 2
while True:
    for dig in range(len(secret_code)):
        num = int(input(f"Digit {dig + 1}: "))
        if num != secret_code[dig]:
            break
    else:
        break