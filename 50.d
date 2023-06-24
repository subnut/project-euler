import std.stdio : writeln;
import std.parallelism : taskPool, task;
import dmods.generators : Primegen;


void main() {
	Primegen gen;
	ulong[] primes;
	writeln("Generating primes...");
	{
		auto next = gen.next;
		do primes ~= next;
		while ((next = gen.next()) < 1_000_000);
	}
	writeln("Primes generated.");

	writeln("Looking for combinations...");
	auto tpool = taskPool();
	ulong curmax = 183;
	ulong curstart;
	foreach (i; 0 .. primes.length)
		tpool.put(task!find(primes, i, &curmax, &curstart));
	tpool.finish(true);
	writeln("Found all combinations.");


	writeln();
	writeln(curmax, " terms");
	ulong max;
	foreach (n; primes[curstart .. curstart + curmax])
		max += n;
	writeln(max, " = ", primes[curstart .. curstart + curmax]);
}

// skipping is fine if the sequence doesn't start with 2
// This works because odd + odd = even, which isn't prime anyways.
// So we skip odd+odd and go directly to odd+odd+odd
void find(const ulong[] primes, ulong start, ulong *curmax, ulong *curstart) {
	ulong sum;
	ulong saved_max = *curmax;
	foreach (n; primes[start .. saved_max + start])
		sum += n;
	for (auto j = start + saved_max; j < primes.length; j++) {
		sum += primes[j];
		foreach (n; primes[j .. $]) {
			if (n > sum) break;
			if (n == sum) {
				auto len = j - start + 1;
				if (len > *curmax) {
					synchronized {
						if (len > *curmax) {
							*curmax = len;
							*curstart = start;
						}
					}
					writeln(sum, "\t", len, "\t", primes[start]);
					break;
				}
			}
		}
	}
}
