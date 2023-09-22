import std.algorithm : sort, sum;
import std.file : readText;
import std.stdio : writeln;
import std.string : split, strip;

/*
 * NOTE: It is assumed that the given file has been saved
 *       as "names.txt" in the same directory as this file
 */

void main() {
	string data = readText("names.txt");
	string[] names = data.split(',');
	foreach (i, name; names)
		names[i] = name.strip("\"");

	sort(names);
	long[] sums = [0];
	foreach (i, name; names) {
		long sum = 0;
		foreach (c; name)
			sum += c - 'A' + 1;
		sums ~= sum;
	}
	foreach (i, sum; sums)
		sums[i] *= i;

	writeln(sum(sums));
}
