# task 1
# import sys

# num = int(input("add a number :").strip())
# count = 0
# if num == 0 :
#   print(f"Number {num} is not larger than 0")
#   sys.exit(0)
# while num >= 1 :

#   num -= 1 
#   if num == 6 :
#     continue


#   print(num)
#   count += 1

# print(f"{count} Numbers Printed Successfully")

# task 2

# friends = ["Mohamed", "Shady", "ahmed", "eman", "Sherif"]
# ignored_count = 0
# i = 0

# while i < len(friends) :

#   if friends[i][0].islower():
#     ignored_count += 1
#   else :
#     print(friends[i])
#   i +=1
# print(f"Number of ignored names: {ignored_count}")

# task 3

# skills = ["HTML", "CSS", "JavaScript", "PHP", "Python"]

# for skill in skills :

#   print(skill)

# task 4

# friends_limit = 4
# my_friends = [] * 4


# while friends_limit > 0 :
#   print(f"{friends_limit} friends add capacity.")
#   add_friend = input("Add friend name: ").strip()
#   if add_friend.isupper() :
#     print("Friend name is not correct")
#     continue
#   elif add_friend.islower() :
#     add_friend = add_friend.capitalize()
#     my_friends.append(add_friend)
#     print(f"Friend {add_friend} Added => 1st Letter Become Capital")
#     friends_limit -= 1
#     continue
#   my_friends.append(add_friend)
#   print(f"Friend {add_friend} Added")
#   friends_limit -= 1


