#include <iostream>
#include <cmath>
#include <string>

using namespace std;

//global functions
int bin_to_dec(string);
string dec_to_bin(int);
int hex_to_dec(string);  
string dec_to_hex(int);  


int main() 
{
    cout << "SAMPLE RUN #5\n";
    cout << "––––––––––––––––––––––––––––––––––––––––––––––––––––––\n";
	cout<<"10101 binary = "<<bin_to_dec("10101")<<" decimal\n";
	cout<<"0101 binary = "<<bin_to_dec("0101")<<" decimal\n";
	cout<<"101 binary = "<<bin_to_dec("101")<<" decimal\n";
	cout<<"1001 binary = "<<bin_to_dec("1001")<<" decimal\n\n";
	
	cout<<"111 decimal = "<<dec_to_bin(111)<<" binary\n";
	cout<<"222 decimal = "<<dec_to_bin(222)<<" binary\n"; //you should get 1111111111111100
	cout<<"333 decimal = "<<dec_to_bin(333)<<" binary\n"; //you should get 1100
	cout<<"444 decimal = "<<dec_to_bin(444)<<" binary\n\n"; //you should get 11110100001001000000
    
	cout<<"A hexadecimal = "<<hex_to_dec("A")<<" decimal\n"; //you should get 2,748
	cout<<"B hexadecimal = "<<hex_to_dec("B")<<" decimal\n"; //you should get 245
	cout<<"C hexadecimal = "<<hex_to_dec("C")<<" decimal\n"; //you should get 4,660
	cout<<"D hexadecimal = "<<hex_to_dec("D")<<" decimal\n\n"; //you should get 1,040,075
	
    
	cout<<"15 decimal = "<<dec_to_hex(15)<<" hexadecimal\n"; //you should get 200
	cout<<"14 decimal = "<<dec_to_hex(14)<<" hexadecimal\n";
	cout<<"13 decimal = "<<dec_to_hex(13)<<" hexadecimal\n"; //you should get DBBA0
	cout<<"12 decimal = "<<dec_to_hex(12)<<" hexadecimal\n\n"; //you should get FFF5
	
	return 0;

}

//#1
//converts any unsigned binary number to decimal
//this func i did a little differently and used arithmetic to convert between
//binary and decimal as char is actually a single unsiged byte in memory
int bin_to_dec(string s) 
{
    int rtrn = 0;
    char tmp = 0;
    
    //#2
    //initialize both 'j' and 'i' variables in for loop this saves space
    //and it also limits the scope of the variables
    for (int j = 0, i = (int) s.length() - 1; i >= 0; i--, j++)
    {
        //#3
        //accesses the last unaccessed element in the input string then subtracts it by
        //48 this is because 48 is the value of 0 in ASCII
        tmp = s[i] - 48;
        
        rtrn += pow(2, j) * static_cast<short>(tmp);    //#4 finally the function uses the equation 2^X * I... to calculate the value at the index
    }
    
    return rtrn;
}	


//Converts any non-negative decimal number to binary
string dec_to_bin(int n)  
{
    string rtrn = "";
    int tmp = 0;
    
    //#5
    //while loop runs while there is still a remainer to be calculated if there is no remainder to
    //be calculated it doesn't run because it would not change the true value
    while (n > 0)
    {
        tmp = n % 2;                        //#6 finds the remainder of 'n' divided by 2
        rtrn.insert(0, to_string(tmp));     //#7 inserts the remainder to the first element of 'rtrn' string
        n /= 2;                             //#8 interates through 'n'
    }
    
    return rtrn;
}


//Converts any UNsigned hexadecimal number to decimal
int hex_to_dec(string s) 
{
    int rtrn = 0;
    char tmp = 0;
    string tmpString = "";
    
    //#9
    //initialize both 'j' and 'i' variables in for loop this saves space
    //and it also limits the scope of the variables
    for (int j = 0, i = (int) s.length() - 1; i >= 0; i--, j++)
    {
        tmp = s[i];         //#10 gets the value of the first index in the form of a char
        
        //#11
        //i used a switch statment here because I'm a little rusty with these statements
        //and I wanted to use them in this project due to the small efficieny increase as well
        switch (toupper(tmp))
        {
            case 'F':
            {
                rtrn += pow(16, j) * 15;
                break;
            }
            case 'E':
            {
                rtrn += pow(16, j) * 14;
                break;
            }
            case 'D':
            {
                rtrn += pow(16, j) * 13;
                break;
            }
            case 'C':
            {
                rtrn += pow(16, j) * 12;
                break;
            }
            case 'B':
            {
                rtrn += pow(16, j) * 11;
                break;
            }
            case 'A':
            {
                rtrn += pow(16, j) * 10;
                break;
            }
            //#12 this defauult runs if the value is less than 10 and is very similar to the binary to decimal conversion
            default:
            {
                tmpString = s[i];
                int pos = stoi(tmpString);
                rtrn += pow(16, j) * pos;
            }
        };
    }
    
    return rtrn;
}	


//Converts any non-negative decimal number to hexadecimalConverts any non-negative decimal number to hexadecimal
string dec_to_hex(int n)  
{
    string rtrn = "";
    int tmp = 0;
    
    while (n > 0)
    {
        //#13
        //i don't really need this variable as i can simply include this equation
        //within the sitch statement but i think using makes the code more readable
        tmp = n % 16;
        
        switch (tmp)
        {
            case 15:
            {
                rtrn.insert(0, "F");
                break;
            }
            case 14:
            {
                rtrn.insert(0, "E");
                break;
            }
            case 13:
            {
                rtrn.insert(0, "D");
                break;
            }
            case 12:
            {
                rtrn.insert(0, "C");
                break;
            }
            case 11:
            {
                rtrn.insert(0, "B");
                break;
            }
            case 10:
            {
                rtrn.insert(0, "A");
                break;
            }
            default:
            {
                rtrn.insert(0, to_string(tmp));
            }
        };
        
        n /= 16;
    }
    
    return rtrn;
}



