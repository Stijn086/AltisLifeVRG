
private["_mbv","_mbv2"];
if(dialog) exitWith {}; //A dialog is already open.
life_safeObj = mb_vault;
if(isNull life_safeObj) exitWith {};
if(playerSide != civilian) exitWith {};
//Fuck this distance check off
//if(player distance mb_vault > 0.4) exitWith {}; 
_mbv = nearestObject [mb_vault, "Land_Research_house_V1_F"];
//Fuck this shit off too. It worked fine without them -.-
//_mbv2 = _mbv getVariable["isCut",false];
//if(_mbv2 == false) exitWith {};


if((life_safeObj getVariable["inUse",false])) exitWith {hint "The military store is currently in use!"};
if(!createDialog "Military_Vault") exitWith {hint "STR_MISC_DialogError"};
disableSerialization;
ctrlSetText[8971,( "Military Store")];

[life_safeObj] call life_fnc_safeInventory3;
life_safeObj setVariable["inUse",true,true];
[life_safeObj] spawn
{
	waitUntil {isNull (findDisplay 8970)};
	(_this select 0) setVariable["inUse",false,true];
};
