// write a program to print the size and contents of the vectors from 4.8.

#include <vector>
#include <iostream>
using std::vector; 
using std::string;

int main () {
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



