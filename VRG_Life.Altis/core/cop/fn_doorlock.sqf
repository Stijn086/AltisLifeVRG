private["_cas"];
_cas = nearestObject [[25902.5,21581.1,0],"Land_Offices_01_V1_F"];


if (playerSide == west) then
		{
		life_action_inUse = true;
		for "_i" from 3 to 4 do {_cas setVariable[format["bis_disabled_Door_%1",_i],1,true]; _cas animate [format["Door_%1_rot",_i],0];};
		hint "The Casino Vault Doors are fixed and re-secured.";
		} else 
		{
		hint "You need to be a Piggy Pig Pig to Repair the Casino Vault Doors";
		};

life_action_inUse = false;


