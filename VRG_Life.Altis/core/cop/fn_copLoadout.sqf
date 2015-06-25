#include <macro.h>
/*
	File: fn_copLoadout.sqf
	Author: Anthony "Zanven" Poschen , Thomas "teKS" Ryan 
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear. for their cop level
*/
// strip the player
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

if(hmd player != "") then {
	player unlinkItem (hmd player);
};

switch(__GETC__(life_coplevel)) do {
	case 0: { // pub cop scum >.< maybe make them a pub cop uniform???
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";	
	};
	
	case 1: {
	player addUniform "U_Rangemaster";
	player addVest "V_Rangemaster_belt";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";	
	};
	
	case 2: {
	player addUniform "U_Rangemaster";
	player addVest "TacVest_blk_POLICE";
	player addHeadgear "H_Booniehat_mcamo";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";	
	};
	
	case 3: {
	player addUniform "U_Rangemaster";
	player addVest "TacVest_blk_POLICE";
	player addHeadgear "H_CrewHelmetHeli_B";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";	
	};
	
	case 4: {
	player addUniform "U_B_CombatUniform_mcam_worn";
	player addVest "TacVest_blk_POLICE";
	player addHeadgear "H_CrewHelmetHeli_B";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	};
	
	case 5: {
	player addUniform "U_B_CombatUniform_mcam_worn";
	player addVest "TacVest_blk_POLICE";
	player addHeadgear "H_CrewHelmetHeli_B";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	};
	
	case 6: {
	player addUniform "U_B_CombatUniform_mcam_worn";
	player addVest "TacVest_blk_POLICE";
	player addHeadgear "H_CrewHelmetHeli_B";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";	
	};
	
	case 7: {
	player addUniform "U_B_CombatUniform_mcam_worn";
	player addVest "TacVest_blk_POLICE";
	player addHeadgear "H_Beret_Colonel";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";	
	
	};
};
	
[] call life_fnc_saveGear;