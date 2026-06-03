"""
שאלה 4 – סוג משולש
משולש שווה שוקיים הוא משולש שבו שתי צלעות שוות
משולש שווה צלעות הוא משולש שבו כל שלוש הצלעות שוות

קלוט מהמשתמש שלוש צלעות של משולש

הדפס:

"משולש שווה צלעות" אם כל הצלעות שוות
"משולש שווה שוקיים" אם רק שתי צלעות שוות
"אינו משולש מיוחד" אם אינו אחד מהמקרים
"""

side1 = int(input("please input the length of the first side of the triangle: "))
side2 = int(input("please input the length of the second side of the triangle: "))
side3 = int(input("please input the length of the third side of the triangle: "))

if side1 == side2 == side3:
    print("משולש שווה צלעות")
elif side1 == side2 or side1 == side3 or side2 == side3:
    print("משולש שווה שוקיים")
else:
    print("אינו משולש מיוחד")