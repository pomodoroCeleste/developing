#include <iostream>
#include <string>

#include "util_sentence.h"

using std::cout;
using std::endl;

using std::string;

int main() {
	string s1 = "Ciao", s2 = s1;
	cout << append_terminator(s1) << endl;
	cout << append_terminator(s2,'!') << endl;
	return 0;
}