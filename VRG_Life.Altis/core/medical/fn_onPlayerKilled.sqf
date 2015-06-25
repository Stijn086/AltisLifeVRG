/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["permDead",FALSE,TRUE]; // Have they been executed?

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_maxTimeBleed","_RespawnBtn","_Timer","_BleedTimer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	_BleedTimer = ((findDisplay 7300) displayCtrl 7306);

	_maxTime = time + (life_respawn_timer * 60);
	_maxTimeBleed = time + (life_bleedout_timer * 60);
	_RespawnBtn ctrlEnable false;

	[[_this, player], "life_fnc_execute", true, true] spawn life_fnc_MP;
	
	waitUntil {_BleedTimer ctrlSetText format[localize "STR_Medic_Bleedout",[(_maxTimeBleed - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	round(_maxTimeBleed - time) <= 0 OR isNull _this OR (_this getVariable "permDead")};
	_BleedTimer ctrlSetText localize "STR_Medic_Respawn_2";
	sleep 5;
	if (!(alive _this) && !((_this) getVariable "Revive")) then
	{
		closeDialog 0;
		life_respawned = true;
		[] call life_fnc_spawnMenu;
	};
};

[] spawn life_fnc_deathScreen;

if(life_nlrtimer_running) then
{
life_nlrtimer_stop = true;
waitUntil {!life_nlrtimer_running};
};
[] spawn life_fnc_newLifeRule;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {
	if(vehicle _killer isKindOf "LandVehicle") then {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		//Get rid of this if you don't want automatic vehicle license removal.
		if(!local _killer) then {
			[[2],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	} else {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

		if(!local _killer) then {
			[[3],"life_fnc_removeLicenses",_killer,FALSE] spawn life_fnc_MP;
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	life_copRecieve = _killer;
	//Did I rob the federal reserve?
	if(!life_use_atm && {life_cash > 0}) then {
		[format[localize "STR_Cop_RobberDead",[life_cash] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_cash = 0;
	};

};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};


_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};
//add the weapon back here so it gets stored for if we get revived since im cheeky and this is easy lol.
_c = nearestObjects[position player,["WeaponHolderSimulated"],5];
[[_c,true],"life_fnc_hidecontainer",true,false] spawn life_fnc_MP;

// strip player and store gear for incase he gets revived.
switch(playerSide) do
{
	case civilian: {[] call life_fnc_civFetchGear;};
	case west: {[] call life_fnc_civFetchGear;cop_gear = civ_gear;};
	case independent: {0;}; // nothing for medics needed atm.
};
// strip the player of everything.
[] call life_fnc_stripDownPlayer;
life_rebel = license_civ_rebel;
life_rebMedic = license_civ_rebMedic;
life_rebSniper = license_civ_rebSniper;
life_rebExplosive = license_civ_rebExplosive;
life_rebGrenade = license_civ_rebGrenade;
life_rebGunner = license_civ_rebGunner;
life_rebChemical = license_civ_rebChemical;
if((side _killer == west && playerSide == civilian) && life_wanted >= 100000) then {
	// strip our rebel licenses
	license_civ_rebel = false;
	license_civ_rebMedic = false;
	license_civ_rebSniper = false;
	license_civ_rebExplosive = false;
	license_civ_rebGrenade = false;
	license_civ_rebGunner = false;
	license_civ_rebChemical = false;
};
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_cash = 0;
life_drink = 0;
[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

[] call SOCK_fnc_updateRequest;
