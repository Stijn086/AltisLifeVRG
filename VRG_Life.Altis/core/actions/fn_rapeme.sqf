/*
	File: fn_rapeme.sqf
	
	Description:
	Attempts to rape the player.
*/
private["_target","_who","_obj","_caller","_rapesuccessmessages","_rapefailmessages","_success","_randommessage"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_caller = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,2,"",[""]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(isNull _caller) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};
_rapesuccessmessages=[
"Left you as sore as a gay man after a GangBang scene",
"Violated you with the end of his gun barrel.",
"He tickled your stomach with his cock",
"He blew his load all over your face, ewwww..."
];

_rapefailmessages=[
"He was all talk and no action",
"He couldn't get it up",
"Got his dick caught while unzipping his pants..",
"He likes to be the catcher not the pitcher"
];

titleText[format["%1 is attempting to rape you...",_who],"PLAIN"];
sleep 3;
_success=random(100);
if (_success < 50) then {
	[[getPlayerUID _caller,name _caller,"261"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	_randommessage=_rapesuccessmessages call BIS_fnc_selectRandom;
	titleText[format["%1 %2",_who,_randommessage],"PLAIN"];
	hint 'You have been raped!\n\nYour anus needs to recover!';
	[[0,format["You raped %1! You left them with a sore anus.. they will not shitting normal for a week..", name _target]],"life_fnc_broadcast",_caller,false] spawn life_fnc_MP;
	[] spawn {

	player setdamage ((damage player)+.05);
	player forcewalk true;
	sleep (3 * 60);
	player forcewalk false;
	};
}
else {
	[[getPlayerUID _caller,name _caller,"261A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[0,format["You failed to rape %1.. looks like you fucked up and hurt yourself in the process..",name _target]],"life_fnc_broadcast",_caller,false] spawn life_fnc_MP;
	[[_caller],"life_fnc_rapefail",_caller,false] spawn life_fnc_MP;
	_randommessage=_rapefailmessages call BIS_fnc_selectRandom;
	titleText[format["%1 %2",_who,_randommessage],"PLAIN"];
};
[] spawn {sleep (3 * 60); player setVariable["raped",FALSE,TRUE];};
