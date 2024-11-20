#include <iostream>
#include <vector>
#include <string>
#include <cstring>

using std::cout; 
using std::cin; 
using std::cerr; 
using std::endl;
using std::string; 
using std::vector; 
using std::begin; 
using std::end;

int main () { 
	char str1[] = {'H','e','l','l','o','!','\0'};
	string s1 = str1; cout << s1 << endl; 
	string s2 = s1 + " " + str1;  cout << s2 << endl; 
	const char *str2 = s2.c_str(); 
	cout << endl << "str2: " << str2 << endl; 
	//s2 = str2 + " " + "Bye!"; 
	s2 = "Bye!"; 
	//s2 = "This is a very long sentence :-) Bye!"; 
	cout << endl << "s2: " << s2 << endl; 
	cout << endl << "str2: " << str2 << endl << endl; 
	int arr[] = {10, 20, 30, 40, 50}; 
	vector<int> v1(begin(arr), end(arr)); 
	for (auto n : v1) { cout << n << " "; } cout << endl; 
	vector<int> v2(arr+1, arr+3); 
	for (auto n : v2) { cout << n << " "; } cout << endl; 
	return 0; 
} 
