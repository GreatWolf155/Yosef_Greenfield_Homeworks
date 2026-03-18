"""
שאלה 1 – שטח משולש
שטח משולש מחושב כך:
גובה × בסיס ÷ 2

קלוט מהמשתמש גובה
אם הגובה אינו מספר חיובי – המשך לקלוט עד שייקלט מספר חיובי

קלוט מהמשתמש בסיס
אם הבסיס אינו מספר חיובי – המשך לקלוט עד שייקלט מספר חיובי

חשב והדפס את שטח המשולש
"""

height = 0
base = 0
while height <= 0:
    height = int(input("Please input a triangle height: "))
while base <= 0:
    base = int(input("Please input a triangle base: "))
area = base * height / 2
print(area)