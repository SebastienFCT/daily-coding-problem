## Description

This problem was asked by Google.

What will this code print out?

```
def make_functions():
    flist = []

    for i in [1, 2, 3]:
        def print_i():
            print(i)
        flist.append(print_i)

    return flist

functions = make_functions()
for f in functions:
    f()
```

How can we make it print out what we apparently want?

## Answer

This function will print out:

```
3
3
3
```

The first part

```
def make_functions():
    flist = []

    for i in [1, 2, 3]:
        def print_i():
            print(i)
        flist.append(print_i)

    return flist
```

Will return a list of functions as:

```
[print_i(), print_i(), print_i()]
```

By the time print_i() is called in the next part:

```
for f in functions:
    f()
```

It will return the value of print_i() which has been set to print(i=3) last.

<details><summary>Previous answer (wrong)</summary>
<p>

To return `1,2,3` which seems to be expected, the developer could store the value of i within the scope of the function:

```
def make_functions():
    flist = []

    for i in [1, 2, 3]:
        def print_i():
            value = i
            print(value)
        flist.append(print_i)

    return flist

functions = make_functions()
for f in functions:
    f()
```

Although I'm not familiar with python, there might be minor differences about how one copies variable by value rather than reference.

</p>
</details>

After looking for the answer:

The definition of `print_i` should take the value as a parameter and print this value.

```
def make_functions():
    flist = []

    for i in [1, 2, 3]:
        def print_i(value):
            print(value)
        flist.append((print_i, i))

    return flist

functions = make_functions()
for f, value in functions:
    f(value)
```