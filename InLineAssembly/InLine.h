/*  #3
	this header file right here contains the reference to the external assembly function that
	will be called by the main program, in addition this is referenced in the main program
	using the statement "include "longest.h""
*/

// #4 as you can see here I used the "C" identifier that tells the compilier to not perform 
//    name declaration of the fucniton below
extern "C"
{
	long LongestIncreasingSequence(long arr[], long length);
}