// 4.9
// write a program to print the size and contents of the vectors from 4.8.

#include <vector>
#include <iostream>
using std::vector; 
using std::string;

int main() {
    vector <int> v1;
    vector <int> v2(10);
    vector <int> v3(10, 42);
    vector <int> v4{10};
    vector <int> v5{10,42};
    vector <string> v6{10};
    vector <string> v7{10, "hi"};

    // Stampa gli elementi del vettore usando un ciclo for basato sull'intervallo
    for (int element : v2) {
        std::cout << element << " ";  // 'element' è l'elemento corrente del vettore
    }
    std::cout << std::endl;

    return 0;
}


// 4.10
// read a sequence of words from cin and store the values in a vector.
// after reading all the words, process the vector and change each word to uppercase.
// print the transformed elements, 8 words to a line.

#include <iostream>
#include <string>
#include <vector>
#include <cctype>
using std::vector;
using std::string;
using std::cin;
using std::cout;
using std::endl;

int main() {
    cout << "inserire una frase o parole (CTRL+D per terminare lo stream di input): " << endl;
    int counter = 0;
    string word;
    vector <string> input;
    while (cin >> word) {   // notare l'utilizzo del while al posto del for!
        input.push_back(word);
    }
    for (auto &str : input) {
        for (auto &ch : str) {
            ch = toupper(ch);
        }
        cout << str << " ";
        ++counter;
        if (counter % 8 == 0) {
            cout << endl;
            counter = 0;
        }
    }
    return 0;
}


// 4.11 
// list three ways to define a vector and give it 10 elements, each with value 42.

#include <vector>
using std::vector;

vector <int> v1 (10, 42);
vector <int> v2 {42, 42, 42, 42, 42, 42, 42, 42, 42, 42};
vector <int> v3 = v2;


// 4.12
// read a set of integers in a vector. 
// print the sum of each pair of adiacent elements.
// change your program so that it prints the sum of the firs and the last elements,
// followed by the sum of the second and the second-to-last, and so on.


#include <iostream>
#include <vector>
using std::vector;
using std::cin;
using std::cout;
using std::endl;

int main() {
    cout << "inserisci alcuni numeri (CTRL+D per terminare): " << endl;
    int n = 0;
    vector<int> v1;

    // leggi i numeri interi nel vettore
    while (cin >> n) {
        v1.push_back(n);
    }

    // stampa la somma di ciascuna coppia di elementi adiacenti
    cout << "somma di ciascuna coppia di elementi adiacenti:" << endl;
    for (size_t i = 0; i < v1.size() - 1; i += 2) {
        cout << v1[i] + v1[i + 1] << " ";
    }
    cout << endl;

    // stampa la somma del primo e dell'ultimo elemento, seguito dalla somma del secondo e del penultimo, ecc.
    cout << "somma del primo e dell'ultimo elemento, secondo e penultimo, ecc.:" << endl;
    size_t size = v1.size();
    for (size_t i = 0; i < size / 2; ++i) {
        cout << v1[i] + v1[size - 1 - i] << " ";
    }
    cout << endl;

    return 0;
}

