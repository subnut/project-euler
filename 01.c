#include <stdio.h>

int main(void) {
	typedef unsigned long t;
	t sum = 0;
	for (t n = 3; n < 1000; n += 3) sum += n;
	for (t n = 5; n < 1000; n += 5) sum += n;
	for (t n = 15; n < 1000; n += 15) sum -= n;
	printf("%lu\n", sum);
}
