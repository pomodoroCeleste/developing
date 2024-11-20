#include "util_math.h"

int fact(int val) {
	int ret = 1;
	while (val > 1)
		ret *= val--;
	return ret;
}

size_t fib_count_calls(bool reset){
	static size_t counter = 0;
	if (reset) {
		counter = 0;
		return counter;
	} else {
		return ++counter;
	}
}

unsigned long fib(unsigned long val) {
	
	fib_count_calls();
	
	if (val <= 1) {
		return val;
	}
	else {
		return fib(val-1) + fib(val-2);
	}
	
}