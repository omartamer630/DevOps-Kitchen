# task 1

# def calculate(numb_one, numb_two , operation = "a"):
#   accepted_operation = ['a' , 'm' , 's' , 'add' , 'subtract' , 'multiply']
#   operation = operation[0].lower()
#   if operation not in accepted_operation:

#     return "Wrong operation"

#   if operation == 'a':
#     return numb_one + numb_two
#   if operation == 'm':
#     return numb_one * numb_two
#   if operation == 's':
#     return numb_one - numb_two

# print(calculate(10, 20)) # 30
# print(calculate(10, 20, "AdD")) # 30
# print(calculate(10, 20, "a")) # 30
# print(calculate(10, 20, "A")) # 30

# print(calculate(10, 20, "S")) # -10
# print(calculate(10, 20, "subTRACT")) # -10

# print(calculate(10, 20, "Multiply")) # 200
# print(calculate(10, 20, "m")) # 200

# task 2

# def addition(*nums):

#   summ = 0

#   for num in nums:

#     if num == 10 :

#       continue

#     if num == 5:

#       summ -= num
#       continue

#     summ += num

#   return summ

# Tests
# print(addition(10, 20, 30, 10, 15)) # 65
# print(addition(10, 20, 30, 10, 15, 5, 100)) # 160

# task 3

# def person_information(name ,*skills):

#   if not skills :

#     return print("Hello Ahmed You Have No Skills To Show") 

#   print(f"Hello {name} You Skills Is")
#   for skill in skills:
#     print(f"- {skill}")

# person_information("omar","html")

# task 4

# def say_hello(name = "Unknown" , age = "Unknown" , country = "Unknown"):

#   return (f"Hello {name} Your Age Is {age} And You Live In {country}")

# print(say_hello("Osama", 38, "Egypt"))

# print(say_hello())
