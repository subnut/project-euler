import std.math : pow;
import std.parallelism : task, taskPool;
import std.stdio : writefln;

void main() {
	auto tpool = taskPool();
	foreach(a; 1..333) // 332 + 333 + 335 = 1000
		tpool.put(task!worker(a));
}

void worker(int a) {
	int sum = 1000 - a;
	int upto = ((int a) => a%2 == 0 ? a/2 : (a+1)/2)(sum);
	foreach(b; a+1..upto) {
		int c = sum - b;
		if (pow(a, 2) + pow(b, 2) == pow(c, 2)) {
			writefln("%d² + %d² = %d²", a, b, c);
			writefln("%d * %d * %d = %d", a, b, c, a*b*c);
		}
	}
}
