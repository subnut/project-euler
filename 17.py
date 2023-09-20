def main():
    count = 0
    for n in range(1, 1001):
        count += len(towords(n))
    print(count)


def towords(num):
    l1 = [
        "",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourteen",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen",
    ]
    l2 = [
        "",
        "",
        "twenty",
        "thirty",
        "forty",
        "fifty",
        "sixty",
        "seventy",
        "eighty",
        "ninety",
    ]
    if num < 20:
        return l1[num]
    if num < 100:
        c1, c2 = str(num)
        return l2[int(c1)] + l1[int(c2)]
    if num < 1000:
        c1, c2, c3 = str(num)
        out = l1[int(c1)] + "hundred"
        if c2 == "0" and c3 == "0":
            return out
        out += "and"
        out += towords(int(c2 + c3))
        return out
    return "onethousand"


main()
