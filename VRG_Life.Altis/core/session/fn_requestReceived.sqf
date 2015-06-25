#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Called by the server saying that we have a response so let's
	sort through the information, validate it and if all valid
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

//user whitelisting
__CONST__(life_whitelisted,parseNumber(_this select 11));

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel,parseNumber(_this select 7));
		cop_gear = _this select 8;
		// dirty hack need to find where default civ gear is set if civ has no gear before this is called and also check for cops so this isnt needed.
		// i think it just sets the default gear to civ_gear which gets passed into this file.
		if(count cop_gear == 0) then {
			[] spawn life_fnc_copLoadout;
		} else {
			[] spawn life_fnc_copLoadGear;
		};

		life_blacklisted = _this select 9;
		__CONST__(life_medicLevel,0);
		__CONST__(life_pmcLevel,0);
	};

	case civilian: {
		__CONST__(life_adminlevel,parseNumber(_this select 4));
		life_is_arrested = _this select 7;
		//life_is_arrested = call compile format["%1", _this select 7];
		civ_gear = _this select 8;
		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		__CONST__(life_pmcLevel,0);
		[] spawn life_fnc_civLoadGear;
		life_houses = _this select 9;
		{
			_house = nearestObject [(call compile format["%1", _x select 0]),"House_F"];
			life_vehicles set[count life_vehicles,_house];
		} foreach life_houses;

		life_gangData = _this select 10;
		if(count (life_gangData select 0) != 0) then {
			[] call life_fnc_initGang; // required to wait for this to finish to be able to do base spawn from gangid on first spawn.
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: {
		__CONST__(life_medicLevel,parseNumber(_this select 7));
		__CONST__(life_copLevel,0);
		__CONST__(life_pmcLevel,0);
        life_blacklisted_medic = parseNumber(_this select 9);
	};

};

switch(__GETC__(life_donator)) do
{
	case 1: {life_paycheck = life_paycheck + 1700;};
	case 2: {life_paycheck = life_paycheck + 2000;};
	case 3: {life_paycheck = life_paycheck + 2300;};
	case 4: {life_paycheck = life_paycheck + 2600;};
	case 5: {life_paycheck = life_paycheck + 2900;};
};

life_session_completed = true;
