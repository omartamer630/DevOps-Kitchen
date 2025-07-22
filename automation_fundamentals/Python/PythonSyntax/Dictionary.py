#--------------------------
# --Dictionary--
#[1] Dict Items Are Enclosed in Curly braces
#[2] Dict Items Are Contains Key : Value
#[3] Dict Key Need To Be Immutable => (Number,String,Tuple) List Not Allowed
#[4] Dict Value Can Have Any Data Types
#[5] Dict Key Need To Be Unique 
#[6] Dict Is Not Ordered You Acccess Its Elment with Key
# -------------------------

#[1] Dict Items Are Enclosed in Curly braces

# user = {
#   "name" : "Omar",
#   "age" : 21,
#   "sex" : "Male",
#   "skills" : ["C\C++", "Python", "Linux"],
#   "rating" : 10,
# }
# print(user)
# print(user['sex'])
# print(user.get('sex'))
# print(user.keys())
# print(user.values())

# 2D Dictionary

# languages = {
#   "One" :{
#     "name" : "Html",
#     "Progress" : "80%"
#   },
#   "Two" :{
#     "name" : "Css",
#     "Progress" : "85%"
#   },
#     "Three" :{
#     "name" : "Js",
#     "Progress" : "90%"
#   }
# }

# print(languages["One"])
# print(languages["Two"])
# print(languages["Three"])
# print(languages["One"]["Progress"])
# print(len(languages))
# print(len(languages["One"]))

#--------------------------
# --Dict Methods--
# -------------------------

# clear() , update() , copy() , keys() , values()

# setdefault()
# user = {
#   "name" : "Omar"
# }
# print(user)
# print(user.setdefault("name", "Ahmed")) # didnt add because of name already in dictionary
# print(user)
# print(user.setdefault("age", 21)) # added new item
# print(user)

# popitem()

# member = {
#   "name" : "omar",
#   "skill" : "PS4"
# }
# print(member)
# member.update({"age" : 21})
# print(member)
# print(member.popitem()) # pop last item added after V3.7
# print(member)

# items()

# view = {
# "name" : "omar",
# "skill" : "Xbox"
# }
# allItems = view.items()
# print(view)
# view["age"] = 36
# print(allItems)

# fromkeys(keys, values)

# a = ("MyKeyOne", "MyKeyTwo", "MyKeyThree")
# b = ["X","Y"]

# print(dict.fromkeys(a, b))
