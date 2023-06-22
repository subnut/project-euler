#!/usr/bin/python3
from pymods.generators import fibgen

def main() -> int:
    """ We need to calculate sum of all EVEN numbers whose value don't exceed 4 million """
    sum: int = 0
    generator = fibgen()
    while True:
        new_number: int = next(generator)
        if new_number >= 4 * 10 ** 6:
            break
        if new_number % 2 == 0:
            sum += new_number
    return sum


if __name__ == "__main__":
    print(main())
