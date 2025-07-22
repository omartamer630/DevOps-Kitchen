picture1 = [
    [0, 0, 0, 1, 0, 0, 0],
    [0, 0, 1, 1, 1, 0, 0],
    [0, 1, 1, 1, 1, 1, 0],
    [1, 1, 1, 1, 1, 1, 1],
    [0, 1, 1, 1, 1, 1, 0],
    [0, 0, 1, 1, 1, 0, 0],
    [0, 0, 0, 1, 0, 0, 0]
]


def pixling(picture):
    for row in picture:  # taking the rows of the picture
        for pixel in row:  # taking every pixel in the row
            if (pixel):
                print("*", end='')
            elif pixel == 0:
                # end so i cancel the default newline in the print function
                print(" ", end='')
            else:
                print("Empty Picture")
        print("")  # Need a new line

pixling(picture1)
pixling(picture=picture1)
pixling(picture1)
pixling(picture=picture1)
pixling()
