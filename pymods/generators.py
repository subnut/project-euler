"""
Provides generators for common mathematical sequences
"""

import typing as t

def primegen() -> t.Generator:
    """Generator of prime numbers"""
    dictionary: t.Dict[int, int] = {}
    value: int = 2
    while True:
        if value not in dictionary.values():
            dictionary[value] = value ** 2
            yield value
        else:
            for (key, val) in dictionary.items():
                if val == value:
                    dictionary[key] = val + key
        value += 1


def fibgen() -> t.Generator:
    """Generator of Fibonacci numbers"""
    prev = 0
    now = 1
    while True:
        next = prev + now
        prev = now
        now = next
        yield now
