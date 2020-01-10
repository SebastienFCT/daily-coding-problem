## Description

This problem was recently asked by Google.

Given a list of numbers and a number `k`, return whether any two numbers from the list add up to `k`.

For example, given `[10, 15, 3, 7]` and `k` of `17`, return true since `10 + 7` is `17`.

Bonus: Can you do this in one pass?

## Solution

```python
def IsTwoNumberSumToK(numbers, k):
    for i in range((len(numbers)-1)):
        if (k - numbers[i]) in numbers[(i+1):len(numbers)]:
            return(True)
    return(False)

assert not IsTwoNumberSumToK([], 17)
assert IsTwoNumberSumToK([10, 15, 3, 7], 17)
assert not IsTwoNumberSumToK([10, 15, 3, 4], 17)
assert not IsTwoNumberSumToK([8, 15, 3, 4], 16)
```
