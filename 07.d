import std.stdio : writeln;
import dmods.generators : Primegen;

void main() {
	auto pgen = Primegen();
	foreach(_; 0..10_000)
		pgen.next();
	pgen.next().writeln;
}
