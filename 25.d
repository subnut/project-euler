import dmods.ranges : FibRangeInf;
import std.stdio : writeln;

class MyRange : FibRangeInf {
	override bool empty() {
		return now >= _T(10) ^^ 999;
	}
}

void main() {
	long sum = 0;
	foreach(_; new MyRange)
		sum++;

	writeln(sum + 1);
	// +1 cause sum has counted the no. of terms that have less than 1000 digits
	// therefore, the index of the 1000-digit fibonacci number is sum+1
}
