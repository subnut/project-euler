import std.stdio : writeln;
import dmods.ranges : PrimeRange;

class MyRange : PrimeRange!int {
	override bool empty() {
		return current > 20;
	}
}

void main() {
	int[int] dict;
	foreach (factor; new MyRange) {
		dict[factor] = 1;
		auto max = &dict[factor];
		foreach (num; 1 .. 21) {
			int counter = 0;
			while (num /= factor)
				counter++;
			if (counter > *max)
				*max = counter;
		}
	}

	int result = 1;
	foreach (k,v; dict)
		result *= k ^^ v;

	writeln(result);
}
