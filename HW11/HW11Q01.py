numbers = [10, 20, 30, 20, 40, 50]

"""
בצע את הפעולות הבאות:

הדפס כמה פעמים המספר 20 מופיע ברשימה
הדפס את האינדקס של ההופעה הראשונה של 30
הוסף את המספר 99 לסוף הרשימה
הכנס את המספר 15 לאינדקס 2
מחק את ההופעה הראשונה של 20
הסר את הערך שנמצא באינדקס 3 באמצעות pop והדפס מה הוסר
הדפס את הערך המקסימלי ברשימה
הדפס את הערך המינימלי ברשימה
הדפס את סכום כל האיברים
הדפס את הממוצע בעזרת statistics.mean
הדפס כמה איברים יש ברשימה
יש להשתמש ב: count, index, append, insert, remove, pop, max, min, sum, len
"""

print(numbers.count(20))

print(numbers.index(30))

numbers.append(99)

numbers.insert(2, 15)

numbers.remove(20)

print(numbers[3])

numbers.pop(3)

print(max(numbers))

print(min(numbers))

print(sum(numbers))

import statistics
print(statistics.mean(numbers))

print(len(numbers))

print(numbers)