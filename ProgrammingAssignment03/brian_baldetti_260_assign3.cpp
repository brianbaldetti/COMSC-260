// NOTE: The ONLY files that should be #included for this assignment are iostream,  
// cmath (for the pow function), 
// and string
// No other files should be #included
#include <iostream>
#include <cmath>
#include <string>
using namespace std;

//defining functions
string addbin(string, string);  
string addhex(string, string);
int addHexDigit(char, char);
string convertHexRemainder(char);


int main()
{
    //SAMPLE RUN 5
    cout << "SAMPLE RUN 5\n";
    cout << "\n––––––––––––––––––––––––––––––––––––––––\n";
	cout<<"binary 11111111 + 11 = "<<addbin("11111111", "1`")<<endl;
	cout<<"binary 11111111 + 111 = "<<addbin("11111111", "111")<<endl;
	cout<<"binary 11111111 + 1111 = "<<addbin("11111111", "1111")<<endl;
	cout<<"binary 100000000000 + 1 = "<<addbin("100000000000", "0")<<endl<<endl;
	
    
	cout<<"hexadecimal FF + FF = "<<addhex("FF", "FF")<<endl;
	cout<<"hexadecimal FFF + FFF = "<<addhex("FFF",  "FFF")<<endl;
	cout<<"hexadecimal FFFF + FFFF = "<<addhex("FFFF", "FFFF")<<endl;
	cout<<"hexadecimal F0000000 + F = "<<addhex("F0000000", "F")<<endl << endl;
    

	return 0;
	
}
/*  #1
    function will add the value of two binary numbers together
    the input numbers will be in the form of 2 string and the
    output number will be in the form of a string as well
    if there is an overflow then the length of the string will be increased
    otherwise there numbers may be sign extended
 */
string addbin(string bin1, string bin2)
{
    //#2    sign extend the numbers
	while (bin1.length() > bin2.length())
    {
        bin2.insert(0, "0");
    }
    while (bin1.length() < bin2.length())
    {
        bin1.insert(0, "0");
    }
    
    //#3    defines and initializes the variables
    bool carry = 0;
    string sum = "";
    
    //#4
    //defines the intcrement variables and the while loops conditions the loop will
    //run as long as the MSB has not yet been reach AND there is no carry over variables
    int i = (int) bin1.length() - 1;
    while (i >= 0 || carry)
    {
        //#5    runs if there is a carry value
        if (i < 0)
        {
            sum.insert(0, "1");
            carry = 0;
            break;
        }
        else if (bin1.at(i) == '1' && bin2.at(i) == '1')
        {
            if (carry)
            {
                sum.insert(0, "1");
            }
            else
            {
                carry = true;
                sum.insert(0, "0");
            }
        }
        else if (bin1.at(i) == '0' && bin2.at(i) == '0')
        {
            if (carry)
            {
                sum.insert(0, "1");
                carry = 0;
            }
            else
            {
                sum.insert(0, "0");
            }
        }
        else if (bin1.at(i) != bin2.at(i))
        {
            if (carry)
            {
                sum.insert(0, "0");
                carry = 1;
            }
            else
            {
                sum.insert(0, "1");
            }
        }
        //#6
        //runs if non of the previous statements evaluate to true
        //unexpected case
        else
        {
            cerr << "UNEXPECTED ERROR!" << endl;
            exit(EXIT_FAILURE);
        }
        
        
        i--;
    }
    
    return sum;
}
/*  #7
    adds 2 hex chars together to find the sum of the two
    then the sum of the two are returned in integer form
*/
int addHexDigit(char hex1, char hex2)
{
    int hex1Int = 0, hex2Int = 0;
    string tmpString = "";
    
    switch (toupper(hex1))
    {
        case 'F':
        {
            hex1Int = 15;
            break;
        }
        case 'E':
        {
            hex1Int = 14;
            break;
        }
        case 'D':
        {
            hex1Int = 13;
            break;
        }
        case 'C':
        {
            hex1Int = 12;
            break;
        }
        case 'B':
        {
            hex1Int = 11;
            break;
        }
        case 'A':
        {
            hex1Int = 10;
            break;
        }
        //#8    this defauult runs if the value is less than 10 and is very similar to the binary to decimal conversion
        default:
        {
            tmpString = hex1;
            hex1Int = stoi(tmpString);
        }
    }
    switch (toupper(hex2))
    {
        case 'F':
        {
            hex2Int = 15;
            break;
        }
        case 'E':
        {
            hex2Int = 14;
            break;
        }
        case 'D':
        {
            hex2Int = 13;
            break;
        }
        case 'C':
        {
            hex2Int = 12;
            break;
        }
        case 'B':
        {
            hex2Int = 11;
            break;
        }
        case 'A':
        {
            hex2Int = 10;
            break;
        }
        //#9    this defauult runs if the value is less than 10 and is very similar to the binary to decimal conversion
        default:
        {
            tmpString = hex2;
            hex2Int = stoi(tmpString);
        }
    }
    
    return (hex1Int + hex2Int);
}
/*  #10
    func converts the remainder of the sum operation to hexadecimal format
    this is because values greater than 9 have to be specially converted
*/
string convertHexRemainder(int remainder)
{
    switch(remainder)
    {
        case 16:
        {
            return "0";
        }
        case 15:
        {
            return "F";
        }
        case 14:
        {
            return "E";
        }
        case 13:
        {
            return "D";
        }
        case 12:
        {
            return "C";
        }
        case 11:
        {
            return "B";
        }
        case 10:
        {
            return "A";
        }
    }
    
    return to_string(remainder);
}
/*  #11
    func will add 2 hex numbers together however unlike the
    previous func it will have to interpret the values of chars
    function accepts two strings as input arguments and then it
    returns an output string
 */
string addhex(string hex1, string hex2)
{
    //sign extend the numbers
    while (hex1.length() > hex2.length())
    {
        hex2.insert(0, "0");
    }
    while (hex1.length() < hex2.length())
    {
        hex1.insert(0, "0");
    }
    
    //#12   defines and initializes variables
    string sum = "", tmpString = "";
    int hexSum= 0;
    bool carry = 0;
    
    //#13
    //increment variable and while loop using a while loop because the # of iterations are unknown
    //the loop will evaluate to true if the MSB has not been PASSED or if there is a carry bit
    int i = (int) hex1.length() - 1;
    while (i >= 0 || carry)
    {
        if (i < 0)
        {
            sum.insert(0, "1");
            carry = 0;
            break;
        }
        
        //#14   if there is a carry then a value of 1 is carried over the the right column to the new column
        carry ? hexSum = addHexDigit(hex1[i], hex2[i]) + 1 : hexSum = addHexDigit(hex1[i], hex2[i]);
        //#15   if the total of a column is greater than or equal to 16 then then we know that a value must be carried over
        hexSum / 16 ? carry = 1 : carry = 0;
        //#16   inserts the remainder of a column to the current colum
        sum.insert(0, convertHexRemainder(hexSum% 16));

        //#17   increments the while loop
        i--;
    }
    
    return sum;
}
 
