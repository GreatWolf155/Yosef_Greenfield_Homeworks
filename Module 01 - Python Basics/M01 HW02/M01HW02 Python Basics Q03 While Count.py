"""
שאלה 3 – קלט עד ‎-999
קלוט מספרים מהמשתמש בלולאה
הקליטה תימשך עד שייקלט המספר ‎-999

בסיום הדפס:

כמה מספרים נקלטו (לא כולל ‎-999)
מה סכום כל המספרים שנקלטו (לא כולל ‎-999)
"""

count = 0
add = 0
while True:
    number = int(input('enter number? '))
    if number == -999:
        break
    count += 1
    add += number
print(f"input numbers: {count}")
print(f"sum of numbers: {add}")