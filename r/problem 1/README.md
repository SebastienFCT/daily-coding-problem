## Description

This problem was recently asked by Google.

Given a list of numbers and a number `k`, return whether any two numbers from the list add up to `k`.

For example, given `[10, 15, 3, 7]` and `k` of `17`, return true since `10 + 7` is `17`.

Bonus: Can you do this in one pass?

## Solution

```r
Q1.fn<-function(num,k){
  if(length(num)<2) return(FALSE)
  for(i in 1:(length(num)-1)){
    for(j in (i+1):length(num)){
      if(num[i]+num[j] == k) return(TRUE)
    }
  }
  return(FALSE)
}
```
