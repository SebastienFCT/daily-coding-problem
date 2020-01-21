## Problem 10

#### Description

This problem was asked by Apple.

Implement a job scheduler which takes in a function `f` and an integer `n`, and calls `f` after `n` milliseconds.

### Solutions

```python

import time as time
def Scheduler(f, n):
  time.sleep(n/1000)
  return(f)

```
