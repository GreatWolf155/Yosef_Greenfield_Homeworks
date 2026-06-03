"""
Question 3 – Restaurant recommendation (booleans)
Input from the user

The time it took the restaurant to bring the meal (in minutes)
The price of the meal (in shekels)
Create boolean variables

is_quick_service – True if the time is less than 15 minutes, otherwise False
is_expensive – True if the price is more than 100 shekels, otherwise False
Now check

If is_quick_service and not is_expensive print recommended
Otherwise print not recommended
"""

meal_time = int(input("How long did it take for the meal to arrive? "))
meal_price = int(input("How much did the meal cost? "))
is_quick_service = False
is_expensive = False
if meal_time < 15:
    is_quick_service = True
if meal_price > 100:
    is_expensive = True
if is_quick_service and is_expensive:
    print("recommended")
else:
    print("not recommended")
