## Description

This problem was recently asked by Google.

Given a list of numbers and a number `k`, return whether any two numbers from the list add up to `k`.

For example, given `[10, 15, 3, 7]` and `k` of `17`, return true since `10 + 7` is `17`.

Bonus: Can you do this in one pass?

## Solution - one pass (hash)

```c++
#include <iostream>
#include <vector>
#include <map>

using namespace std;

bool IsTwoSum(vector<int> arr, int k){
    map<int, int> dict;
    for(auto &i : arr){
        dict[i] = 0;
    }
    for(auto &i : arr){
        if(dict.count(k-i)) return true;
    }
    return false;
}

int main() {
    vector<int> test = {10, 5, 12, 7};
    cout << IsTwoSum(test, 17);
}
```
