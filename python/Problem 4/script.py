def The1stMissingPosInteger(array):
    array1 = [i for i in array if i > 0]
    start = 1
    for i in range(len(array1)):
        if start in array1:
            start += 1
        else:
            return(start)
    return(start)

assert The1stMissingPosInteger([3, 4, -1, 1]) == 2
assert The1stMissingPosInteger([1, 2, 0]) == 3
