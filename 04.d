import std.algorithm.sorting : sort;
import std.stdio : writeln;
import std.conv : to;

bool ispalindrome(string s) {
	foreach (i; 0 .. s.length / 2)
		if (s[i] != s[$ - i - 1])
			return false;
	return true;
}

void main() {
	int[] list;
	foreach (i; 100..999)
		foreach (j; 100..999)
			list ~= i * j;
	sort(list);
	foreach_reverse (n; list)
		if (ispalindrome(to!string(n)))
			return writeln(n);
}
