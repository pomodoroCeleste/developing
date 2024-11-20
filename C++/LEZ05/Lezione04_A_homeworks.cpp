// ES. 1
// scrivi un programma che legga due stringhe e riporti quando sono uguali. 
// se non lo sono, riporta quale tra le 2 stringhe è la più lunga lessicograficamnete 
// (usando operatori relazionali).
// poi riporta anche quando è più lunga (lunghezza normale).

#include <iostream>
#include <string> // Libreria per le stringhe

int main() {
    std::string str1, str2;

    // Leggi due stringhe dall'utente
    std::cout << "Enter the first string: ";
    std::cin >> str1;
    std::cout << "Enter the second string: ";
    std::cin >> str2;

    // Parte 1: Confronta le stringhe
    if (str1 == str2) {
        std::cout << "The strings are equal." << std::endl;
    } else {
        if (str1 > str2) {
            std::cout << "The first string is larger (lexicographically)." << std::endl;
        } else {
            std::cout << "The second string is larger (lexicographically)." << std::endl;
        }
    }

    // Parte 2: Confronta le lunghezze delle stringhe
    if (str1.length() == str2.length()) {
        std::cout << "The strings have the same length." << std::endl;
    } else {
        if (str1.length() > str2.length()) {
            std::cout << "The first string is longer." << std::endl;
        } else {
            std::cout << "The second string is longer." << std::endl;
        }
    }

    return 0;
}


// ES. 2
// scrivi un programma che legga due stringhe e le concateni. 
// poi un programma che le concateni separate da 1 whitespace.


#include <iostream>
#include <string>

using std::cin; 
using std::cout;
using std::endl;

using std::string;

int main() {
    //lettura di 2 stringhe
    string s1, s2;
    cout << "inserire stringa 1: ";
    cin >> s1;
    cout << "inserire stringa 2: ";
    cin >> s2;

    //concatenazione
    cout << "stringhe concatenate: " << s1 + s2 << endl;
    return 0;
}

#include <iostream>
#include <string>

using std::cin; 
using std::cout;
using std::endl;

using std::string;

int main() {
    //lettura di 2 stringhe
    string s1, s2;
    cout << "inserire stringa 1: ";
    cin >> s1;
    cout << "inserire stringa 2: ";
    cin >> s2;

    //concatenazione con whitespace
    cout << "stringhe splittate: " << s1 << " " << s2 << endl;
    return 0;
}



// ES. 3
// usa un for range per cambiare tutti i caratteri di una stringa in X.

#include <iostream>
#include <string>

using std::cin; 
using std::cout;
using std::endl;

using std::string;

int main() {
    
    string s1 = "ciao come stai";
    
    // Itera su ogni carattere di s1 per riferimento
    for (char &elem : s1) {
        elem = 'X'; // Modifica ogni carattere in 'X'
    }
    
    // Stampa la stringa modificata
    cout << "Stringa modificata: " << s1 << endl;

    return 0;
}



// ES. 5
// cambia tutti i caratteri di una stringa in X.
// riscrivi il programma usando un while e poi usando un for classico.

#include <iostream>
#include <string>

using std::cin; 
using std::cout;
using std::endl;

using std::string;

int main() {
    
    string s1 = "ciao come stai";
    
    size_t i = 0; // Indice per iterare

    while (i < s1.length()) {
        s1[i] = 'X'; // Cambia il carattere corrente in 'X'
        i++; // Incrementa l'indice
    }
    
    // Stampa la stringa modificata
    cout << "stringa modificata: " << s1 << endl;

    return 0;
}



#include <iostream>
#include <string>

using std::cin; 
using std::cout;
using std::endl;

using std::string;

int main() {
    
    string s1 = "ciao come stai";

    for (size_t i = 0; i < s1.length(); i++) {
        s1[i] = 'X';
    }
    
    // Stampa la stringa modificata
    cout << "stringa modificata: " << s1 << endl;

    return 0;
}



// ES. 6
// scrivi un programma che legga una stringa di caratteri con punteggiatura inclusa e la ristampi senza punteggiatura.

#include <iostream>
#include <string>
#include <cctype> // Necessario per la funzione ispunct

using std::cout;
using std::endl;
using std::string;

int main() {
    // Stringa di input predefinita
    string s1 = "ciao, come stai?";

    string senzaPunteggiatura; // Stringa per contenere i caratteri senza punteggiatura

    // Itera su ogni carattere della stringa originale
    for (size_t i = 0; i < s1.length(); i++) {
        // Controlla se il carattere NON è una punteggiatura
        if (!ispunct(s1[i])) {
            senzaPunteggiatura += s1[i]; // Aggiungi il carattere alla nuova stringa
        }
    }

    // Stampa la stringa senza punteggiatura
    cout << "Stringa modificata: " << senzaPunteggiatura << endl;

    return 0;
}


#include <iostream>
#include <string>
#include <cctype> // Necessario per la funzione ispunct

using std::cin;
using std::cout;
using std::endl;
using std::string;

int main() {
    // Leggi una stringa dall'input dell'utente
    string s1;
    cout << "Inserisci una stringa con punteggiatura: ";
    getline(cin, s1); // Utilizza getline per includere spazi

    string senzaPunteggiatura; // Stringa per contenere i caratteri senza punteggiatura

    // Itera su ogni carattere della stringa originale
    for (size_t i = 0; i < s1.length(); i++) {
        // Controlla se il carattere NON è una punteggiatura
        if (!ispunct(s1[i])) {
            senzaPunteggiatura += s1[i]; // Aggiungi il carattere alla nuova stringa
        }
    }

    // Stampa la stringa senza punteggiatura
    cout << "Stringa modificata: " << senzaPunteggiatura << endl;

    return 0;
}

