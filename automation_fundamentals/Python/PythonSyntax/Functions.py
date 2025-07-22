# def summation(a ,b) :
#   return a+b

# def helloworld() :

#   print("Hello, World!")

# helloworld()

# suma = summation(5,5)
# print(suma)

# def say_hello(a):
#   print(f"Hello, Mr. {a.capitalize()}!")


# say_hello("omar")

# peoples = []
# def say_hello(*peoples):

#   for name in peoples:

#     print(f"hello {name}!")

# say_hello("omar","Hello","Hello",'omar','Hello')

# print(peoples)

# def say_hello(name ="Unknown" ,age ="Unknown" ,country ="Unknown") :

#   print(f"Hello {name} {age} {country}!")


# say_hello(  "Egypt")

# tuple
# def show_skilss(*skills):
#   print(type(skills))
#   for skill in skills:

#     print(f"{skill.capitalize()}")

# show_skilss("PHP","Python","C")
# mySkills = {
#   'Python' : "80",
#     'C' : "70", 
#     'PHP' : "60"
# }
# pathing Dict in functions
# def show_skilss(**skills):
#   print(type(skills))
#   for skill , value in skills.items():

#     print(f"{skill.capitalize()} => {value.capitalize()}")

# show_skilss(**mySkills)

# mySkills = {
#   'Python' : "80",
#     'C' : "70", 
#     'PHP' : "60"
# }
# myTuple = ("Html", "css", "js")
# Training

# def show_skills(name,*skills, **skillsWithProgress):

#   print(f"Hello {name} \nSkills Without Progress")
#   for skill in skills:

#     print(f"-{skill.capitalize()}")
#   print("Skills With Progress Is: ")

#   for skill_key , skill_value in skillsWithProgress.items():
#     print(f"- {skill_key} => {skill_value}")
    
# show_skills("Omar",*myTuple,**mySkills)

# x = 1 # Global Scope

# def one():
  #global x #Making global scope of this variable when calling
#   x = 2 # Function scope
#   print(f"Print Variable From Function Scope {x}")

# def two():
  #global x

#   x = 4 # Function scope
#   print(f"Print Variable From Function Scope {x}")
# print(f"Print Variable From Global Scope {x}")

# one()
# two()

# x = "WWWooooorrrldd"

# #print(x[0])
# def remove_repeat(word):

#   if len(word) <= 1:

#     return word

#   if word[0] == word[1]: #Wooooorrrldd

#     return remove_repeat(word[1:])

#   return word[0] + remove_repeat(word[1:])

# print(remove_repeat(x))

# def say_hello(name,age): return f"Hello {name} , {age}"

# print(say_hello("Hello",21))

#lambda function

# hello = lambda name , age : f"Hello {name} , {age}"

# print(hello("Hello",21))

# print(say_hello("Hello",21))


# print(hello.__name__)

# print(say_hello.__name__)

# print(type(hello))


# Rule: Paramaters, *args, default parameters, **kwargs
# Scope Rules
# 1 - is it Local? Parameters are local scope
# 2 - is it in the Parent local?
# 3 - is it global?
# 4 - is it Built-in Function? 
x = "ahmed"
def outer():
  x
  x = "local"
  def inner():
    nonlocal x # x = parent x 
    x = "not local" # overriding the parent local
    print("inner : ",x)
  
  inner()
  print("outer : ",x)

outer()
