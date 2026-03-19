"""
Exercise 2 – Average grade
grades = {"Tom":80, "Anna":95, "John":70, "Sara":85}

-> 82.5
Write a function that calculates the average grade of all students

def get_average_grade(grades: dict) -> float:
    '''

    :param grades: {<name>: <grade>}
    :return: average grade of all students
    '''
    pass
"""

def get_average_grade(grades: dict) -> float:
    """
    :param grades: {<name>: <grade>}
    :return: average grade of all students
    """
    sum_grades = 0
    for name in grades:
        sum_grades += grades[name]
    return sum_grades / len(grades)

grades = {"Tom":80, "Anna":95, "John":70, "Sara":85}
print(get_average_grade(grades))