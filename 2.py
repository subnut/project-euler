#!/usr/bin/python3

from typing import Generator


def fibonacci_generator() -> Generator:
    """ Generator for Fibonacci numbers """
    _prev = 0
    _now = 1
    while True:
        _next = _prev + _now
        _prev = _now
        _now = _next
        yield _now


def main() -> int:
    """ We need to calculate sum of all EVEN numbers whose value don't exceed 4 million """
    sum: int = 0
    generator = fibonacci_generator()
    while True:
        new_number: int = next(generator)
        if new_number >= 4 * 10 ** 6:
            break
        if new_number % 2 == 0:
            sum += new_number
    return sum


if __name__ == "__main__":
    print(main())
