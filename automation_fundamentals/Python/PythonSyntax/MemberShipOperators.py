#------------------------------
# -- MemberShip Operators --
# in
# not in
# -----------------------------

# string
# name = "Omar"

# print("a" in name)

# List

friends = ["Ahmed","Omar","Mahmoud"]
print("Omar" in friends) 

print("Oar" not in friends) 

# Using In and Not In With Condtion

countriesOne = ["Egypt","KSA","Kuwait"]
countriesOneDiscount = 50

countriesTwo = ["Palestine","Russia","Yamen"]
countriesTwoDiscount = 90

myCountry = input("Please enter your country : ").strip().capitalize()

if myCountry in countriesOne :

  print(f"Hello You Have A Discount Equal => ${countriesOneDiscount}")
elif myCountry in countriesTwo :

  print(f"Hello You Have A Discount Equal => ${countriesTwoDiscount}")

else :

  print("Country Not Supported")
