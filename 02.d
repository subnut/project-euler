import std.stdio : writeln;
import dmods.generators : Fibgen;

void main() {
	Fibgen gen;
	ulong cur, sum;
	while ((cur = gen.next()) < 4_000_000)
		if (cur % 2 == 0)
			sum += cur;
	writeln(sum);
}
