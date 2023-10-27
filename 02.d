import std.stdio : writeln;
import dmods.ranges : FibRange;
import std.algorithm : sum, filter;

class MyFibRange : FibRange!ulong {
	override bool empty() {
		/* Limit upto fibonacci numbers less than 4 million */
		return now >= 4_000_000;
	}
}

void main() {
	auto range = new MyFibRange;
	writeln(range
		.filter!(x => x % 2 == 0)	// even only
		.sum);
}
