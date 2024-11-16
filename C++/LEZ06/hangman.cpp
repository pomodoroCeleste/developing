#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <ctime>
#include <cstdlib>

using std::cerr;
using std::cin;
using std::cout;
using std::endl;
using std::string;
using std::ifstream;
using std::vector;

int main() {
    std::srand(std::time(NULL)); // o nullptr
    char play;
    cout << "Will you play a word game? y/n" << endl;
    cin >> play;
    if (play == 'y') {
        cout << "Please, tell me the name of the file listing the words to load." << endl;
        string filename;
        cin >> filename;
        ifstream in(filename);
        if (!in) {
            cerr << "Sorry, cannot open file " << filename << endl;
            return EXIT_FAILURE;
        }
        vector<string> words;
        string s;
        while (in >> s) {
            int cnt = 0;
            for (auto &c : s) {
                if ((c < 'a') || (c > 'z')) {
                    ++cnt;
                }
            }
            if (cnt == 0) {
                words.push_back(s);
            }
        }
        in.close();

        if (words.empty()) {
            cerr << "No words to guess in the file." << endl;
            return EXIT_FAILURE;
        }

        while (play == 'y') {
            auto indx = std::rand() % words.size();
            string target = words[indx];
            int length = target.length();
            string attempt(length, '-');
            string badchars;
            int guesses = 6;

            cout << "Guess my secret word. It has " << length << " letters, and you can guess one letter at a time." << endl;
            cout << "You have " << guesses << " incorrect guesses left." << endl;

            while (guesses > 0 && attempt != target) {
                cout << "Your word: " << attempt << endl;
                cout << "Guess a letter: ";
                char letter;
                cin >> letter;

                if (badchars.find(letter) != string::npos || attempt.find(letter) != string::npos) {
                    cout << "You already guessed that. Try again." << endl;
                    continue;
                }

                size_t loc = target.find(letter);
                if (loc == string::npos) {
                    cout << "Oh, bad guess!" << endl;
                    --guesses;
                    badchars += letter;
                } else {
                    cout << "Good guess!" << endl;
                    for (size_t i = 0; i < length; ++i) {
                        if (target[i] == letter) {
                            attempt[i] = letter;
                        }
                    }
                }

                cout << "You have " << guesses << " incorrect guesses left." << endl;
            }

            if (attempt == target) {
                cout << "That's right! The word is " << target << "." << endl;
            } else {
                cout << "Sorry, the word was " << target << "." << endl;
            }

            cout << "Will you play another game? y/n" << endl;
            cin >> play;
        }
    }

    return 0;
}