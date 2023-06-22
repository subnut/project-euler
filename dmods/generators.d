module dmods.generators;

/*
   All generators have -
   - `max` - immutable value containing the maximum value that can be generated
   - `next()` - function to generate and return the next value of the generator
   - `stopped` - boolean that indicates whether the generator has finished
 */

struct Fibgen {
	immutable ulong max = 12_200_160_415_121_876_738;
	private ulong _prev = 0;
	private ulong _now = 1;
	private ulong _next;
	bool stopped = false;
	ulong next() {
		if (stopped)
			return 0;

		_next = _prev + _now;
		_prev = _now;
		_now = _next;
		if (_now < _prev) // overflow
			stopped = true;

		return _prev; // otherwise it skips the first digit
	}
}

/*
 * 4294967291 is the largest prime number below 2^^32 (square root of 2^^64)
 * It's the 203,280,211st prime number
 */

struct Primegen {
	immutable ulong max = 4_294_967_291;
	private ulong[] primes, vals;
	private ulong cur = 1;
	bool stopped = false;
	ulong next() {
		// reduces speed.
		// if (stopped)
		// 	return 0;

		bool notprime;
		while (cur < max) {
			cur++;
			notprime = false;
			foreach (index; 0 .. primes.length) {
				if (vals[index] == cur) {
					notprime = true;
					vals[index] += primes[index];
				}
			}
			if (notprime)
				continue;

			primes ~= cur;
			vals ~= cur ^^ 2;

			return cur;
		}

		// will overflow.
		stopped = true;
		return 0;
	}
}

