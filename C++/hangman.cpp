#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <cstdlib>
#include <cctype>
#include <ctime>

using std::cerr;
using std::cin;
using std::cout;
using std::endl;
using std::string;
using std::ifstream;
using std::vector;

int main() {
    std:: srand(std::time(NULL)); //o nullptr
    char play;
    cout << "will you play a word game? y/n" << endl;
    cin >> play;
    if (play == 'y') {
        cout << "please, tell me the neame of the file";
        cout << "listing the words to load." << endl;
        string filename;
        cin >> filename;
       // ifstream in(filename);
        ifstream in;
        in.open(filename);
        if (!in) {
            cerr << "sorry, cannot open file " << filename << endl;
            return EXIT_FAILURE;
        }
        vector <string> words;
        string s;
        while (in >> s) {
            int cnt = 0;
            for (auto &c : s) {
                c = tolower(c);
               // if(ispunct(c)) {
               //    ++cnt;
               // }
                if((c < 'a')|| (c > 'z')) {
                    ++cnt;
                }
            }
            if (cnt == 0) {
                words.push_back(s);
            }  
        }
       // for (auto w : words) {
       //     cout << w << endl;
       // }
        in.close();
        while (play =='y') {
            auto indx = std::rand()%words.size();
            string selected_s = words[indx];
            cout << selected_s << endl;
            unsigned guesses = 6;
            cout << "guess my secret word. it has " << selected_s.size() 
                 << " letters and you guess one letter at a time. you get " << guesses 
                 << " wrong guesses." << endl;
            string bad;
            string mask(selected_s.size(), '-');
            while ((guesses > 0) && (selected_s != mask)) {
                cout << "guess a letter: ";
                char letter;
                cin >> letter;
                bool found = false;
                for (decltype(selected_s.size()) i= 0; i != selected_s.size(); i++) {
                    if (letter == selected_s[i]) {
                    mask[i] = letter;
                    found = true;
                }
            }
            if (found) {
                cout << "good guess!" << endl;
            } else {
                cout << "oh, bad guess!" << endl;
                --guesses;
                bad += letter;
            }
            cout << "your word: " << mask << endl;
            if (selected_s != mask) {
                cout << "that's right!" << endl;
            } else {
                if (bad.size() > 0) {
                cout << "bad choices: " << bad << endl;
                }
            cout << guesses << " bad guesses left" << endl;
            }
        }
        cout << "will you play another game? y/n" << endl;
        cin >> play;
        }
    }
    cout << "bye!" << endl;
    return EXIT_SUCCESS;
}