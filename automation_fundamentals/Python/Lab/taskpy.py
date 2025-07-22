#! /usr/bin/python3
import os

m = True
contact_number = 1
database_file = 'database.txt'

def add_contact():
    global contact_number
    with open(database_file, 'a') as db:
        db.write(f"Contact-{contact_number}\n")
        fname = input("Enter your First name: ")
        db.write(f"First Name: {fname}\n")
        lname = input("Enter your Last name: ")
        db.write(f"Last Name: {lname}\n")
        email = input("Enter your Email: ")
        db.write(f"Email: {email}\n")
        phnumber = input("Enter your Phone number: ")
        db.write(f"Phone Number: {phnumber}\n")
        db.write("------------------------\n")
    
    contact_number += 1

def view_contacts():
    if os.path.exists(database_file):
        print("------------------------")
        print("All Contacts")
        print("------------------------")
        with open(database_file, 'r') as db:
            print(db.read())
    else:
        print("No contacts found.")

def search_contact():
    search_name = input("Enter the name of the contact you want to search for: ")
    if os.path.exists(database_file):
        with open(database_file, 'r') as db:
            found = False
            for line in db:
                if search_name.lower() in line.lower():
                    print(line.strip())
                    found = True
            if not found:
                print("No match found.")
    else:
        print("No contacts found.")

def delete_all_contacts():
    if os.path.exists(database_file):
        os.remove(database_file)
        print("------------------------")
        print("All contacts deleted.")
        print("------------------------")
    else:
        print("No contacts to delete.")

def delete_one_contact():
    if os.path.exists(database_file):
        delete_number = input("Enter the contact number you want to delete (e.g., 1 for Contact-1): ")
        with open(database_file, 'r') as db:
            lines = db.readlines()
        with open(database_file, 'w') as db:
            skip = False
            for line in lines:
                if f"Contact-{delete_number}" in line:
                    skip = True
                if "------------------------" in line and skip:
                    skip = False
                    continue
                if not skip:
                    db.write(line)
        print(f"Contact-{delete_number} deleted if it existed.")
    else:
        print("No contacts found.")

while m:
    choice = input("press i to add new contact\npress v to view all contacts\npress s to search for a record\npress e to delete all contacts\npress d to delete one contact\npress q to exit\n")

    if choice == "i":
        add_contact()
    elif choice == "v":
        view_contacts()
    elif choice == "s":
        search_contact()
    elif choice == "e":
        delete_all_contacts()
    elif choice == "d":
        delete_one_contact()
    elif choice == "q":
        m = False
    else:
        print("Invalid option. Please try again.")

    if choice != "q":
        reptear = input("If you want to return to the main menu press m or q for exit: ")
        if reptear != "m":
            m = False

