#include <iostream>
#include <string>
#include <vector>

using std::string;
using std::vector;

using std::cin;
using std::cout;
using std::endl;

int main() { 
	string s;
	cin >> s; 
	vector<string> text; string word; 
	while (cin >> word) { 
		text.push_back(word); 
	} 
	auto beg = text.cbegin(), end = text.cend(); 
	//auto mid = text.cbegin() + (end - beg)/2; 
	auto mid = beg + (end - beg)/2; 
	
//cout << endl << (end - beg) << "\t" << (end - beg)/2 << endl;
//cout << "<" << *mid << ">" << endl;
	
	while (mid != end && *mid != s) { 
		if (s < *mid) end = mid; 
		else beg = mid + 1; 
		
//cout << endl << (end - beg) << "\t" << (end - beg)/2 << endl;
		mid = beg + (end - beg)/2; 
//cout << "<" << *mid << ">" << endl;
	} 
	cout << "Result: " << (mid != end) << endl; 
	return 0; 
}
