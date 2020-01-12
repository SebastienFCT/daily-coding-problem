class Node:
    def __init__(self, val, left=None, right=None):
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


class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

class Codec:
    def serialize(self, root):
        """
        Encodes a tree to a single string.

        :type root: TreeNode
        :rtype: str
        """
        if not root: return ""
        q = collections.deque([root])
        res = []
        while q:
            node = q.popleft()
            if node:
                q.append(node.left)
                q.append(node.right)
            res.append(str(node.val) if node else '#')
        return ','.join(res)


    def deserialize(self, data):
        """
        Decodes your encoded data to tree.

        :type data: str
        :rtype: TreeNode
        """
        if not data: return None
        nodes = data.split(',')
        root = TreeNode(int(nodes[0]))
        q = collections.deque([root])
        index = 1
        while q:
            node = q.popleft()
            if nodes[index] is not '#':
                node.left = TreeNode(int(nodes[index]))
                q.append(node.left)
            index += 1

            if nodes[index] is not '#':
                node.right = TreeNode(int(nodes[index]))
                q.append(node.right)
            index += 1
        return root
