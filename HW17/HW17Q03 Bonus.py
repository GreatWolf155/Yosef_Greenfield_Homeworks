"""
Question 3 – Bonus - Merge Two Dictionaries
Create a function that receives two dictionaries.

Each dictionary has:

key → string
value → string
The function should create and return a third dictionary that combines both dictionaries.

Rules:

If a key appears in only one dictionary, add it normally
If the same key appears in both dictionaries, choose the value with the longer string
If both strings have the same length, keep the value from the first dictionary
Example:

dict1 = {
    "name": "Dan",
    "city": "Tel Aviv",
    "job": "Dev"
}

dict2 = {
    "name": "Daniel",
    "city": "TA",
    "country": "Israel"
}
Possible result:

{
    "name": "Daniel",
    "city": "Tel Aviv",
    "job": "Dev",
    "country": "Israel"
}
"""

def dictmerge(dict1, dict2):
    result_dict = {}
    for key, value in dict1.items():
        if key in dict2:
            result_dict[key] = max(dict1[key], dict2[key], key=len)
            # will return the first value, dict1[key] in case of a tie
        else:
            result_dict[key] = dict1[key]
    for key, value in dict2.items():
        if key not in result_dict:
            result_dict[key] = value
    return result_dict

dict1 = {
    "name": "Dan",
    "city": "Tel Aviv",
    "job": "Dev"
}

dict2 = {
    "name": "Daniel",
    "city": "TA",
    "country": "Israel"
}

new_dict = dictmerge(dict1, dict2)
for key, value in new_dict.items():
    print(f"{key.capitalize()}: {value}")