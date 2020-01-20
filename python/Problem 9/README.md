## Problem 9

#### Description

This problem was asked by Airbnb.

Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be `0` or negative.

For example, `[2, 4, 6, 2, 5]` should return `13`, since we pick `2`, `6`, and `5`. `[5, 1, 1, 5]` should return `10`, since we pick `5` and `5`.

Follow-up: Can you do this in O(N) time and constant space?

### Solutions

```python
def MaxOfNonAdjacent(array):
  sum_incl = 0
  sum_excl = 0

  for i in array:
    new_sum_excl = max(sum_excl, sum_incl)
    sum_incl = sum_excl + i
    sum_excl = new_sum_excl

  return(max(sum_excl, sum_incl))

assert MaxOfNonAdjacent([5, 5, 10, 100, 10, 5]) == 110
assert MaxOfNonAdjacent([2, 4, 6, 2, 5]) == 13
assert MaxOfNonAdjacent([5, 1, 1, 5]) == 10
```
