import std.stdio : writeln;
import dmods.generators : Primegen;

void main() {
	Primegen gen;
	ulong sum = 0;
	ulong next;
	while ((next = gen.next()) < 2_000_000)
		sum+= next;
	writeln(sum);
}
