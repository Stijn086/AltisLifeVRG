/*
    File: fn_loadGear.sqf
    Author: Anthony "Zanven" Poschen
    
    Description:
    checks what side the player is on and calls that sides load function to load gear
*/
private["_handle","_playerSide","_civ","_west","_independent"];
_playerSide = _this select 0;
_civ = _this select 1;
_west = _this select 2;
_independent = _this select 3;

switch(_playerSide) do {
	case _civ				: { _handle = [] spawn life_fnc_civLoadGear; };
	case _west				: { _handle = [] spawn life_fnc_copLoadout; };
	// loads default medic gear cause medics shouldn't be carrying custom shit.
	case _independent	 	: { _handle = [] spawn life_fnc_medicLoadout; }; 
};
// waits until your gear is finished being setup. 
// to avoid loading in and having it magically appear on your body after a few seconds.
// since respawn is waiting for this to finish so we should wait till its done to.
waitUntil {scriptDone _handle};