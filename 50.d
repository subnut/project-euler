import std.stdio : writeln;
import std.parallelism : taskPool, task;
import dmods.generators : Primegen;


void main() {
	Primegen gen;
	ulong[] primes;
	writeln("Generating primes...");
	{
		auto next = gen.next;	// We're skipping 2
		while ((next = gen.next()) < 1_000_000)
			primes ~= next;
	}
	writeln("Primes generated.");

	writeln("Looking for combinations...");
	auto tpool = taskPool();
	ulong[][][ulong] dict;
	foreach (i; 0 .. primes.length)
		tpool.put(task!find(primes, &dict, i));
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
