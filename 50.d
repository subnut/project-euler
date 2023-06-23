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
		while ((next = gen.next()) < 100_000);
	}
	writeln("Primes generated.");

	writeln("Looking for combinations...");
	auto tpool = taskPool();
	ulong[][][ulong] dict;
	tpool.put(task!find(primes, &dict, 0));
	foreach (i; 0 .. primes.length)
		tpool.put(task!find_skipped(primes, &dict, i));
	tpool.finish(true);
	writeln("Found all combinations.");

	ulong max;
	ulong max_num;
	ulong[] max_comb;
	writeln("Finding longest combination...");
	foreach (num, combos; dict)
		foreach (combo; combos)
			if (combo.length > max) {
				max = combo.length;
				max_num = num;
				max_comb = combo;
			}

	writeln(max_num, " = ", max_comb);
}

void find(ulong[] primes, ulong[][][ulong] *dict, ulong i) {
	ulong sum = primes[i];
	foreach (j; i+1 .. primes.length) {
		sum += primes[j];
		foreach (n; primes[j .. $]) {
			if (n > sum)
				break;
			if (n == sum) {
				ulong[] arr;
				foreach (k; primes[i .. j+1]) arr ~= k;
				synchronized { (*dict)[n] ~= arr; }
				break;
			}
		}
	}
}

// We're gonna be fine if the part we're searching doesn't contain 2
// This works because odd + odd = even, which isn't prime anyways.
// So we skip odd+odd and go directly to odd+odd+odd
void find_skipped(ulong[] primes, ulong[][][ulong] *dict, ulong i) {
	ulong sum = primes[i];
	for (auto j = i+1; j < primes.length; j++) {
		sum += primes[j++];	// Here's the skipping
		sum += primes[j];
		foreach (n; primes[j .. $]) {
			if (n > sum)
				break;
			if (n == sum) {
				ulong[] arr;
				foreach (k; primes[i .. j+1]) arr ~= k;
				synchronized { (*dict)[n] ~= arr; }
				break;
			}
		}
	}
}
