#pragma once

#include "DynamicArray.h"
using namespace std;

template <class T>
DynamicArray<T>::DynamicArray() {
	DynamicArray<T>::DynamicArray<T>(5);
}

template <class T>
DynamicArray<T>::DynamicArray(int paramSize) {
	elements = new T[paramSize];

	size = paramSize;
	current_size = paramSize;
}

template <class T>
int DynamicArray<T>::getLength() {
	return current_size;
}

template <class T>
DynamicArray<T>::~DynamicArray()
{
	delete [] elements;
}

template <class T>
void DynamicArray<T>::print()
{
	bool bool_scientific = (typeid(T) == typeid(double)) ? true : false;
	if (bool_scientific) { std::cout << "Printing Double Type in Scientific Notation:\n" << std::scientific; }
	for (int i = 0; i < getLength(); i++) {
		cout << (elements[i]) << "\n" << endl;
	}
}

template <class T>
DynamicArray<T>::DynamicArray(const DynamicArray& old_obj)
{
	size = old_obj.size;
	elements = old_obj.elements;
	current_size = old_obj.current_size;
}

template <class T>
T& DynamicArray<T>::operator[](int index) {
	return elements[index];
}

template <class T>
void DynamicArray<T>::prepend(T val) {
	if ((size - (current_size + 1)) <= 0) {
		//needs to be resized
		int newSize = getLength() + 1;
		T *temp;
		temp = new T[newSize];
		for (int i = 1; i < (newSize); i++) {
			temp[i] = elements[i - 1];
		}
		delete[] elements;
		elements = temp;
		size = newSize;
		elements[0] = val;
	}
	else {
		int newSize = getLength();
		T *temp;
		temp = new T[newSize];
		for (int i = 1; i < (newSize); i++) {
			temp[i] = elements[i - 1];
		}
		delete[] elements;
		elements = temp;
		elements[0] = val;
	}
	
	current_size++;
}