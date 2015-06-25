/*
Coded by: Robert "weiRd" May

Contact:
admin@luxegaming.com
ts3.luxegaming.com

File Purpose: Gravia Gas Station Timer
*/

//Variables
_counter = 0;
timeG = 0;

//While loop that estimates the given time
while {_counter < gasTimer} do
{
_counter = _counter +1;
timeG = _counter;
sleep 1;
};