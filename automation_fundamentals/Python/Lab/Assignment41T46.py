# task 1

# num1 = int(input('Please enter Number 1 : ').strip())

# num2 = int(input('Please enter Number 2 : ').strip())

# operations = input('Please enter Operation [ + , - , % , / ]: ').strip()

# if operations == '+' :

#   print(num1 + num2)

# elif operations == '-' :

#   print(num1 - num2)

# elif operations == '%' :

#   print(num1 - num2)

# elif operations == '/' :

#   print(num1 - num2)

# else :

#   print("Invalid operation")

# task 2

# age = 17

# print("App Is Suitable For You" if age > 16 else "App Is Not Suitable For You")

# task 3 (Done Before in Calculate age)

# task 4

country = input("Input Your Country : ").strip().capitalize()

countries = ["Egypt", "Palestine", "Syria", "Yemen", "KSA", "USA", "Bahrain", "England"]

price = 100
discount = 30

if country in countries :

  print(f"Your Country Eligible For Discount And The Price After Discount Is ${discount}")

else :

  print(f"Your Country Not Eligible For Discount And The Price Is ${price}")
