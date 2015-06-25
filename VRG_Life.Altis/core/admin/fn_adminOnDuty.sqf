/*
	Date:			Func:			Exec: 
	01.01.2015      adminOnDuty 	call
		
	Desc: 
	Broadcasts an admin is on duty, gives them a virtual reality suit and gas mask as well as a range of 
	functions compensating for debug access. These commands are removed upon going off duty.
*/

#include <macro.h>
if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint "You are not an admin.";};

//Hope this works.. Syntax: [STRING: action name, CODE: action codeblock]
_actions = [
				["Repair",{cursorTarget setDamage 0;hint "Repaired";}],
				["Delete Vehicle",{deletevehicle cursortarget;hint "Deleted";}],
				["Repair Building",{_buildingarray = nearestObjects [(position player), ["static"], 100];  {    (nearestBuilding _x) setDamage 0;  } forEach _buildingarray;hint "Building Repaired";}],
				["Revive Player",{[[name player],"life_fnc_revived",cursorTarget,FALSE] spawn life_fnc_MP;hint "Player Revived";}],
				["Heal",{cursorTarget setDamage 0;hint "Target Healed";}],
				["Impound Vehicle",{[[cursorTarget,true,player],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;}],
				["Delete Hacked Vehicles",{[] call life_fnc_delSpawnedVeh;}]
			];

switch(life_onduty) do
{
	case true:
	{
		_suits = ["U_B_Protagonist_VR", "U_O_Protagonist_VR", "U_I_Protagonist_VR"];
		_suit = _suits select floor random count _suits;	
		player forceAddUniform _suit;	
		removeHeadgear player;
		player addHeadgear "H_CrewHelmetHeli_B";
		life_god = true;
		life_onduty = false;
		player allowDamage false;
		{
			_fscript = _x select 1;
			_fname = format["<t color='#F00FEC'>%1",(_x select 0)];
			_lifeaction = player addAction[_fname,_fscript];
			LIFE_Admin_Actions = LIFE_Admin_Actions + [_lifeaction];
		} forEach _actions;
		[[0,format["Admin %1 is now on duty.",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	};

	case false:
	{
		player forceAddUniform "U_O_FullGhillie_lsh";
		if(side player == civilian) then {removeHeadgear player};
		life_god = false;
		life_onduty = true;
		player allowDamage true;
		{
			player removeAction _x;
		} forEach LIFE_Admin_Actions;
		[[0,format["Admin %1 is now off duty.",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	};

	default {};
};
/*
	Notes:

			 I assume in forEach, _x is each element consecutively 
			 and if the element is an array, selection of 
			 subelements should be possible.
			 
			 So if: 
			 _x = _actions select 0:
			    _x select 0 == _actions select 0 select 0;
			    _x select 1 == _actions select 0 select 1;
			 _x = _actions select 1:
			    _x select 0 == _actions select 1 select 0;
			    _x select 1 == _actions select 1 select 1;
			 Etc.
*/

