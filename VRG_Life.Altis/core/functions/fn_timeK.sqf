/*
Coded by: Robert "weiRd" May

Contact:
admin@luxegaming.com
ts3.luxegaming.com

File Purpose: Kavala Gas Station Timer
*/

//Variables
_counter = 0;
timeK = 5;

//While loop that estimates the given time
while {_counter < gasTimer} do
{
_counter = _counter +1;
timeK = _counter;
sleep 1;
};