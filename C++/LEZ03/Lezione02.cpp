//in classe: bookstore.exe

//???


#include <iostream>
#include "Sales_item.h"

int main() {
    Sales_item current_item, total_item;

    if (std::cin >> current_item) {
        total_item = current_item;
        std::cout << "* " << current_item << std::endl;
        while (std::cin >> current_item) {
            if (current_item.isbn() == total_item.isbn()) {
                total_item = total_item + current_item;
            } else {
                std::cout << total_item << std::endl;
                total_item = current_item;
            }
            std::cout << "* " << current_item << std::endl;
        }
    } else {
        std::cout << "No data?!" << std::endl;
    }

    return 0;
}

