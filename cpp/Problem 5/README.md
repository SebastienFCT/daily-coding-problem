### Description

This problem was asked by Jane Street.

`cons(a, b)` constructs a pair, and `car(pair)` and `cdr(pair)` returns the first and last element of that pair. For example, `car(cons(3, 4))` returns `3`, and `cdr(cons(3, 4))` returns `4`.

Given this implementation of cons:

```
def cons(a, b):
    def pair(f):
        return f(a, b)
    return pair
```

Implement `car` and `cdr`.

### Solution

```python

def cons(a, b):
    def pair(f):
        return f(a, b)
    return pair


def car(pair):
    first = pair.__closure__[0].cell_contents
    return(first)

def cdr(pair):
    second = pair.__closure__[1].cell_contents
    return(second)

assert car(cons(3, 4)) == 3
assert cdr(cons(3, 4)) == 4


```cpp
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
```