import std.stdio : writeln;
import dmods.generators : Primegen;

void main() {
	Primegen gen;
	ulong sum = 0;
	for (ulong next; next < 2_000_000; next = gen.next())
		sum += next;
	writeln(sum);
}
