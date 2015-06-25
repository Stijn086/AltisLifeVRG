/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	case (_item == "thermaldrill"): {
	if(player distance mb_vault < 2) then {
		player reveal mb_vault;
		(group player) reveal mb_vault;
		[mb_vault] spawn life_fnc_thermalDrill;
		};
	};

	case (_item == "pow"): {
	if(([false,_item,1] call life_fnc_handleInv)) then {
		[] call life_fnc_POW;
		};
	};
	
		case (_item == "c4charge"): {
		player reveal cas_bank_1;
		(group player) reveal cas_bank_1;
		[cursorTarget] spawn life_fnc_C4Charge;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item == "heroinp"): {
		if (([false,_item, 1] call life_fnc_handleInv)) then {

			[] spawn life_fnc_useHeroin;

		};
	};
	
	case (_item == "marijuana"): {

		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo1";};
		
		if (([false,_item, 1] call life_fnc_handleInv)) then {

			[] spawn life_fnc_useMarijuana;
		};
	};
	case (_item == "cokep"): {

		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo1";};

		if (([false,_item, 1] call life_fnc_handleInv)) then {

			[] spawn life_fnc_useCocain;
		};
	};
	case (_item == "lsd"): {

		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo1";};

		if (([false,_item, 1] call life_fnc_handleInv)) then {

			[] spawn life_fnc_useLSD;
		};
	};
		case (_item =="vodka"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.04;
			if (life_drink < 0.01) exitWith {};
			[] spawn life_fnc_drinkvodka;
		};
	};
	
	case (_item =="jimbeam"):
	{
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.01) exitWith {};
			[] spawn life_fnc_drinkjimbeam;
		};
	};
	
	case (_item =="beer"):
	{
		
		if(playerSide in [west,independent]) exitWith {hint localize "STR_MISC_WestIndNoNo";};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			if(isNil "life_drink") then {life_drink = 0;};
			life_drink = life_drink + 0.02;
			if (life_drink < 0.01) exitWith {};
			[] spawn life_fnc_drinkbeer;
		};
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;