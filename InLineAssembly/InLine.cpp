// main.cpp - testing the LongestIncreasingSequence subroutine
// below are the list of external dependencies that I have imported
#include <iostream>
#include "longest.h"
using namespace std;

int main()
{
	// #1 this is my testing code right here that I will use for the 'LongestIncreasingSequnce' fucn
	//______________________________________________________________________________________________
	// SAMPLE RUN #5


	const unsigned ARRAY_SIZE = 14;
	long array[] = { -12, -1, -2, 3, 0, 1, 2, -1, 9999, -9999, 10, 18, 13, -13};
	//______________________________________________________________________________________________

	
	// #2 outputs the value of the longest sequence of increasing elements
	cout << "The longest sequence of assending elements is " << LongestIncreasingSequence(array, ARRAY_SIZE)
		 << " in length." << endl;
	
	system("PAUSE");
	return 0;
}
