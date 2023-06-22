import std.stdio : writeln;
import dmods.generators : Primegen;

void main() {
	Primegen gen;
	int[ulong] dict;
	ulong next;

	while ((next = gen.next()) < 20)
		dict[next] = 1;

	foreach (n; 0 .. 21) {
		int i;
		auto a = n;
		foreach (k; dict.byKey) {
			i = 0;
			a = n;
			while (a /= k)
				i++;
			if (i > dict[k])
				dict[k] = i;
		}
	}

	ulong prod = 1;
	foreach (k; dict.byKey)
		prod *= k ^^ dict[k];

	writeln(prod);
}
