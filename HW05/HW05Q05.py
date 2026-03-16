"""
שאלה 5 – ציונים בכיתה
קלוט מהמשתמש את מספר התלמידים בכיתה

כעת קלוט את הציון של כל תלמיד בלולאה
ציון שאינו בין 0 ל־100 – יש להתעלם ממנו ולא להתקדם לתלמיד הבא

לאחר שנקלטו ציונים תקינים עבור כל התלמידים
חשב והדפס את ממוצע הציונים
"""

grade_count = 0
number = int(input('enter number of students in class: '))
class_sum = 0
while grade_count < number:
    grade = int(input('enter a grade: '))
    if not 0 <= grade <= 100:
        continue
    class_sum += grade
    grade_count += 1
print(f"Class average: {class_sum / number}")
