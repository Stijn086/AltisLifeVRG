/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {4};
	case "oilp": {3};
	case "poppies": {6};
	case "heroinp": {4};
	case "cannabis": {4};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "coke": {6};
	case "cokep": {4};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "silverore": {5};
	case "silverbar": {3};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "c4charge": {15};
	case "thermaldrill": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "meth": {4};
	case "chemicals": {6};
	case "uporn": {3};
	case "eporn": {2};
	case "uSnuff": {3};
	case "eSnuff": {2};
	case "ergot": {5};
	case "lsd": {4};
	case "uranium": {6};
	case "uraniumWeap": {4};
	case "uraniumMed": {4};
	case "painkill": {4};
	case "blooddiamond": {4};
	case "blooddiamondc": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "zipties": {1};
	case "dirtymoney": {6};
	case "ghammo": {25};
	case "pow": {10};
	default {1};
};
