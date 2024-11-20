// main.cpp

#include <iostream>

using std::cerr;
using std::cout;
using std::endl;

const size_t threshold = 16;

void print(const int ia[], size_t size) {
#ifndef NDEBUG
	if (size > threshold) {
		cerr << "Error: " << __FILE__
			 // __func__ is a local static const char[] defined by the compiler
			 // __func__ holds the function's name
			 << " : in function " << __func__
			 << " at line " << __LINE__ << endl
			 << "       Compiled on " << __DATE__
			 << " at " << __TIME__ << endl
			 << "       'size' read was \"" << size
			 << "\": 'size' too large" << endl;
		return;
	}
#endif
	
	for(size_t i = 0; i<size; ++i){
		cout << ia[i] << " ";
	}
	cout << endl;
	
}

int main() {
	int ia[32] = {};
	print(ia, 32);
	return 0;
}