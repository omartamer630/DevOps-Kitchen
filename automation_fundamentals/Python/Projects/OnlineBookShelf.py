#Online Book
import time
user_credentials = {}

def add_user(username, password):
    user_credentials[username] = password

def get_password(username):
    return user_credentials.get(username)

status = True
while status:
    accountStatus = input("Account Login/Signup? ").capitalize().strip()

    if accountStatus == "Login":
        user_login = input("Username: ").strip()
        pass_login = input("Password: ").strip()

        if user_login not in user_credentials and pass_login != get_password(user_login):
            tries = input("Invalid username or password. Wanna try again ? [Y/n].").capitalize().strip()
            status = tries in ["Yes", "Y"]

        print("Logging in...")
        time.sleep(1.5)
        
        index = 0
        storage = 1
        bookShelf = [None] * storage
        condition = input("Want to add a book? [Y/n] ").capitalize().strip()

        while condition in ["Yes", "Y"]:
            if storage > 0:
                print(f"You Have {storage} Storage Left for Books")
                bookShelf[index] = input("Please enter your book name: ")
                print("Adding a book to your BookShelf...")
                time.sleep(1.5)
                print("Book has been added!")
                storage -= 1
                condition = input("Want to add another book [Y] or Logout [N]? [Y/n] ").capitalize().strip()
                index += 1
            else:
                print("No more storage left for books.")
                condition = input("Add more storage? [Y/n] ").capitalize().strip()

                if condition not in ["Yes", "Y"]:
                  condition = None
                  print("See You Soon ^^")
                  continue

                additional_storage = int(input("How many storage spaces do you want to add? ").strip())
                bookShelf.extend([None] * additional_storage)
                storage += additional_storage
                print("Adding more storage...")
                time.sleep(1.5)
                print(f"Storage has been increased by {additional_storage}!")
                condition = "Y"

    else:
        userSignup = input("Enter your username: ").strip()
        passSignup = input("Enter your password: ").strip()

        if userSignup  in user_credentials:
              print("Username already exists. Please choose a different one.")
              continue
    
        print("Creating new account...")
        add_user(userSignup, passSignup)
        time.sleep(1.5)
        print("Account has been created")
