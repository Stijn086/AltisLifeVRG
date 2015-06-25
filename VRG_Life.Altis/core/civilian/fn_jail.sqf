/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";
player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
if(life_inv_lsd > 0) then {[false,"lsd",life_inv_lsd] call life_fnc_handleInv;};
if(life_inv_meth > 0) then {[false,"meth",life_inv_meth] call life_fnc_handleInv;};
if(life_inv_eporn > 0) then {[false,"eporn",life_inv_eporn] call life_fnc_handleInv;};
if(life_inv_uporn > 0) then {[false,"uporn",life_inv_uporn] call life_fnc_handleInv;};
if(life_inv_eSnuff > 0) then {[false,"eSnuff",life_inv_eSnuff] call life_fnc_handleInv;};
if(life_inv_uSnuff > 0) then {[false,"uSnuff",life_inv_uSnuff] call life_fnc_handleInv;};
if(life_inv_uraniumWeap > 0) then {[false,"uraniumWeap",life_inv_uraniumWeap] call life_fnc_handleInv;};
if(life_inv_blooddiamond > 0) then {[false,"blooddiamond",life_inv_blooddiamond] call life_fnc_handleInv;};
if(life_inv_blooddiamondc > 0) then {[false,"blooddiamondc",life_inv_blooddiamondc] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_spikeStrip > 0) then {[false,"spikeStrip",life_inv_spikeStrip] call life_fnc_handleInv;};
if(life_inv_lockpick > 0) then {[false,"lockpick",life_inv_lockpick] call life_fnc_handleInv;};
if(life_inv_blastingcharge > 0) then {[false,"blastingcharge",life_inv_blastingcharge] call life_fnc_handleInv;};
if(life_inv_boltcutter > 0) then {[false,"boltcutter",life_inv_boltcutter] call life_fnc_handleInv;};
life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
removeHeadgear player:
removeGoggles player;
removeVest player;
removeUniform player;
removeBackpack player;
player addUniform "U_C_WorkerCoveralls";
[] spawn life_fnc_updateClothing;

[[player,_bad],"life_fnc_jailSys",false,false] spawn life_fnc_MP;
[] call SOCK_fnc_updateRequest;