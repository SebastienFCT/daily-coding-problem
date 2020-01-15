#### Description

This problem was asked by Facebook.

Given the mapping `a = 1, b = 2, ... z = 26`, and an encoded message, count the number of ways it can be decoded.

For example, the message `111` would give `3`, since it could be decoded as `aaa`, `ka`, and `ak`.

You can assume that the messages are decodable. For example, `001` is not allowed.


### Solutions

```python
def NumOfDecodeMessage(message):
    if message.startswith('0'):
        return 0
    elif len(message)<=1:
        return 1
    result = NumOfDecodeMessage(message[1:])
    if int(message[:2]) <= 26:
        result += NumOfDecodeMessage(message[2:])
    return result

assert NumOfDecodeMessage("111") == 3
assert NumOfDecodeMessage("001") == 0

```
