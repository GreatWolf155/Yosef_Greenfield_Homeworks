grades = [85, 90, 78, 92, 88]

"""
בצע את הפעולות הבאות:

1- צור עותק גיבוי של הרשימה
2- נקה את הרשימה המקורית
3- הדפס את שתי הרשימות כדי להוכיח שהעותק נשמר
4- חבר את הרשימה [100, 95] לרשימת הגיבוי בשתי דרכים שונות :

פעם אחת עם +
פעם אחת עם extend
יש להשתמש ב: copy, clear, extend
"""

grades_copy = grades.copy()
grades.clear()

print(grades)
print(grades_copy)

grades_copy += [95, 100]
grades_copy.extend([95, 100])
print(grades_copy)