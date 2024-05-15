Burrow-Wheeler Transform Algorithm
==================================

String
------
`BANANA`

Rotations
---------
```text
BANANA [0] <- String
ABANAN [1]
NABANA [2]
ANABAN [3]
NANABA [4]
ANANAB [5]
```

Rotations sorted
----------------
```text
ABANAN [1]
ANABAN [3]
ANANAB [5]
BANANA [0] <- String
NABANA [2]
NANABA [4]
```

Encoding
--------
```text
ABANA|N [1]
ANABA|N [3]
ANANA|B [5]
BANAN|A [0] <- String
NABAN|A [2]
NANAB|A [4]
```

Encoded
-------
```text
String: NNBAAA
Index: 3 ([0] <- String)
```

Decoding
--------
```text
A1 <- N1
A2 <- N2
A3 <- B1
B1 <- A1 <- [3]
N1 <- A2
N2 <- A3
```

Decoded
-------
```text
Idents: B1 A3 N2 A2 N1 A1
String: B  A  N  A  N  A
```
