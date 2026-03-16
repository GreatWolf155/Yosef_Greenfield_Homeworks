"""
שאלה 5 – אתגר ⭐
קלוט מספרים מהמשתמש

הקליטה תימשך עד אשר ייקלטו שני מספרים זהים ברצף

רמז:
בכל שלב יש לזכור את המספר האחרון שנקלט

כאשר מתקיים התנאי – סיים את התוכנית
"""

previous = int(input("please input a number: "))
current = None
while current != previous:
    current = int(input("please input a number: "))
    if current == previous:
        break
    previous = current
    current = None