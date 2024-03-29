import dmods.ranges : PrimeRange;
import std.stdio : writeln;

alias T = ulong;
class MyRange : PrimeRange!T {
	enum bool empty = false;	// YOLO.
}

T lowestPrimeFactor(T num) {
	foreach(n; new MyRange)
		if (num % n == 0)
			return n;
}

T highestPrimeFactor(T num) {
	T factor = lowestPrimeFactor(num);
	while (factor < num) {
		num /= factor;
		factor = lowestPrimeFactor(num);
	}
	return factor;
}

void main() {
	T(600_851_475_143)
		.highestPrimeFactor
		.writeln;
}
