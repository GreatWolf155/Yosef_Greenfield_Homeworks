"""
Exercise 1 – Group words by length
["apple","banana","kiwi","grape","melon","pear"]

-> {
    5: ["apple","grape","melon"],
    6: ["banana"],
    4: ["kiwi","pear"]
}
Write a function that groups words by number of letters

The key should be the length of the word, and the value should be a list of all words with that length

def group_words_by_length(words: list) -> dict:
    '''

    :param words: list of words
    :return: dict { <length>: [list of words with that length] }
    '''
    pass
"""

def group_words_by_length(words: list) -> dict:
    """

    :param words: list of words
    :return: dict { <length>: [list of words with that length] }
    """
    len_dict = {}
    for word in words:
        if len(word) in len_dict:
            len_dict[len(word)].append(word)
        else:
            len_dict[len(word)] = [word]
    return len_dict

word_list = ["apple","banana","kiwi","grape","melon","pear"]
print(group_words_by_length(word_list))