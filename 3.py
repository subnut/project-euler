#!/usr/bin/python3
from typing import List, Generator, Dict


def prime_generator() -> Generator:
    """ Uses Sieve of Eratosthenes """
    dictionary: Dict[int, int] = {}
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


def lowest_prime_factor(number: int) -> int:
    generator = prime_generator()
    while True:
        prime = next(generator)
        if not number % prime:
            break
    return prime


def max_prime_factor(number: int) -> int:
    factor = 1
    while True:
        if factor < number:
            number = int(number / factor)
            factor = lowest_prime_factor(number)
        else:
            break
    return factor


if __name__ == "__main__":
    print(max_prime_factor(600851475143))
