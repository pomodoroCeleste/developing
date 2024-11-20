#include <iostream>
#include <string>

using std::cout;using std::cerr;
using std::cin;
using std::endl;

using std::string;

int main(){
	string s;
	if (cin >> s) {
		cout << "*" << s << endl;
		while (cin >> s) {
			cout << "*" << s << endl;
		}
	} else {
		cerr << "No input!" << endl;
	}
	
	return 0;
}