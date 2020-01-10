def IsTwoNumberSumToK(numbers, k):
    potential_solutions = set()
    for i in numbers:
        if k-i in potential_solutions:
            return(True)
        potential_solutions.add(i)
    return(False)


def IsTwoNumberSumToK(numbers, k):
    for i in range((len(numbers)-1)):
        if (k - numbers[i]) in numbers[(i+1):len(numbers)]:
            return(True)
    return(False)


assert not IsTwoNumberSumToK([], 17)
assert IsTwoNumberSumToK([10, 15, 3, 7], 17)
assert not IsTwoNumberSumToK([10, 15, 3, 4], 17)
assert not IsTwoNumberSumToK([8, 15, 3, 4], 16)
