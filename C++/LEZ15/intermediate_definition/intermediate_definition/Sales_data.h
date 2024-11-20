// Sales_data.h
#ifndef SALES_DATA_H
#define SALES_DATA_H
struct Sales_data { 
	// member functions 
	/* operations on Sales_data objects defining the interface */
	std::string isbn() const { return bookNo; } 
	Sales_data& combine(const Sales_data&); 
	/* operations on Sales_data objects defining the implementation */
	double avg_price() const; 
	// data members 
	std::string bookNo; 
	unsigned units_sold = 0; 
	double revenue = 0.0; 
}; 
// nonmember Sales_data interface functions 
Sales_data add(const Sales_data&, const Sales_data&); 
std::ostream &print(std::ostream&, const Sales_data&); 
std::istream &read(std::istream&, Sales_data&);
#endif