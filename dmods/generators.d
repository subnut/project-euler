module dmods.generators;

/*
 * 4294967291 is the largest prime number below 2^^32 (square root of 2^^64)
 * It's the 203,280,211st prime number
 */

struct Primegen {
	bool stopped = false;
	ulong max = 4_294_967_291;
	ulong cur = 1;
	ulong[] primes, vals;
	ulong next() {
		// This seems to slow it down a bit..
		// TODO: test if it actually does slow down.
		// if (this.stopped)
		// 	return 0;

		bool notprime;
		while (this.cur < this.max) {
			this.cur++;
			notprime = false;
			foreach (index; 0 .. this.primes.length) {
				if (this.vals[index] == this.cur) {
					notprime = true;
					this.vals[index] += this.primes[index];
				}
			}
			if (notprime)
				continue;

			this.primes ~= this.cur;
			this.vals ~= this.cur ^^ 2;

			return this.cur;
		}

		// will overflow.
		this.stopped = true;
		return 0;
	}
}

