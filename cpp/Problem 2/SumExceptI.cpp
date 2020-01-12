#include <iostream>
#include <functional>
#include <numeric>
#include <list>
#include <vector>

using namespace std;

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