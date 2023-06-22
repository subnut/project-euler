#!/usr/bin/python3
from pymods.generators import primegen

def lowest_prime_factor(number: int) -> int:
    gen = primegen()
    while True:
        prime = next(gen)
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
