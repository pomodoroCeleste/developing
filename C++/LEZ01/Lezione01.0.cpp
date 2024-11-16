

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