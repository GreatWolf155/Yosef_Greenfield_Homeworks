"""
שאלה 1 – דירוג ציון
קלוט מהמשתמש ציון (מספר שלם)

כללים:

אם הציון גדול מ־100 או קטן מ־0 – הדפס invalid
אחרת, אם הציון בין 80 ל־100 (כולל) – הדפס VERY GOOD
אחרת, אם הציון בין 60 ל־80 (כולל 60, לא כולל 80) – הדפס NOT BAD
אחרת, אם הציון בין 40 ל־60 (כולל 40, לא כולל 60) – הדפס TRY HARDER
אחרת, אם הציון בין 0 ל־40 (כולל) – הדפס NEED MORE EXERCISE
הערה: יש להשתמש ב־if / elif / else
"""

grade = int(input("Please input a grade: "))
if 0 > grade or grade > 100:
    print("invalid")
elif 80 <= grade <= 100:
    print("VERY GOOD")
elif 60 <= grade < 80:
    print("NOT BAD")
elif 40 <= grade < 60:
    print("TRY HARDER")
else:
    print("NEED MORE EXERCISE")