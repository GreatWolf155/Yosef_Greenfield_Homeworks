"""
Question 2 – Countdown with time.sleep
Use the time.sleep function to create the following output

Print 5
[Sleep 1 second]
Print 4
[Sleep 1 second]
Print 3
[Sleep 1 second]
Print 2
[Sleep 1 second]
Print 1
[Sleep 1 second]
Print 0 - Launch 🚀
Rules

Use import time
Use time.sleep(1) between prints
code exmaple:

import time

time.sleep(1)
"""
import time

for i in range(0, 6):
    print(5-i)
    if i == 5:
        print("launch")
        break
    time.sleep(1)
