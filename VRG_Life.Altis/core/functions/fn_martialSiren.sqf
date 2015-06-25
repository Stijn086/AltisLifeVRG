/*
	Date:			Func:				Auth:			Exec:				
	09.02.2015		martialSiren		mullsm0ke		execVM

	Desc:
	When martial law is called, a siren plays in Kavala area for 2 minutes 
	every 5 minutes to let civilians know to get inside and so rebels know
	to vacate the area or be shot by the police.

	Will add feature allowing the map to be clicked when martial law 
	is declared and the siren will play around a certain radius in the
	clicked location.
*/

private["_sPath","_sound"];
_sPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_sound = _sPath + "sounds\bankalarm.ogg";
sleep 3;
while {true} do
{
	for "o" from 1 to 6 do
	{
		if(!martial_law_active) exitWith {};
		playSound3D [_sound, ml1, false, getPosASL ml1, 3, 1, 0];
		sleep 23;
	};
	if(!martial_law_active) exitWith {};
	sleep 300;
};

