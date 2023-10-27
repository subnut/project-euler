import dmods.ranges : PrimeRange;
import std.range : popFrontExactly;
import std.stdio : writeln;

void main() {
	auto range = new PrimeRange!ulong;
	range.popFrontExactly(10_000);
	range.front.writeln;
}
