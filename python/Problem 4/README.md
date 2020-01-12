#### Description

This problem was asked by Stripe.

Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.

For example, the input `[3, 4, -1, 1]` should give `2`. The input `[1, 2, 0]` should give `3`.

You can modify the input array in-place.


### Solutions

```python

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

```
