#pragma once
template <class T>
class DynamicArray {
private:
	int size;
	T *elements;
	int current_size;
public:
	DynamicArray();
	DynamicArray(int paramSize);
	~DynamicArray();
	DynamicArray(const DynamicArray&);
	T& operator[](int index);
	int getLength( void );
	void print(void);
	void prepend(T);
};

