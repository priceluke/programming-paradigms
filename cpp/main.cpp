#include <ctime> 
#include <typeinfo>
#include <iostream>
#include <cstdlib>
#include "DynamicArray.cpp"

using namespace std;

int main(int argc, char **argv) {

	srand(time(0));
	DynamicArray<int> array_rand = DynamicArray<int>(5);
	for (int i = 0; i < array_rand.getLength(); i++) {
		array_rand[i] = rand() % 101;
	}
	array_rand.prepend(1);
	array_rand.prepend(2);
	array_rand.prepend(3);
	array_rand.prepend(4);
	array_rand.prepend(5);


	DynamicArray<double> array_bool = DynamicArray<double>(5);
	for (int i = 0; i < array_bool.getLength(); i++) {
		array_bool[i] = (rand() % 2);
	}

	array_bool.prepend(3.333333);
	array_bool.prepend(0.123456);
	array_bool.prepend(8.987654);
	array_bool.prepend(9.333333);
	array_bool.prepend(-122.233);

	array_rand.print();
	cout << "Length:  " << array_rand.getLength() << endl;

	array_bool.print();
	cout << "Length:  " << array_bool.getLength();
	getchar();

	return 0;
}