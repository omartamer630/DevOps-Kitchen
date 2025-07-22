# -------------------------------------
# -- Practical Your Age Full Details --
# -------------------------------------

# Collect age data

age = int(input("PLease Write Your Age : ").strip())
thisYear = int(input("PLease Write Current Year : ").strip())
unit = input("PLease Choose Time Unit: Birthdate , Months , weeks, days : ").strip().lower()
dTime = {
  "birthdate" : (thisYear-age),
  "months" : (age*12),
  "weeks" : (age*4),
  "days" : (age*365),
}

if unit == "birthdate" :
  
    print("You Choosed The Unit Birth Date")
    print(f"You Born in {dTime[unit]}")

elif unit == "months":
      
      print("You Choosed The Unit Months")
      print(f"You Lived For {dTime[unit]} Months")

elif unit == "weeks":
      
      print("You Choosed The Unit Weeks")
      print(f"You Lived For {dTime[unit]} Weeks")

elif unit == "days":
      
      print("You Choosed The Unit Days")
      print(f"You Lived For {dTime[unit]} Days")

else : 
    print("This Time Unit Not Supported")
