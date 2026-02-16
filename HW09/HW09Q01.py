"""
Question 1 – Sound system (match-case)
In a sound system there are volume levels from 1–10

1 – very quiet
2 – quiet
3 – low
4 – low
5 – medium
6 – medium high
7 – loud
8 – very loud
9 and 10 – max volume
Tasks

Input an integer from the user (1–10)
Use match case to display the correct sound description
If the number is not between 1–10 print invalid volume
"""

input_volume = int(input("Input volume from 1 to 10: "))

match input_volume:
    case 1:
        print("very quiet")
    case 2:
        print("quiet")
    case 3 | 4:
        print("low")
    case 5:
        print("medium")
    case 6:
        print("medium high")
    case 7:
        print("loud")
    case 8:
        print("very loud")
    case 9 | 10:
        print("max volume")
    case _:
        print("invalid volume")