#--------------------------
# --Set--
# -------------------------

#[1] Set items are Enclosed in Curly 

# mySetOne = {}

#[2] Set Are Not Ordered, to use Index To Access Item

# mySetOne = {"Omar","Ahmed",100}
# print(mySetOne) # Randomly

# print(mySetOne[0]) # Error

#[3] Set Set Indexing and Slicing Cant Be Done

# mySetOne = {"Omar","Ahmed",100}
# mySetOne[0] = 1 # Error
# print(mySetOne) 
# print(mySetOne{0:5}) # Error

#[4] Set Has Only Immutable Data types (Number, String, Tuples , Boolean) List and Dict are not

# mySetThree = {"Omar",100, 10.5 , True , (1,2) , [1,2]} #unhashable type: 'list
# print(mySetThree) 

#[5] Set Items Is Unique

# mySetFour = {1,2, "Omar","Ahmed",1 , 2}
# print(mySetFour) # Removing duplicate

#--------------------------
# --Set Methods--
# -------------------------

# clear() empty set

# a = {1,2,3}
# a.clear()
# print(a) 

# union(set1,set2) or ( | ) - Return a set containing the union of sets

# b = {1,2,3,}
# c = {4,5,6}
# d = {7,8,9}
# print(b | c | d)
# print(b.union(c,d)) # return a set containing the union of b ,c,d (((((Not Adding on the variable)))))
# print(b)

# add(value) - add one item

# e = {1,2,3,4,5,6}
# e.add(7)
# print(e)

# copy() - shallow copy : copy all of the set current items only the current item
# f = {1,2,3,4,5,6}
# h = f.copy()
# print(h)
# print(f)
# f.add(7)
# print(h)
# print(f)
# remove() - remove one item with alert if there're error

# g = {1,2,3,4,5,6}
# g.remove(1)
# # g.remove(7) # There was an error with number 7 because it was remove function , so there's error
# print(g)

# discard()

# g = {1,2,3,4,5,6}
# g.discard(1)
# g.discard(7) # There was no error with number 7 because it was discard function, so the error was skipped
# print(g)

# pop() - remove random item and pop it on the screen

# o = {"Omar","Ahmed",100}
# print(o)
# print(o.pop())
# print(o)

# update() -  the set with the union of this set and others

# j = {1,2,3,4}
# k = {1,"A","B",2}
# j.update(k)
# print(j)

# difference() - returning comparing two sets and gets the difference

# a = {1,2,3,4}
# b = {1,2 ,"omar"}
# print(a.difference(b))
# print(b.difference(a))
# print(a)

# difference_update() - comparing two sets and gets the difference and updates the original set

# a = {1,2,3,4}
# b = {1,2 ,"omar"}
# print(a)

# a.difference_update(b)
# print(a)

# intersection()

# a = {1,2,3,4 , "o"}
# b = {1,2 ,"omar"}

# print(a)
# print(a.intersection(b))
# print(a)

# intersection_update()

a = {1,2,3,4 , "o"}
b = {1,2 ,"o"}

# print(a)
# a.intersection_update(b)
# print(a)

# symmetric_difference() - returning  what is not in the both sets

# a = {1,2,3,4 , "o"}
# b = {1,2 ,"o"}

# print(a)
# print(a.symmetric_difference(b))
# print(a)

# symmetric_difference_update()

# a = {1,2,3,4 , "o"}
# b = {1,2 ,"o"}

# print(a)
# a.symmetric_difference_update(b)
# print(a)

# issuperset() 

# a = {1,2,3,4,5,6,7,8}
# b = {1,2,3,4}
# print(a.issuperset(b)) # every item in b is in a set
# print(b.issuperset(a)) # not every item in a is in b set

# issubset() 

# a = {1,2,3,4,5,6,7,8}
# b = {1,2,3,4}
# print(a.issubset(b)) # not every item in a is in b set
# print(b.issubset(a)) # every item in b is in a set

# isdisjoint() - no intersection

# g = {1,2,3,4}
# h = {1,2,3}
# i = {11,0,111,30}
# print(g.isdisjoint(h)) # false
# print(i.isdisjoint(g)) # true
