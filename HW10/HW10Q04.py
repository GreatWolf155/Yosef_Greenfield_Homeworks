"""
4. Split sentences into words
sentences = [
    "Hello world",
    "Python is fun",
    "I love coding"
]
Result:

["Hello", "world", "Python", "is", "fun", "I", "love", "coding"]
"""
result = []
sentences = [
    "Hello world",
    "Python is fun",
    "I love coding"
]
for sentence in sentences:
    words = sentence.split()
    for word in words:
        result.append(word)
print(result)