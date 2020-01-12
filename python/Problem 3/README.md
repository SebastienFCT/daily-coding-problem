## Description

This problem was asked by Google.

Given the root to a binary tree, implement `serialize(root)`, which serializes the tree into a string, and `deserialize(s)`, which deserializes the string back into the tree.

For example, given the following Node class

```
class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
```

The following test should pass:

```
node = Node('root', Node('left', Node('left.left')), Node('right'))
assert deserialize(serialize(node)).left.left.val == 'left.left'
```

## Solution

```python
class Node:
    def __init__(self, val, left = None, right = None):
        self.val = val
        self.left = left
        self.right = right

class Stringifier():
    def __init__(self):
        self.current = 0

    def serialize(self, root, strTree = []):
        if root is None:
            return
        strTree.append('{')
        strTree.append('\"' + root.val + '\"')
        self.serialize(root.left, strTree)
        self.serialize(root.right, strTree)
        strTree.append('}')
        return "".join(strTree)

    def _deserialize(self, strTree):
        left = None
        right = None
        if strTree[self.current] == '{' :
            self.current += 1
            val = ""
            if strTree[self.current] == '\"':
                self.current += 1
            while strTree[self.current] != '\"':
                val += strTree[self.current]
                self.current += 1
            self.current += 1
            if strTree[self.current] == '{':
                left = self._deserialize(strTree)
            if strTree[self.current] == '{':
                right = self._deserialize(strTree)
            if strTree[self.current] == '}':
                self.current += 1
                return Node(val, left, right)

    def deserialize(self, strTree):
        self.current = 0
        return self._deserialize(strTree)


if __name__ == "__main__":
    stringifier = Stringifier()
    node = Node('root', Node('left', Node('left.left')), Node('right'))
    assert stringifier.deserialize(stringifier.serialize(node)).left.left.val == 'left.left'
```
