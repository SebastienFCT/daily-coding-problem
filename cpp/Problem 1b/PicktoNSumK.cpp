#include <iostream>
#include <numeric>
#include <functional>
#include <vector>

using namespace std;


void Pick(vector<int> arr, int N, int& K, vector<int> cache, bool& status){
	if(status) return;
	if(arr.size() == N){
		cache.insert(cache.end(), arr.begin(), arr.end());
		if(!accumulate(cache.begin(), cache.end(), K, minus<int>())) status = true;
		return;
	}
	if(N == 0){
		if(!accumulate(cache.begin(), cache.end(), K, minus<int>())) status = true;
		return;
	}
	int tmp = arr.back();
	arr.pop_back();
	Pick(arr, N, K, cache, status);
	cache.push_back(tmp);
	if(!accumulate(cache.begin(), cache.end(), K, minus<int>())){
		 status = true;
		 return;
	}
	Pick(arr, N-1, K, cache, status);
	
}

bool PicktoNSumK(vector<int> arr,int N,int K){
	bool res = false;	
	vector<int> cache;
	Pick(arr, N, K, cache, res);
	return res;
}


int main(){
    vector<int> arr = {10, 6, 12, 890, 10, 10, 20, 5, 10, 90, 12, 22, 9, 10};
    int N = 5;
    int K = 50;
    cout << PicktoNSumK(arr, N, K);
}