//  1. Scrivere un programma che usa un while per sommare i numeri da 50 a 100.


#include <iostream>
using namespace std;

int main() {
    int sum = 0;  // Variabile per memorizzare la somma
    int i = 50;   // Iniziamo da 50

    // Ciclo while per sommare i numeri da 50 a 100
    while (i <= 100) {
        sum += i;  // Aggiungiamo il valore di i alla somma
        i++;       // Incrementiamo i
    }

    // Stampa del risultato finale -o 
    cout << "La somma dei numeri da 50 a 100 è: " << sum << endl;

    return 0;
}

//myes

#include <iostream>

int main() {
    int sum = 0;
    int num = 50;

    while (num<=100) {
        sum += 1;
        num++;
    }
    std::cout << "la somma dei numeri da 50 a 100 è: " << sum << std::endl;

    return 0;
}


//	2. Oltre all'operatore ++ esiste un operatore -- che sottrae 1 al suo operando. 
//     usa questo operatore per scrivere un while che stampi i numeri da 10 a 0.

#include <iostream>

int main() {

    int num = 10;

    while (num>=0) {
        std::cout << num << std::endl;
        num--;
    }

    return 0;
}

//	3. Scrivi un programma che chiede all'utente di inserire due numeri interi. 
//     stampa ogni numero nel range specificato da quei due interi.

#include <iostream>

int main() {

    int val1 = 0; int val2 = 0;
    std::cout << "inserire due valori interi: " << std::endl;

    //capire se devo eseguire il controllo sulla sequenza di variabili inserite. si. uso if
    while (std::cin >> val1 >> val2) {
        if (val1 <= val2) {
            std::cout << val1 << std::endl;                      
            ++val1;                           
        } else if (val1 >= val2) {                            
            std::cout << val1 << std::endl;           
            --val1;                                                 
        }
    }
    return 0;
}


//	4. Riscrivi i programmi dei 3 esercizi precedenti usando i for.

#include <iostream>

int main() {
    int sum = 0;  
    int i = 50;  

    for (i = 50; i <= 100; ++i) {
        sum += i;  
    }

    std::cout << "La somma dei numeri da 50 a 100 è: " << sum << std::endl;

    return 0;
}

#include <iostream>

int main() {

    int num = 10;

    for (num = 10; num>=0; --num) {
        std::cout << num << std::endl;
    }

    return 0;
}


//DA MODIFICARE!! INCOMPLETO, USA UN CICLO INFINITO (?). Aggiornato. CI non necessario
#include <iostream>

int main() {

    int val1 = 0; int val2 = 0;
    std::cout << "inserire due valori interi: " << std::endl;
    std::cin >> val1 >> val2;

    if (val1 >= val2) {
            std::cout << "inserire prima il valore minore" << std::endl;
            return 1;
        }

    for (int i = val1; i <= val2; ++i) {
        std::cout << i << std::endl;
    }

    return 0;
}



