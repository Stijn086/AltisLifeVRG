/*
Coded by: Robert "weiRd" May

Contact:
admin@luxegaming.com
ts3.luxegaming.com

File Purpose: Pyrgos Gas Station Timer
*/

//Variables
_counter = 0;
timeP = 0;

//While loop that estimates the given time
while {_counter < gasTimer} do
{
_counter = _counter +1;
timeP = _counter;
sleep 1;
};