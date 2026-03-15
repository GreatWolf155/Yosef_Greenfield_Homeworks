"""
Question 1 – Digital Business Card


Write a program that asks the user to enter the following information:

name
email
phone number
job title
After receiving the input:

Create a dictionary that stores this information
Print the dictionary
Print a formatted business card
Example input:

Enter name: Dana Levi
Enter email: dana@gmail.com
Enter phone: 0501234567
Enter job title: Data Analyst
Possible output:

{'name': 'Dana Levi', 'email': 'dana@gmail.com', 'phone': '0501234567', 'job_title': 'Data Analyst'}

--- Business Card ---
Name: Dana Levi
Email: dana@gmail.com
Phone: 0501234567
Job Title: Data Analyst
"""


class BusinessCard:
    def __init__(self, name = None, email = None, phone = None, job_title = None):
        self.name = name
        self.email = email
        self.phone = phone
        self.job_title = job_title
    def receive_business_card(self):
        self.name = input("Enter name: ")
        self.email = input("Enter email: ")
        self.phone = input("Enter phone: ")
        self.job_title = input("Enter job title: ")
    def create_dict(self):
        return {
            'name': self.name,
            'email': self.email,
            'phone': self.phone,
            'job_title': self.job_title
        }


p1 = BusinessCard()
p1.receive_business_card()
card = p1.create_dict()
print("\n--- Business Card ---")
for key, value in card.items():
    print(f"{key.replace('_', ' ').replace(' t', ' T').capitalize()}: {value}")

