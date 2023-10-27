import std.stdio : writeln;
import std.algorithm : sum;
import dmods.ranges : PrimeRange;

class MyRange : PrimeRange!ulong {
	override bool empty() {
		return current >= 2_000_000;
	}
}

void main() {
	(new MyRange)
		.sum
		.writeln;
}
