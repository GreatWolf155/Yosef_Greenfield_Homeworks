"""
שאלה 2 – הציון של דני
קלוט מהמשתמש את הציון של דני

כעת קלוט ציונים של שאר תלמידי הכיתה
הקליטה תימשך עד שייקלט ציון שלילי או ציון גדול מ־100

לאחר סיום הקליטה
בדוק והדפס האם הציון של דני הוא הציון הגבוה ביותר בכיתה או לא
"""

dani_max = True
dani_grade = int(input("please input Dani's grade: "))
while True:
    check = int(input("please input another grade: "))
    if check > 100 or check < 0:
        break
    if check > dani_grade:
        dani_max = False
print(f"Dani's grade is the highest in the class? {dani_max}")