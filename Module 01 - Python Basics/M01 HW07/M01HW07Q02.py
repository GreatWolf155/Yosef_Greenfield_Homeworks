"""
2. Copy only ALL-uppercase strings
list1 = ["HELLO", "World", "PYTHON", "code", "TEST"]
Result:

["HELLO", "PYTHON", "TEST"]
"""
result = []
list1 = ["HELLO", "World", "PYTHON", "code", "TEST"]
for item in list1:
    if item.isupper():
        result.append(item)
print(result)