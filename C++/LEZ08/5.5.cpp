//5.5
// rewrite the grade clustering program from (T_04 - dealing with the elements in a vector) using iterators instead of subscripts.


//--------------------------initial version--------------------------
#include <iostream>
#include <vector>
#include <string>
#include <cctype>
using std::vector;
using std::string;
using std::cin;
using std::cout;
using std::endl;

int main() {
    vector<unsigned> scores(11, 0);
    decltype(scores.size()) grade;

    //grade has a type vector<unsigned>::size_type

    while (cin >> grade) {
        if (grade <= 100) {
            auto ind = grade / 10;
            scores[ind] = scores[ind] + 1;
            //++scores[grade/10];
        }
    }
    for (auto s : scores) {
        cout << s << " ";
    }
    cout << endl;
}
//--------------------------end--------------------------


//--------------------------rewrite--------------------------
#include <iostream>
#include <vector>
#include <string>
#include <cctype>
using std::vector;
using std::string;
using std::cin;
using std::cout;
using std::endl;


