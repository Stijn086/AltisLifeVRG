/*
	File: fn_rapeAction.sqf
	
	Description:
	Activate rape action
*/
private["_target"];
_target = cursorTarget;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};

if(_target getVariable["raped",false]) exitWith {};
switch(life_rapecounter) do
	{
		case 5: {
		life_rapecounter=life_rapecounter+1;
		serv_killed = [player,'Repeat Rapist'];
		publicVariableServer 'serv_killed'; 
		};
		case 10: {
		life_rapecounter=0; 
		serv_killed = [player,'Sexual Masochism'];
		publicVariableServer 'serv_killed';
		};
		default {life_rapecounter=life_rapecounter+1;};
};
titleText[format["Attempting to rape %1...",name _target],"PLAIN"];
[[_target,player,name player],"life_fnc_rapeme",_target,false] spawn life_fnc_MP;
_target setVariable["raped",TRUE,TRUE];