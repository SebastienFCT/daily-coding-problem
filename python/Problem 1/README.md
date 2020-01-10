## Description

This problem was recently asked by Google.

Given a list of numbers and a number `k`, return whether any two numbers from the list add up to `k`.

For example, given `[10, 15, 3, 7]` and `k` of `17`, return true since `10 + 7` is `17`.

Bonus: Can you do this in one pass?

## Solution

```python
def IsTwoNumberSumToK(numbers, l):
  for i in numbers:
    for j in numbers:
      sum  = i + j
      if sum == k:
        return(True)
  return(False)
```

## Test
```python
numbers = [10, 15, 3, 7]
k = 17
IsTwoNumberSumToK(numbers, k)
