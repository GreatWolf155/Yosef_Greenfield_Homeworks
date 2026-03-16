"""
שאלה 3 – חדרים במלון
בכל חדר במלון יכולים לשהות 4 אנשים

קלוט מהמשתמש את מספר האנשים בקבוצה

חשב והדפס:

כמה חדרים יהיו מלאים
האם קיים חדר שאינו מלא
אם כן – כמה אנשים יהיו בחדר שאינו מלא
"""

guests = int(input("How many guests do you have? "))
print(f"Full rooms: {guests // 4}")
if guests % 4 == 0:
    all_full = True
else:
    all_full = False
print(f"All of the rooms will be full? {all_full}")
if not all_full:
    print(f"The last room will have {guests % 4} guests.")