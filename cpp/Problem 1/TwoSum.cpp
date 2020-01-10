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