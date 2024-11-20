// util_sentence.cpp

#include "util_sentence.h"

using std::string;

// ...
string &append_terminator(string &s, char c){
	
	s.push_back(c);
	
	return s;
	
}
