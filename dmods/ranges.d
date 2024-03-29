module dmods.ranges;
import std.bigint : BigInt;
import std.conv : to;

class FibRangeInf : FibRange!BigInt	{ enum bool empty = false; }
class PrimeRangeInf : PrimeRange!BigInt	{ enum bool empty = false; }

class FibRange(T) {
	alias _T = to!T;

	T front() { return now; }
	bool empty() { return prev > now; }
	void popFront() {
		prev = now; now = next;
		next = prev + now;
	}

protected:
	T prev = 0;
	T now  = 1;
	T next = 1;
}

class PrimeRange(T) {
	alias _T = to!T;

	T front() { return current; }
	bool empty() { return true; }	// TODO: find max we can compute using T
	void popFront() {
		for (current++; current in dict; current++) {
			foreach (inc; dict[current])
				dict[current + inc] ~= inc;
			dict.remove(current);
		}
		dict[current * current] ~= current;
	}

	protected T[][T] dict;
	protected T current = 2;
	this() { dict[to!T(4)] ~= to!T(2); }
}
