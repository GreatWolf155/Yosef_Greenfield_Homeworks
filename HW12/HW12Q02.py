"""
שאלה 2 – מערכת הצבעות ובדיקת מצביעים כפולים
קלוט מהמשתמש מספר ת.ז. של מצביע (נניח שמדובר במספרים בין 1 ל־100)

כללים:
כל מצביע שנקלט – הכנס לרשימה בשם votes
קולטים רק את ת.ז. של המצביע, ולא את ההצבעה עצמה
ייתכן שאותו מצביע ינסה להצביע יותר מפעם אחת
הקלט מסתיים כאשר מתקבל הערך 999-
לאחר סיום הקלט:

צור set של מצביעים ייחודיים מתוך הרשימה

צור set נוסף בשם invalid_voters

עבור על כל המצביעים:

כל מצביע שהופיע יותר מפעם אחת – הסר אותו מקבוצת המצביעים החוקיים
הוסף אותו ל־invalid_voters
לבסוף הדפס:

את כל המצביעים החוקיים
את כל המצביעים הפסולים
כמה ניסיונות הצבעה היו היום (כלומר אורך הרשימה כולל כפילויות)
רמזים:

ניתן להשתמש ב־count
ניתן לעבור על set כדי לא לחזור על אותו מצביע שוב ושוב
Example (דוגמה למערך + פלט)
נניח שבסוף היום הרשימה יצאה ככה (כולל כפילויות):

votes = [10, 7, 10, 3, 3, 50, 99]
ספירה:

10 הופיע פעמיים ⇒ פסול
3 הופיע פעמיים ⇒ פסול
7, 50, 99 הופיעו פעם אחת ⇒ חוקיים
פלט צפוי:

מצביעים חוקיים: [7, 50, 99]
מצביעים פסולים: [3, 10]
מספר ניסיונות הצבעה היום: 7
"""

"""
votes = []
invalid_voters = []
count = 0
while True:
    _id = int(input("please enter your id number: "))
    if _id == -999:
        break
    count += 1
    if _id in votes:
        votes.remove(_id)
        invalid_voters.append(_id)
        continue
    votes.append(_id)
print(f"Valid Voters: {votes}")
print(f"Invalid Voters: {invalid_voters}")
print(f"{count} votes were added.")

# answer without set

"""

votes = []
invalid_voters = set([])
valid_voters = set([])
while True:
    _id = int(input("please enter your id number: "))
    if _id == -999:
        break
    if _id in votes:
        invalid_voters.add(_id)
    else:
        valid_voters.add(_id)
    votes.append(_id)
valid_voters -= invalid_voters
print(f"Valid Voters: {valid_voters}")
print(f"Invalid Voters: {invalid_voters}")
print(f"{len(votes)} votes were added.")
