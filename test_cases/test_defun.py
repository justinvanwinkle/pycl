def test(x):
    return x + 1


def test2(x, y):
    z = x + y

    return z


def test3(x):
    test(1)
    test2(5, 7)
    return test(1) + 55

assert(test(5) == 6)
assert(test2(1, 2) == 3)
assert(test3(1) == 57)
