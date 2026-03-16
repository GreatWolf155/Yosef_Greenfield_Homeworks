"""
שאלה 2 – מחלקים קטנים
קלוט מהמשתמש מספר שלם
בדוק לפי הסדר:

אם המספר מתחלק ב־2 ללא שארית – הדפס 2
אחרת, אם המספר מתחלק ב־3 ללא שארית – הדפס 3
אחרת, אם המספר מתחלק ב־5 ללא שארית – הדפס 5
אחרת – הדפס no small dividers
"""

number = int(input('enter number? '))

if number % 2 == 0:
    print(2)
elif number % 3 == 0:
    print(3)
elif number % 5 == 0:
    print(5)
else:
    print("no small dividers")