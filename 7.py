#!/usr/bin/python3
from pymods.generators import primegen

gen = primegen()
for _ in range(10000):
    next(gen)

print(next(gen))
