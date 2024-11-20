// main.cpp

#include <iostream>
#include "util_math.h"
#include "util_time.h"

using std::cout;
using std::endl;

int main() {
	int j = fact(5);
	cout << "5! is " << j << endl;
	cout << "Time limit (in seconds): " << TIME_LIMIT << endl;
	return 0;
}