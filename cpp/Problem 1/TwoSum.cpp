#include <iostream>
#include <vector>
#include <map>

using namespace std;

bool IsTwoSum(vector<int> arr, int k){
    map<int, int> dict;
    for(int i = 0; i < arr.size(); i++){
        dict[arr[i]] = i;
    }
    for(int i = 0; i < arr.size(); i++){
        if(dict.count(k-arr[i])){
            if(dict[k-arr[i]] != i) return true;
        }
    }
    return false;
}

int main() {
    vector<int> test = {10, 5, 12, 7};
    cout << IsTwoSum(test, 17);
}