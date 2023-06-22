import std.stdio : writeln;

void main() {
	ulong sqsum = 0;
	ulong sum = 0;

	foreach (n; 1 .. 101) {
		sum += n;
		sqsum += n * n;
	}

	ulong sumsq = sum * sum;
	ulong diff = sumsq - sqsum;
	writeln(diff);
}
