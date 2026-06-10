"""
שאלה 4 – דירוג 10 סרטים
יש 10 סרטים שצריך לדרג
קלוט מהמשתמש דירוגים (מספרים שלמים) בין 1 ל־5

המשך לקלוט עד שהתקבלו דירוגים תקינים עבור כל 10 הסרטים
דירוג שלא בין 1 ל־5 – יש להתעלם ממנו ולא לספור אותו

בסיום הדפס את ציון הסרט הכי גבוה ואת ציון הסרט הכי נמוך מתוך 10 הסרטים שנקלטו
"""

minimum = 5
maximum = count = 0
while count < 10:
    number = int(input('enter movie rating: '))
    if number > 5 or number < 1:
        continue
    if number > maximum:
        maximum = number
    if number < minimum:
        minimum = number
    count += 1
print(f"minimum number: {minimum}")
print(f"maximum number: {maximum}")