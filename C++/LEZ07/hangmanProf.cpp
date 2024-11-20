// to be completed...

#include <iostream>
#include <fstream>
#include <string>
#include <vector>

#include <cstdlib>
#include <cctype>
#include <ctime>

using std::cin;
using std::cout;
using std::cerr;
using std::endl;
using std::string;
using std::ifstream;
using std::vector;

int main(){

    std::srand(std::time(nullptr));

    char play;
    
    cout << "Will you play a word game? (y/n)" << endl;
    cin >> play; 

    if(play == 'y'){
        
        cout << "Please, tell me the name of the file ";
        cout << "listing the words to load." << endl;
    
        // file reading 
        string filename;
        cin >> filename;

        ifstream in;
        in.open(filename);
        if(!in){
            cout << "Sorry, cannot open file " << filename << endl;
            return EXIT_FAILURE;
        }
        
        vector<string> words;
        string s;
        while (in >> s) {
        
            int cnt = 0;
            for (auto &c : s) {
                c = tolower(c);
                //if(ispunct(c)) {
                //    ++cnt;
                //}
                if((c < 'a') || (c > 'z')) {
                    ++cnt;
                }                
            }
            if (cnt == 0) {
                words.push_back(s);        
            }
        }
 
        in.close();
        // file reading - end 
 
        while (play == 'y') {       
            auto index = std::rand() % words.size();
            string selected_s = words[index];
            //cout << selected_s << endl;
            
            unsigned guesses = 6; // number of guesses available

            cout << "Guess my secret word. It has " << selected_s.size() 
                 << " letters and you guess " << endl
                 << "one letter at a time. You get "
                 << guesses
                 << " wrong guesses." << endl;
            
            string bad;
            string mask(selected_s.size(),'-');
            
            cout << "Your word: " << mask << endl;
            
            while((guesses > 0) && (selected_s != mask)){
               
                cout << "Guess a letter: ";
                
                char letter;
                cin >> letter;
                            
                bool found = false; 
                for (decltype(selected_s.size()) i = 0; i != selected_s.size(); ++i) {
                    if (letter == selected_s[i]) {
                        mask[i] = letter;
                        found = true;    
                    }
                }
                
                if (found) {
                    cout << "Good guess!" << endl;
                } else {
                    cout << "Oh, bad guess!" << endl;   
                    --guesses;
                    //bad += string(1,letter);
                    bad += letter;
                }
                
                cout << "Your word: " << mask << endl;

                if (selected_s == mask) {
                    cout << "That's right!" << endl;
                }
                else {
                    if (bad.size() > 0){
                        cout << "Bad choices: " << bad << endl;
                    } 
                    cout << guesses << " bad guesses left" << endl;
                }        
            }

            cout << "Will you another? (y/n)" << endl;
            cin >> play;             
        
        }
         
    }

    cout << "Bye!" << endl;

    return EXIT_SUCCESS;
}
