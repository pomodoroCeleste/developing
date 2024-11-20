// main.cpp

#include <iostream> 
#include <cstdlib>

#include "Sales_data.h" 

using std::cin;
using std::cout;
using std::cerr;
using std::endl;
using std::istream;
using std::ostream;

istream &read(istream &is, Sales_data &data);
ostream &print(ostream &out, const Sales_data &data);
Sales_data add(const Sales_data &lhs, const Sales_data &rhs);

int main(istream &in){
	
	Sales_data data1, data2;
	
	// read the first transaction
	read(cin,data1);
	// read the second transaction
	read(cin,data2);
	
	if (data1.bookNo == data2.bookNo) {
		print(cout, add(data1, data2));
		cout << endl;
		return EXIT_SUCCESS;
	} else {
		cerr << "Data must refer to the same ISBN" << endl;
		return EXIT_FAILURE;
	}
	return EXIT_SUCCESS;
}

istream &read(istream &is, Sales_data &data){
	double price = 0; // price per book, used to calculate total revenue
	is >> data.bookNo >> data.units_sold >> price;
	data.revenue = data.units_sold*price;
	
	return is;
}

ostream &print(ostream &os, const Sales_data &data) {
	 
	os << data.bookNo << " " << data.units_sold << 
		" " << data.revenue << " ";
		
	if(data.units_sold != 0)
		os << data.revenue/data.units_sold;
	else 
		os << "(no sales)";
	
	return os;
}

Sales_data add(const Sales_data &lhs, const Sales_data &rhs) {
	
	//Sales_data sum = lhs; // copy data members from lhs to sum
	
	Sales_data sum;
	
	sum.bookNo = lhs.bookNo;
	sum.units_sold = lhs.units_sold;
	sum.revenue = lhs.revenue;
	
	sum.units_sold += rhs.units_sold;
	sum.revenue += rhs.revenue;
	
	return sum;
}
