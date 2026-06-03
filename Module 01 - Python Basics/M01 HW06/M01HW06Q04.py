"""
Question 4 – Post office delivery (f-string)
For a post office delivery, input the following details from the user:

last name
first name
country
city address
zipcode
Fixes & Requirements
The last name string must be uppercase
-- Use a while loop and isupper to validate the last name input
The first name string must be lowercase
-- Use a while loop and islower to validate the first name input
The country string length must be at most 3 letters (for example: US, IL)
-- Use a while loop and isalpha len to validate the country input
The zipcode must contain digits only and be at least 4 digits
-- Use a while loop and isdigit len to validate the zipcode input
Output Format
FOR: COHEN, danny
COUNTRY: IL
ADDRESS: Tel Aviv
ZIPCODE: 12345

Use print(f"...")

FOR: {last-name}, {first-name}
COUNTRY: {country}
ADDRESS: {city address}
ZIPCODE: {zipcode}
"""
while True:
    last_name = str(input("Enter your last name: "))
    if last_name.isupper():
        break
while True:
    first_name = str(input("Enter your first name: "))
    if first_name.islower():
        break
while True:
    country = str(input("Enter your country: "))
    if len(country) < 4 and country.isalpha():
        break
city_address = input("Enter your city address: ")
while True:
    zipcode = input("Enter your zipcode: ")
    if len(zipcode) > 3 and zipcode.isdigit():
        break

print(f"FOR: {last_name}, {first_name}")
print(f"COUNTRY: {country}")
print(f"ADDRESS: {city_address}")
print(f"ZIPCODE: {zipcode}")