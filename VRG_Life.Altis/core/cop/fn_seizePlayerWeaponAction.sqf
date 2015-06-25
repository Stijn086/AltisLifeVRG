/*
	File: fn_seizePlayerWeaponAction.sqf
	Author: Skalicon
	
	Description:
	Removes the players weapons client side
*/
_myVest = vest player;
if (_myVest == "V_HarnessOGL_brn") then {
removeVest player;
};
removeAllWeapons player;
[] call life_fnc_civFetchGear;
[] call life_fnc_sessionUpdate; //Should make weapon remove persistent
[] call life_fnc_civLoadGear;
titleText["Your weapons And/Or your Suicide Vest have been seized.","PLAIN"];

[] call life_fnc_equipGear;