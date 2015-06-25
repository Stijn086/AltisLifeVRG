/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {"Unprocessed Oil"};
	case "life_inv_oilp": {"Processed Oil"};
	case "life_inv_poppies": {"Poppies"};
	case "life_inv_heroinp": {"Processed Heroin"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Apple"};
	case "life_inv_rabbit": {"Rabbit Meat"};
	case "life_inv_salema": {"Salema Meat"};
	case "life_inv_ornate": {"Ornate Meat"};
	case "life_inv_mackerel": {"Mackerel Meat"};
	case "life_inv_tuna": {"Tuna Meat"};
	case "life_inv_mullet": {"Mullet Meat"};
	case "life_inv_catshark": {"Cat Shark Meat"};
	case "life_inv_turtle": {"Turtle Meat"};
	case "life_inv_fishingpoles": {"Fishing Pole"};
	case "life_inv_water": {"Water Bottle"};
	case "life_inv_coffee": {"Coffee"};
	case "life_inv_turtlesoup": {"Turtle Soup"};
	case "life_inv_donuts": {"Donuts"};
	case "life_inv_fuelE": {"Empty Fuel Can"};
	case "life_inv_fuelF": {"Full Fuel Can"};
	case "life_inv_pickaxe": {"Pickaxe"};
	case "life_inv_copperore": {"Copper Ore"};
	case "life_inv_ironore": {"Iron Ore"};
	case "life_inv_ironr": {"Iron Ingot"};
	case "life_inv_copperr": {"Copper Ingot"};
	case "life_inv_sand": {"Sand"};
	case "life_inv_salt": {"Salt"};
	case "life_inv_saltr": {"Refined Salt"};
	case "life_inv_glass": {"Glass"};
	case "life_inv_diamond": {"Diamond Uncut"};
	case "life_inv_diamondr": {"Diamond Cut"};
	case "life_inv_tbacon": {"Tactical Bacon"};
	case "life_inv_redgull": {"RedGull"};
	case "life_inv_lockpick": {"Lockpick"};
	case "life_inv_peach": {"Peach"};
	case "life_inv_coke": {"Unprocessed Cocaine"};
	case "life_inv_cokep": {"Processed Cocaine"};
	case "life_inv_spikeStrip": {"Spike Strip"};
	case "life_inv_rock": {"Rock"};
	case "life_inv_cement": {"Cement Bag"};
	case "life_inv_goldbar": {"Gold Bar"};
	case "life_inv_silverbar": {"Silver Bar"};
	case "life_inv_blastingcharge": {"Blasting Charge"};
	case "life_inv_c4charge": {"C4 Charge"};
	case "life_inv_boltcutter": {"Bolt Cutter"};
	case "life_inv_defusekit": {"Bomb Defusal Kit"};
	case "life_inv_silverore": {"Silver Ore"};
	case "life_inv_meth": {"Methamphetamine"};
	case "life_inv_chemicals": {"Chemicals"};
	case "life_inv_uporn": {"Unedited Porn Tape"};
	case "life_inv_eporn": {"Edited Porn DVD"};
	case "life_inv_ergot": {"Ergot"};
	case "life_inv_lsd": {"LSD"};	
	case "life_inv_uranium": {"Uranium"};
	case "life_inv_uraniumWeap": {"Weaponised Uranium"};
	case "life_inv_uraniumMed": {"Medical RadioIsotopes"};
	case "life_inv_painkill": {"Pharmaceuticals"};
	case "life_inv_blooddiamond": {"Uncut Blood Diamond"};
	case "life_inv_zipties": {"zipties"};
	case "life_inv_ghammo": {"GhostHawk Ammo 200Rnds"};
	case "life_inv_thermaldrill": {"Thermal Drill"};
	case "life_inv_pow": {"Pile of Weapons"};




	case "life_inv_blooddiamondc": {"Cut Blood Diamond"};
	case "life_inv_uSnuff": {"Unedited Snuff Tape"};
	case "life_inv_eSnuff": {"Edited Snuff DVD"};
	case "license_civ_driver": {"Driver License"};
	case "license_civ_air": {"Pilot License"};
	case "license_civ_heroin": {"Heroin Training"};
	case "license_civ_gang": {"Gang License"};
	case "license_civ_oil": {"Oil Processing"};
	case "license_civ_dive": {"Diving License"};
	case "license_civ_boat": {"Boating License"};
	case "license_civ_gun": {"Firearm License"};
	case "license_cop_air": {"Pilot License"};
	case "license_cop_swat": {"Swat License"};
	case "license_cop_cg": {"Coast Guard"};
	case "license_civ_rebel": {"Rebel Training"};
	case "license_civ_truck": {"Truck License"};
	case "license_civ_diamond": {"Diamond Processing"};
	case "license_civ_copper": {"Copper Processing"};
	case "license_civ_iron": {"Iron Processing"};
	case "license_civ_sand": {"Sand Processing"};
	case "license_civ_salt": {"Salt Processing"};
	case "license_civ_coke": {"Cocaine Training"};
	case "license_civ_marijuana": {"Marijuana Training"};
	case "license_civ_cement": {"Cement Mixing License"};
	case "license_med_air": {"Pilot License"};
	case "license_civ_meth": {"Meth Training"};
	case "license_civ_eporn": {"Porn Editing"};
	case "license_civ_lsd": {"LSD License"};
	case "license_civ_rebMedic": {"Adv Rebel Medic Training"};
	case "license_civ_rebSniper": {"Adv Rebel Sniper Training"};
	case "license_civ_rebExplosive": {"Adv Rebel Explosive Training"};
	case "license_civ_rebGrenade": {"Adv Rebel Grenadier Training"};
	case "license_civ_rebGunner": {"Adv Rebel MachineGunner Training"};
	case "license_civ_rebChemical": {"Adv Rebel Chemical Training"};
	case "license_civ_uraniumWeap": {"Weaponised Uranium Training"};
	case "license_civ_uraniumMed": {"Medical RadioIsotope Training"};
	case "license_civ_bath": {"Bath Salt Training"};
	case "license_civ_painkill": {"Pharma Training"};
	case "license_civ_silver": {"Silver Training"};
	case "license_civ_blooddiamond": {"Blood Diamond License"};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_taxi": {"Taxi License"};
	case "license_civ_passport": {"Passport"};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_jimbeam": {"Jim Beam"};
	case "life_inv_beer": {"Beer"};
	case "life_inv_vodka": {"Vodka"};
	case "life_inv_dirtymoney": {"Dirty Money"};
};
