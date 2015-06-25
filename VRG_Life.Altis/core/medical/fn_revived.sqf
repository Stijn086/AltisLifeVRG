/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.
[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;


closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;
if(_medic != "Unknown Medic") then {
	//Take fee for services.
	hint format[localize "STR_Medic_RevivePay",_medic,[(call life_revive_fee)] call life_fnc_numberText];
	if(life_atmcash > (call life_revive_fee)) then {
		life_atmcash = life_atmcash - (call life_revive_fee);
	} else {
		life_atmcash = 0;
	};
};
//Retexturing of units clothing, vanilla files only retexture the EMS unit.
switch(playerSide) do {
	case independent: {[[player,0,"textures\medic_uniform1.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;};
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
hideBody life_corpse;

// give me back my gear cause being naked sucks
switch(playerside) do
{
	case civilian: {[] call life_fnc_civLoadGear;};
	case west: {[] call life_fnc_copLoadGear;};
	case independent: {life_fnc_medicLoadout;}; // nothing for medics needed atm.
};

//now give me back my gun :D.
_pos = position player;
_pos set [2,-10]; //offset to get our hidden gun.
_c = nearestObjects[_pos,["WeaponHolderSimulated"],5];
_w = ((getWeaponCargo (_c select 0)select 0)select 0); // gets the weapon name from the weaponholder (guarented to only being one hence all the select 0)
player action ["TakeWeapon",(_c select 0),_w]; // does the take action on the invisible container. add an if check to see if the cop has seized from dead body. or someshit u know

// gimmie my rebel shit back yo. cause fuck you.
license_civ_rebel = life_rebel;
license_civ_rebMedic = life_rebMedic;
license_civ_rebSniper = life_rebSniper;
license_civ_rebExplosive = life_rebExplosive;
license_civ_rebGrenade = life_rebGrenade;
license_civ_rebGunner = life_rebGunner;
license_civ_rebChemical = life_rebChemical;

player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
[] call life_fnc_hudUpdate; //Request update of hud.
[] call SOCK_fnc_updateRequest; // resync to server since u now have all ur shit back.
