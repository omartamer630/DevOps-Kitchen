some_list = ['a', 'b', 'c', 'd', 'b', 'e', 'f', 'h', 'c', 'n', 'o', 'c']


def check_duplicate(some_list):
    duplicated_items = []
    for item in some_list:
        if some_list.count(item) > 1:
            if item not in duplicated_items:
                duplicated_items.append(item)
    print(f"These are Duplicated Items: {duplicated_items}")


check_duplicate(some_list)
