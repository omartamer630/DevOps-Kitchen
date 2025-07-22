# myString = "#####I Love Python!########"
# # print(myString[-10]) #V
# # print(myString[-1:]) 
# # print(myString[6::-1])
# print(len(myString))
# print(myString.strip("#")) #
# print(myString.rstrip("#")) #
# print(myString.lstrip("#")) #

# a = "omar tamer abdelaal"
# print(a.title())
# print(a.capitalize())

# c,d,e = "1" , "11" , "111"
# print(c)
# print(d)
# print(e)

# print(c.zfill(3))
# print(d.zfill(3))
# print(e.zfill(3))

# g = "omar"

# print(g.upper())

# g = "OMAR"

# print(g.lower())

# a = "Omar Tamer Abdelaal"
# print(a.split())

# b = "Omar-Tamer-Abdelaal"
# print(b.split())

# c = "Omar-Tamer Abdelaal"
# print(c.split("-",2))

# d = "Omar-Tamer-Abdelaal-Mostafa-Mohamed-Salman"
# print(d.rsplit("-" , 1))

# center()

# e = "Omar"
# print(e.center(9)) #spaces
# print(e.center(10,"#")) #Hashes
# print(e.center(10,"$")) #spaces

# count()

# f = "I Love Python and PHP Because PHP is Easy"
# print(f.count("PHP"))
# print(f.count("PHP" , 0 , 25)) #Only One PHP Word

# swapcase()

# g = "I Love Python"
# h = "i love pYTHON"
# print(g.swapcase())
# print(h.swapcase())

# startswith()

# i = "I love Python"
# print(i.startswith("I")) # Yes
# print(i.startswith("N")) # No
# print(i.startswith("P",7,12)) #Yes

# endswith()

# z = "I love Python"
# print(z.endswith("I")) # No
# print(z.endswith("n")) # Yes
# print(z.endswith("e",2,6)) #Yes

#  index()

# a = "I Love Python"
# print(a.index("P"))
# print(a.index("P" , 0 , 10))
# # print(a.index("P", 0 ,5)) #Error

# find(SubString , Start , End)

# a = "I Love Python"
# print(a.find("P"))
# print(a.find("P" , 0 , 10))
# print(a.find("P", 0 ,5)) #-1

# # rjust(width,fill char) , ljust(width,fill char)

# a = "Omar"
# print(a.rjust(10))
# print(a.rjust(10, "$"))
# print(a.ljust(10))
# print(a.ljust(10, "$"))

# splitlines()

# e = """First Line
# Second Line
# Third Line"""
# print(e)
# print(e.splitlines())

# f = "First Line\nSecond Line\nThird Line"
# print(f.splitlines())

# expandtabs()

# f = "First Line\tSecond Line\tThird Line"
# print(f.expandtabs(20))

# one = "First Line Second Line Third Line"
# a = one.isnumeric()

# print(a)

# replace(old value, new value , count)

# a = "Hello One Two One Two One Two One Two"

# print(a.replace("One" , "1" , 3))

# join(iterable)

# myList = ["Osama" , "Mohamed" , "Elsayed"]

# print(", ".join(myList))

# Oldway formatting

# name = "Omar"
# age = 20
# rank = 10.25679
# # print("My Name is: "+ name + " and My Age is: "+ age) #Type Error

# print("My Name Is: %s and My Age is: %d and My Rank is: %f" % (name, age,rank)) # Working
# # %s => String
# # %d => Number
# # %f => Float

#Truncate String

# myLongString = "Hello Peoples of Omar School I Love You All"

# print("Message is %.9s" % myLongString)

# NewWay Formatting

# name = "Omar"
# age = 20
# rank = 10

# print("My Name Is: {:s} and My Age is: {:d} and My Rank is: {:0.2f}" .format(name,age,rank))
# # format_map(tuple || list)
# info = {'name':name,'age':age,'rank':rank}
# print("My Name Is: {name} and My Age is: {age} and My Rank is: {rank}".format_map(info)) # Working

# Format Money

# myMoney = 600261894216486
# print("My Money in Bank Is: {:d} " .format(myMoney))
# print("My Money in Bank Is: {:_d} " .format(myMoney))
# print("My Money in Bank Is: {:,d} " .format(myMoney))
# print("My Money in Bank Is: {:#d} " .format(myMoney)) #Wrong Format

# ReArrange Items by Index

# a, b, c= "One", "Two", "Three"

# print("Hello {} {} {}".format(a,b,c)) # Hello One Two Three
# print("Hello {1} {2} {0}".format(a,b,c))  # Hello Two Three One
# print("Hello {2} {1} {0}".format(a,b,c))  # Hello Three Two One

# x,y,z = 10,20,30
# print("Hello {} {} {}".format(x,y,z)) 
# print("Hello {2} {1} {0}".format(x,y,z)) 
# print("Hello {1:d} {0:f} {2:d}".format(x,y,z)) 

# # Format in Version 3.6+

# myName = "Omar"
# myAge = 21
# # print("My Name is : {myName} and My Age is : {myAge}") # Output : My Name is : {myName} and My Age is : {myAge}
# print(f"My Name is : {myName} and My Age is : {myAge}") # Output : My Name is : Omar and My Age is : 21 becauce of (f) before string

# complex number

# myComplexNumber = 5+6j
# print(type(myComplexNumber))
# print("Real Part is: {}".format(myComplexNumber.real))
# print("Real Part is: {}".format(myComplexNumber.imag))

#  [1] You Can Convert From Int To Float or Complex
#  [2] You Can Convert From Float To Int or Complex
#  [3] You Can not Convert complex to Anytype

# print(100)
# print(float(100))
# print(complex(100))

# print(10.50)
# print(int(10.50))
# print(complex(10.50))

# print(10+9j)
# print(int(10+9j)) #Error Cant convert complex

# Exponent   Numb ^ power  --> Numb ** Power(used in python)

# print(2 ** 5) #32
# print(2*2*2*2*2) #32

# Floor Division Numb1 // Numb2  (No Float Numbers)

# print(119//20) # 5
# print(9//2) # 3
