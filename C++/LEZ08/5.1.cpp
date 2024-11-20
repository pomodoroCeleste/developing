// 5.1
// redo 4.9 using iterators

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

    // Function to print the size and contents of a vector
    auto print_vector = [](const auto& vec) {
        std::cout << "Size: " << vec.size() << "\nContents: ";
        for (auto it = vec.begin(); it != vec.end(); ++it) {
            std::cout << *it << " ";
        }
        std::cout << std::endl;
    };

    // Print the size and contents of each vector
    print_vector(v1);
    print_vector(v2);
    print_vector(v3);
    print_vector(v4);
    print_vector(v5);
    print_vector(v6);
    print_vector(v7);

    return 0;
}