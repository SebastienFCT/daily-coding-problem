from numpy import prod
def ProdOfArrayExceptOne(array):
    res = []
    for index in range(len(array)):
        res.append(prod(np.delete(array, index)))
    return(res)


from numpy import prod
def ProdOfArrayExceptOne(array):
    res = []
    for index in range(len(array)):
        res.append(prod(array[:index] + array[(index + 1):]))
    return(res)

from functools import reduce
def ProdOfArrayExceptOne(array):
    res = []
    for index in range(len(array)):
        res.append(reduce(lambda x, y: x*y, array[:index] + array[(index + 1):]))
    return(res)


from functools import reduce
def ProdOfArrayExceptOne(array):
    total = reduce(lambda x, y: x*y, array)
    res = []
    for item in array:
        res.append(total/item)
    return(res)

assert ProdOfArrayExceptOne([1, 2, 3, 4, 5]) == [120, 60, 40, 30, 24]
assert ProdOfArrayExceptOne([3, 2, 1]) == [2, 3, 6]
