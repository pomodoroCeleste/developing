// util_string.h

#ifndef UTIL_STRING_H
#define UTIL_STRING_H

#include <string>

// ...
inline std::string &quote(std::string &s){
	s = '\"' + s + '\"';
	return s;
}

// other functions using facilities provided by 'string'
// ...

#endif