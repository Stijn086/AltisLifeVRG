/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "poppies": {"life_inv_poppies"};
			case "heroinp": {"life_inv_heroinp"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"life_cash"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "coke": {"life_inv_coke"};
			case "cokep": {"life_inv_cokep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "c4charge": {"life_inv_c4charge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "silverore": {"life_inv_silverore"};
			case "silverbar": {"live_inv_silverbar"};
			case "meth": {"life_inv_meth"};
			case "chemicals": {"life_inv_chemicals"};
			case "eporn": {"life_inv_eporn"};
			case "uporn": {"life_inv_uporn"};
			case "ergot": {"life_inv_ergot"};
			case "lsd": {"life_inv_lsd"};
			case "uranium": {"life_inv_uranium"};
			case "uraniumWeap": {"life_inv_uraniumWeap"};
			case "uraniumMed": {"life_inv_uraniumMed"};
			case "painkill": {"life_inv_painkill"};
			case "blooddiamond": {"life_inv_blooddiamond"};
			case "blooddiamondc": {"life_inv_blooddiamondc"};
			case "uSnuff": {"life_inv_uSnuff"};
			case "eSnuff": {"life_inv_eSnuff"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "zipties": {"life_inv_zipties"};
			case "bath": {""};
			case "jimbeam": {"life_inv_jimbeam"};
			case "beer": {"life_inv_beer"};
			case "vodka": {"life_inv_vodka"};
			case "ghammo": {"life_inv_ghammo"};
			case "dirtymoney": {"life_inv_dirtymoney"};
			case "thermaldrill": {"life_inv_thermaldrill"};
			case "pow": {"life_inv_pow"};
			
		};
	};

	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_poppies": {"poppies"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "life_cash": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_salt": {"salt"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_coke": {"coke"};
			case "life_inv_cokep": {"cokep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_silverore": {"silverore"};
			case "live_inv_silverbar": {"silverbar"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_c4charge": {"c4charge"}; 
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			//3.1.2
			case "life_inv_meth": {"meth"};
			case "life_inv_chemicals": {"chemicals"};
			case "life_inv_eporn": {"eporn"};
			case "life_inv_uporn": {"uporn"};
			case "life_inv_ergot": {"ergot"};
			case "life_inv_lsd": {"lsd"};
			//newshit
			case "life_inv_uranium": {"uranium"};
			case "life_inv_uraniumWeap": {"uraniumWeap"};
			case "life_inv_uraniumMed": {"uraniumMed"};
			case "life_inv_painkill": {"painkill"};
			case "life_inv_blooddiamond": {"blooddiamond"};
			case "life_inv_blooddiamondc": {"blooddiamondc"};
			case "life_inv_uSnuff": {"uSnuff"};
			case "life_inv_eSnuff": {"eSnuff"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_jimbeam": {"jimbeam"};
			case "life_inv_zipties": {"zipties"};
			case "life_inv_beer": {"beer"};
			case "life_inv_vodka": {"vodka"};
			case "life_inv_ghammo": {"ghammo"};
			case "life_inv_dirtymoney": {"dirtymoney"};
			case "life_inv_thermaldrill": {"thermaldrill"};
			case "life_inv_pow": {"pow"};
		};
	};
};
