"""
שאלה 2 – מלבן של כוכביות
קלוט מהמשתמש:

מספר שורות
מספר עמודות
הדפס מלבן של * לפי המידות

דוגמה: אם נקלטו שורות 3 ועמודות 5 אז הפלט צריך להיות

*****
*****
*****
"""

columns = int(input("Enter number of columns: "))
rows = int(input("Enter number of rows: "))
for i in range(0, rows):
    for j in range(0, columns):
        print("*", end="")
    print()