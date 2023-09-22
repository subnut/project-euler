import std.algorithm : canFind;
import std.parallelism : taskPool, task, TaskPool;
import std.stdio : writeln;

void main() {
	auto tpool = taskPool();
	int[] amnums;

	foreach (i; 2..10_001)
		tpool.put(task!worker(i, &amnums));

	tpool.finish(true);

	long sum = 0;
	foreach (i; amnums)
		sum += i;

	writeln();
	writeln("Sum:\t", sum);
}

void worker(int n, int[] *amnums) {
	if (canFind(*amnums, n))
		return;

	int dn = d(n);
	if (dn == n)
		return;

	int ddn = d(dn);
	if (ddn == n) {
		writeln(n, "\t", dn);
		synchronized {
			if (!canFind(*amnums, n)) *amnums ~= n;
			if (!canFind(*amnums, dn)) *amnums ~= dn;
		}
	}
}

int d(int n) {
	int []divisors = [1];
	foreach (i; 2..n)
		if (n % i == 0)
			divisors ~= i;
	int sum;
	foreach (i; divisors)
		sum += i;

	return sum;
}
