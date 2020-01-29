#include <iostream>
#include <utility>
using namespace std;
// this part inputs the wrapper<decltype(&FUNC), &FUNC>
// typename here for GCC compiler
template<typename Fn, Fn fn, typename... Args>
typename result_of<Fn(Args...)>::type wrapper(Args... args){
	return fn(forward<Args>(args)...);
}

int foo(int a, int b) { return a + b; }

#define WRAPIT(FUNC) wrapper<decltype(&FUNC), &FUNC>

int main(){
	int (*func_a)(int, int);
	func_a = WRAPIT(foo);
	cout << func_a(1, 4) << endl;
}