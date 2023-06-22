import std.stdio : writeln;

/*
 * 1999993 is the largest prime number below 2 million
 * It's the 148993rd prime number
 */

void main() {
	ulong[150_000] primes, vals;
	ulong current = 2;
	ulong sum = 0;
	bool notprime;
	for (int n = 0; current < 2_000_000; current++) {
		notprime = false;
		foreach (index; 0 .. n+1) {
			if (vals[index] == current) {
				notprime = true;
				vals[index] += primes[index];
			}
		}
		if (notprime)
			continue;

		primes[n] = current;
		vals[n] = current ^^ 2;
		n++;

		sum += current;
	}
	writeln(sum);
}
