# -------------------------------------
# -- Practical MemberShip Control --
# -------------------------------------

# List Contains Admins

admins = ["Omar" , "Ali" , "Mohamed"]

# Login

name = input("PLease Enter Your Name ").strip().capitalize()

if name in admins:

  print(f"Welcome Back {name} ^^")
  
  edit = input("Want to Edit Your Profile ? ").strip().capitalize()

  if edit == ("Yes" or "Y") :

      print("Entering Profile editor...")
      option = input("Delete Profile or Update name ? ").strip().capitalize()

      if option == "Delete" or option == "D" :

        admins.remove(name)
        print("Profile has been deleted")
        
      elif option == "Update" or option == "U" :

        newName = input("Enter New Name :").strip().capitalize()
        admins[admins.index(name)] = newName
        print("Name has been updated successfully")

      else :

        print("No Such an Option!")

  else :

    print("Come back to Profile editor")

else :
    
  status = input("You Are Not Admin , Send Request to Admin ? [Y/n] ").capitalize().strip()
  
  if status == "Yes" or status == "Y" :

    print("You Have Been Added")

    admins.append(name)
    print(admins)
  else :
    
    print("Come Back Later!")
