def highest_even(li):

  highest_value = None
  for value in li:
    if value % 2 == 0:
      if highest_value is None or value > highest_value:
        highest_value = value
  return highest_value

lis = [1,2,3,4,5,6,7,8,9,10,11,13,12]
total = highest_even(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 12)
print(total)
