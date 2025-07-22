# task 1

# my_nums = [15, 81, 5, 17, 20, 21, 13]
# count = 1

# my_nums.sort(reverse= True)

# for num in my_nums:

#   if num % 5 == 0:
#     print(f"{count} => {num}")
#     count += 1

# print("All Numbers Printed")

# task 2

# count = range(1,21)

# for n in count:
#   n = str(n)
#   print(f"{(n).zfill(2)}")
# print("All Numbers Printed")

# task 3

# students = {
#   'Math': 'A',
#   "Science": 'B',
#   'Drawing': 'A',
#   'Sports': 'C'
# }

# points = 0
# points_sum = 0
# for student in students :
#   for i in students[student]:
#     if i == "A" :
#       points = 100
#     elif i == "B" :
#       points = 80
#     else :
#         points = 40
#   print(f"My Rank in {student} Is {i} And This Equal {points} Points")
#   points_sum += points
# print(f"Total Points Is {points_sum}")

# task 4

# students = {
#   "Ahmed": {
#     "Math": "A",
#     "Science": "D",
#     "Draw": "B",
#     "Sports": "C",
#     "Thinking": "A"
#   },
#   "Sayed": {
#     "Math": "B",
#     "Science": "B",
#     "Draw": "B",
#     "Sports": "D",
#     "Thinking": "A"
#   },
#   "Mahmoud": {
#     "Math": "D",
#     "Science": "A",
#     "Draw": "A",
#     "Sports": "B",
#     "Thinking": "B"
#   }
# }
# points = 0
# for student , grades in students.items():

#   print("-" * 30)
#   print(f"--Student Name => {student}")
#   print("-" * 30)
#   points_sum = 0
#   for subject , grade in grades.items():


#       if grade == "A" :

#         points = 100

#       elif grade == "B" :

#         points = 80

#       elif grade == "C" :

#         points = 40

#       else :

#         points = 20

#       print(f"-{subject} => {points}")
#       points_sum += points


#   print(f"Total Points Is {points_sum}")
