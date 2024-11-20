#include <iostream>
#include <cstdlib>

#include <string>

struct Sales_data 
{ 
	std::string bookNo; 
	unsigned units_sold = 0; 
	double revenue = 0.0; 
};

using std::cin;
using std::cout;
using std::cerr;
using std::endl;

int main()
{
	Sales_data d1, d2;
    double price = 0.0;
	
    // read the first transaction
    cin >> d1.bookNo >> d1.units_sold >> price;
	d1.revenue = d1.units_sold * price;
	
	// read the second transaction
    cin >> d2.bookNo >> d2.units_sold >> price;
	d2.revenue = d2.units_sold * price;
    
    if (d1.bookNo == d2.bookNo) {
        Sales_data tot;
        tot.bookNo = d1.bookNo;
        tot.units_sold = d1.units_sold + d2.units_sold;
        tot.revenue = d1.revenue + d2.revenue;
        
		cout << tot.bookNo << " " << tot.units_sold << " " << tot.revenue << " ";
		
        if (tot.units_sold > 0){
            
            double average_price = tot.revenue / tot.units_sold;
            
            cout << average_price << endl;
            
        } else {
			
			cout << "(no sales)" << endl;
			
		}
        
    } else {
		cerr << "Data must refer to the same ISBN" << endl;
		return EXIT_FAILURE;
	}

    return EXIT_SUCCESS;

}