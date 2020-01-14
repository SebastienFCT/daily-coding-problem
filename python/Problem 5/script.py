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
