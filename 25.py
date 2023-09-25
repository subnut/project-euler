from pymods.generators import fibgen

gen = fibgen()

i = 1
n = next(gen)
while n < 10**999:
    i += 1
    n = next(gen)

print(i)
