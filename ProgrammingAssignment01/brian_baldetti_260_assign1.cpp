#include <iostream>
using namespace std;

//constant int for 2D-array columns #1
const int COLS = 5;

//function I have added to the base program #2
void printArr(const int [][COLS], int);

//changed 2d-array to const to prevent any errors   #3
int getTotal(const int [][COLS], int);
double getAverage(const int [][COLS], int);
int getRowTotal(const int [][COLS], int);
int getColumnTotal(const int [][COLS], int, int);
int getHighestInRow(const int [][COLS], int);
int getLowestInRow(const int [][COLS], int);

int main()
{
	const int ROWS = 4;  
	
    //–––––––––––––––––––––––––––––––––––––––––––––––––––––––//
	int testArray[ROWS][COLS] =
					{ { 0,   21,  91,  38,  37 },
					{   44,   53,  6,  99, 1 },
					{  0,  32, 0, 21, 57 },
					{  59,  21, 27, 74, 0 } };
    //–––––––––––––––––––––––––––––––––––––––––––––––––––––––//
	
    //outputting the results of the program     #4
    cout <<"–––––––––––––––––––––––––––––––––––––––––\n";

    printArr(testArray, ROWS);
    
    cout <<"–––––––––––––––––––––––––––––––––––––––––\n";
    
	cout << "The total of the array elements is "
		 << getTotal(testArray, ROWS)
		 << endl;
    
	cout << "The average value of an element is "
		 << getAverage(testArray, ROWS)
		 << endl;

	cout << "The total of row 3 is "
		 << getRowTotal(testArray, 3)
		 << endl;

	cout << "The total of col 4 is "
		 << getColumnTotal(testArray, 4, ROWS)
		 << endl;
     
	cout << "The highest value in row 0 is "
		 << getHighestInRow(testArray, 0)
		 << endl;

	cout << "The lowest value in row 0 is "
		 << getLowestInRow(testArray, 0)
		 << endl;
    
    cout <<"–––––––––––––––––––––––––––––––––––––––––\n";
    
    return 0;
}
/*  #5
    program will print out all the values in the 2D-array
    program DOES NOT alter the content of the array
*/
void printArr(const int inArr[][COLS], int inRows)
{
    for (int i = 0; i < inRows; i++)
    {
        for (int j = 0; j < COLS; j++)
        {
            cout << inArr[i][j] << " ";
        }
        cout << endl;
    }
}
/*  #6
    the func will return the total value of the 2d-array
    in an integer var
 */
int getTotal(const int array[][COLS], int rows)
{
    int sum = 0;
    
    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < COLS; j++)
        {
            sum += array[i][j];
        }
    }
    
    return sum;
}

/*  #7
    the func will return the average of the 2d-array
    in double var
 */
double getAverage(const int array[][COLS], int rows)
{
    double elements = rows * COLS;
    return getTotal(array, rows) / elements;
}

/*  #8
    func will return the total of a specified row
    in the 2d-array with the int 'rowSum'
    the row is specified by the 'rowToTotal' variable
 */
int getRowTotal(const int array[][COLS], int rowToTotal)
{
    int rowSum = 0;
    
    for (int i = 0; i < COLS; i++)
    {
        rowSum += array[rowToTotal][i];
    }
    
    return rowSum;
}

/*  #9
    func returns the total of a specified col
    in the 2d-array with the var 'colSum'
    'colToTotal' specifies to col to sum
 */
int getColumnTotal(const int array[][COLS], int colToTotal, int rows)
{
    int colSum = 0;
    
    for (int i = 0; i < rows; i++)
    {
        colSum += array[i][colToTotal];
    }
    
    return colSum;
}

/*  #10
    func returns the highest value of the specified row
    in the 2d-array using the int var 'max'
    the variable 'rowToSearch' specifies the row to sum
 */
int getHighestInRow(const int array[][COLS], int rowToSearch)
{
    int max = array[rowToSearch][0];
    
    for (int i = 1; i < COLS; i++)
    {
        if (max < array[rowToSearch][i])
        {
            max = array[rowToSearch][i];
        }
    }
    
    return max;
}

/*  #11
    the func will return the lowest value in the specified
    row of the 2d-array using the int var 'min'
    the variable 'rowToSearch' species to row to find the lowest value
 */
int getLowestInRow(const int array[][COLS], int rowToSearch)
{
    int min = array[rowToSearch][0];
    
    for (int i = 1; i < COLS; i++)
    {
        if (min > array[rowToSearch][i])
        {
            min = array[rowToSearch][i];
        }
    }
    
    return min;
}
