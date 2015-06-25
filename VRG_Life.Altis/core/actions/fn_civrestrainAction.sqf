/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "ziptied")) exitWith {};
if(player == _unit) exitWith {};
if (side player == civilian) then {
	if(life_inv_zipties < 1) exitWith { hint "You have no zipties."; };
	life_inv_zipties = life_inv_zipties - 1;
	hint "You have ziptied the citizen";
};
if (side player == west) then {
	if(life_inv_zipties < 1) exitWith { hint "You have no zipties."; };
	life_inv_zipties = life_inv_zipties - 1;
	hint "You have ziptied the cop";
};
if(!isPlayer _unit) exitWith {};
//Broadcast!

_unit setVariable["ziptied",true,true];
[[player], "life_fnc_civrestrain", _unit, false] spawn life_fnc_MP;
[[0,format["%1 was ziptied by %2",_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[getPlayerUID player,profileName,"207"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
