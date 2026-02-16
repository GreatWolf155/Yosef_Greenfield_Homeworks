"""
5. Reverse only uppercase words
list1 = ["HELLO", "World", "PYTHON", "code"]
Result:

["OLLEH", "World", "NOHTYP", "code"]
"""

result = []
list1 = ["HELLO", "World", "PYTHON", "code"]
for item in list1:
    if item.isupper():
        result.append(item[::-1])
    else:
        result.append(item)
print(result)