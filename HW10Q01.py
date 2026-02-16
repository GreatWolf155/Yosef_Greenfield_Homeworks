"""
1. Separate even and odd numbers
list1 = [1, 2, 3, 4, 5, 6, 7]
Result:

list_even = [2, 4, 6]
list_odd = [1, 3, 5, 7]
"""

list_even = []
list_odd = []
list1 = [1, 2, 3, 4, 5, 6, 7]
for item in list1:
    if item % 2 == 0:
        list_even.append(item)
    else:
        list_odd.append(item)
print(list_even)
print(list_odd)