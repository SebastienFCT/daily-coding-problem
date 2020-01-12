## Description

This problem was asked by Uber.

Given an array of integers, return a new array such that each element at index `i` of the new array is the product of all the numbers in the original array except the one at `i`.

For example, if our input was [1, 2, 3, 4, 5], the expected output would be `[120, 60, 40, 30, 24]`. If our input was `[3, 2, 1]`, the expected output would be `[2, 3, 6]`.

Follow-up: what if you can't use division?

## Solution

```c++
#include <iostream>
#include <functional>
#include <numeric>
#include <list>
#include <vector>

using namespace std;

// list does not provide random access while deque does

vector<int> SumExceptI(vector<int> input){
    list<int> l;
    l.insert(l.begin(), input.begin(), input.end());
    vector<int> res;
    int tmp;
    for(int i = 0; i < input.size(); i++){
        tmp = l.front();
        l.pop_front();
        res.push_back(accumulate(l.begin(), l.end(), 1, multiplies<int>()));
        l.push_back(tmp);
    }
    return res;
}

int main(){
    vector<int> input = {1, 2, 3, 4, 5};
    vector<int> out = SumExceptI(input);
    for(auto &i : out){
        cout << i << " ";
    }
    cout << endl;
}
```
