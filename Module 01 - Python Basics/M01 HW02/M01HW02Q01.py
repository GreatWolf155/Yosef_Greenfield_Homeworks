"""
שאלה 1 – זוגי או אי־זוגי
קלוט מהמשתמש מספר שלם
אם המספר זוגי – הדפס even
אחרת – הדפס odd

הערה: יש להשתמש בהמרה ל־int, לדוגמה: number = int(input('enter number? '))
"""

number = int(input('enter number? '))
if number % 2 == 0:
    print("even")
else:
    print("odd")