"""
3. Copy strings that start with a capital letter
list1 = ["Hello", "world", "Python", "java", "Code"]
Result:

["Hello", "Python", "Code"]
"""

result = []
list1 = ["Hello", "world", "Python", "java", "Code"]
for item in list1:
    if item == item.capitalize():
        result.append(item)
print(result)