#include <iostream>
#include "util_math.h"

using std::cin;
using std::cout;
using std::endl;

int main(int argc, char *argv[]) {
	
	unsigned long n;
	
	cout << "Insert a positive integer number: "; // less than 50 :-)
	cin >> n;
	
	cout << "i\tfib(i)\t#calls" << endl;
	
	for (unsigned long i = 0; i <= n; ++i) {
		
		unsigned long val = fib(i);
		size_t num_calls = fib_count_calls() - 1;
		
		cout << i << "\t" << val << "\t" << num_calls << endl;	

		bool reset = true;
		fib_count_calls(reset);
		//fib_count_calls(true);
		
	}
	
	
	return 0;
}
