"""
Provides generators for common mathematical sequences
"""

import typing as _t


def fibgen() -> _t.Generator:
    """Generator of Fibonacci numbers"""
    prev = 0
    now = 1
    while True:
        yield now
        next = prev + now
        prev = now
        now = next


def primegen() -> _t.Generator:
    """Generator of prime numbers"""
    dictionary: _t.Dict[int, int] = {}
    value: int = 2
    while True:
        if value not in dictionary.values():
            dictionary[value] = value**2
            yield value
        else:
            for key, val in dictionary.items():
                if val == value:
                    dictionary[key] = val + key
        value += 1


class _DEPRECATED:
    """
    Generators that have been deprecated for various reasons.
    Some of them have been replaced by newer versions that are faster.
    """

    def primegen() -> _t.Generator:
        """Generator of prime numbers (SLOW)"""
        keys: _t.List[int] = []
        vals: _t.List[int] = []
        value: int = 2
        while True:
            if value not in vals:
                keys.append(value)
                vals.append(value)
                yield value
            else:
                for i in range(len(vals)):
                    if vals[i] == value:
                        vals[i] += keys[i]
            value += 1
