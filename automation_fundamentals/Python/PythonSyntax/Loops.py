#------------------------------
# -- Loop --
# -----------------------------

# a = 0
# opretator = True
# while opretator :

#   print(a)

#   a +=1
#   if a == 6 :

#     opretator = False

# else :

#   print("Done!")

# a = 0

# myF = ["Om" , "Os", "OT", "Ah", "RI", "MI", "MA", "FA", "AL" , "YO"]

# while a < len(myF) :

#   print(f"#{str(a+1).zfill(2)} {myF[a]}")

#   a+=1

# import time

# index = 0
# storage = 1
# myFavBooks = [None] * storage
# condition = input("Want to add a book ? [Y/n] ").capitalize().strip()



# while condition in ["Yes","Y"]:

#   if storage > 0 :

#     print(f"You Have {storage} Storage for Books")

#     myFavBooks[index] = input("Please enter your book name :")

#     print("Adding a book to your favourite list..")
#     time.sleep(1.5)
#     print("Book has been added!")
#     storage-=1

#     condition = input("Want to add another book ? [Y/n] ").capitalize().strip()
#     index += 1
#   else :

#     print("No more storage left for books.")
#     condition = input("add more Storage ? [Y/n] ").capitalize().strip()
#     if condition in ["Yes","Y"] :
#       additional_storage = int(input("How many storage spaces do you want to add? ").strip())
#       myFavBooks.extend([None] * additional_storage)
#       storage += additional_storage
#       print("Adding more storage...")
#       time.sleep(1.5)
#       print(f"Storage has been increased by {additional_storage}!")
#       condition = "Y"
#     else :
#       condition = None

# else :

#   print("See You Soon ^^")

# Password 
# import time

# userLogin = input("Username : ").capitalize().strip()
# passLogin = input("Password : ").capitalize().strip()

# userSignup = input("Enter your username : ").capitalize().strip()
# passSignup = input("Enter your password : ").capitalize().strip()
# user_credentials = {
#   "ahmed" :"ahmed123"
# }

# def add_user(username, password):
#     user_credentials[username] = password

# def getPassword(userSignup):

#     pwd = user_credentials.get(userSignup)

#     return pwd

# print(getPassword(userSignup))


# print("Checking database...")
# time.sleep(2)
# if userSignup not in user_credentials:

#   add_user(userSignup, passSignup)
#   print(f"Your Account Has Been Created, Welcome Mr.{userSignup.capitalize()}")

# else :

#   print("Already Available credentials")

# if userLogin in user_credentials :

#   print("Logging in...")

# else :

#   print("Username Not found!")



# import time

# user_credentials = {
#     "ahmed": "ahmed123"
# }

# def add_user(username, password):
#     user_credentials[username] = password

# def get_password(username):
#     return user_credentials.get(username)

# status = True
# while status :
#   accountStatus = input("Account Login/Signup ? ").capitalize().strip()

#   if accountStatus == "Login" :

#     user_login = input("Username: ").strip()
#     pass_login = input("Password: ").strip()

#     if user_login in user_credentials and pass_login == get_password(user_login):
#       print("Logging in...")
#       time.sleep(2)
      
      

#     else:

#       print("Invalid username or password. Please try again.")

    
#   else :

#     userSignup = input("Enter your username : ").strip()
#     passSignup = input("Enter your password : ").strip()

#     if userSignup not in user_credentials :

#       print("Creating new account...")
#       add_user(userSignup,passSignup)
#       time.sleep(2)
#       print("Account has been created")
#       continue
#     else :
#       print("Username already exists. Please choose a different one.")

# my_list = [1,2,3,4,5,6,7,8,9,10]
# summation = 0
# for value in my_list:
#   summation += value
# print(summation)


# for value in range(1,101, 5):
#   print(value)

# enumrate it gets the index of the item
dicta = {
  'name': "omar",
  'age': 21,
  'skills': "devops" 
}

for i,char in enumerate(dicta): # i getting the index , char getting the value
  print(i, char)
