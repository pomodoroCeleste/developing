/*in classe: bookstore.exe
- per usare direttamente il .txt da linea di comando: bookstore.exe < input.txt
(ovviamente deve essere già tutto in memoria)
- se voglio redirigere anche l'output nella stessa directory: [./bookstore < input.txt > bookstoreOutput.txt]
*/
#include <iostream>
#include "Sales_item.h"

int main() {
    Sales_item current_item, total_item;

    if (std::cin >> current_item) {
        total_item = current_item;
        //std::cout << "* " << current_item << std::endl;
        while (std::cin >> current_item) {
            if (current_item.isbn() == total_item.isbn()) {
                total_item = total_item + current_item;
            } else {
                std::cout << total_item << std::endl;
                total_item = current_item;
            }
            std::cout << total_item << std::endl;
        }
    } else {
        std::cerr << "No data?!" << std::endl;
        return -1;
    }

    return 0;
}


//data una sequenza di numeri stampa quello che compare + volte (vedi codice lezione precedente)