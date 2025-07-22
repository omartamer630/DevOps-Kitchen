#--------------------------
# --Tuple--
# -------------------------
#[1] Tuple items are Enclosed in Parentheses 
#[2] Tuple Can Remove the parentheses IF You Want
#[3] Tuple Are Ordered, to use Index To Access Item
#[4] Tuple Are Immutable => Add, Delete, Edit
#[5] Tuple Items Is Not Unique
#[6] Tuple Can Have Different Data Types
#[7] Operators Used in Strings and Lists Available in Tuples

# Tuple Syntax & Type test
# myTuple = ("Omar","Tamer")
# myTuple1 = "Omar" , "Tamer" , "Abdelaal"

# print(myTuple)
# print(myTuple1)
# print(type(myTuple1))

# Tuple  indexing

# print(myTuple1[1])
# print(myTuple1[0])
# print(myTuple1[2])

# Typle Assign Values

# myTuple[0] = "Ali"
# print(myTuple) # TypeError: 'tuple' object does not support item assignment , it's immutable

# Tuple Items

# myTuple2 = ("Omar","Tamer", 1 , 2 , 100.5 , True)

# Tuple with one element

# myTuple3 = ("Omar")
# myTuple4 = "Omar"
# print(type(myTuple3)) # String
# print(type(myTuple4))
# print(len(myTuple3)) # Because of string you got 4 characters
# print(len(myTuple4)) #Because of string you got 4 characters
# myTuple5 = ("Omar",)
# myTuple6 = "Omar",
# print(type(myTuple5)) # Tuple  because of comma
# print(type(myTuple6))
# print(len(myTuple5)) #Because of Tuple you got 1 String
# print(len(myTuple6)) #Because of Tuple you got 1 String

# Tuple Concatenation

# a = (1,2,3,4)
# b = (5,6)

# c = a+b
# d = a + ("A", "B", True) + b
# print(c)
# print((d))

# Tuple, List, String Repeat (*)

# myString = "Omar"
# myList = [1,2]
# myTuple = ("A" , "B")

# print(myString*6)
# print(myList*6)
# print(myTuple*6)

# Methods => count(Value)

# a = (1,3,1,5,5,3,1,3,7,8,9,3)
# print(a.count(0))

# Methods => index(Value)

# b =  (1,4,1,2,5,3,1,3,7,8,9,3)

# print("The Position of Index Is: {:d}".format(b.index(5)))
# print(f"The Position of Index Is: {b.index(5)}")

# Tuple Destruct

# a = ("A" , "B" , "C")

# x , y , z = a # اخدت قيمة كل واحد بترتيب 
# print(x)
# print(y)
# print(z) 

# a = ("A" , "B" , 4 , "C")

# x , y , _ , z = a # خد بالك ان في عنصر زيادة عشان كدا حطينا اندر سكور اكنه مكانه فاضي 
# print(x)
# print(y)
# print(z) 
