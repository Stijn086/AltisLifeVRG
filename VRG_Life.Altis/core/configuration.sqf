#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_god = false;
LIFE_spCfg = [];
LIFE_Admin_Actions = [];
martial_law_active = false;
life_frozen = false;
life_markers = false;
life_ammo = false;
life_wanted = 0;
life_drink = 0;
life_nlrtimer_stop = false;
life_nlrtimer_running = false;
life_fadeSound = false;
life_calledTaxi = false;
life_isOnDutyTaxi = false;
life_inTaxi = false;

//cause im lazy and tired have extra vars for rebel stuff. maybe make array one day and not be lazy.
life_rebel = false;
life_rebMedic = false;
life_rebSniper = false;
life_rebExplosive = false;
life_rebGrenade = false;
life_rebGunner = false;
life_rebChemical = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for civs and cops? (Medics excluded for now)

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,10000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,3); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,50000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,4.5); //BLAH
__CONST__(life_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System
//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Food Variables *******
*****************************
*/
life_eat_Salema = 40;
life_eat_Ornate = 20;
life_eat_Mackerel = 20;
life_eat_Tuna = 100;
life_eat_Mullet = 30;
life_eat_CatShark = 60;
life_eat_Rabbit = 20;
life_eat_Apple = 5;
life_eat_turtlesoup = 62;
life_eat_donuts = 30;

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
life_god = false;
life_onduty = true;
life_frozen = false;
life_markers = false;
life_ammo = false;
__CONST__(life_paycheck_period,5); //minutes
life_cash = 0;
__CONST__(life_impound_car,850);
__CONST__(life_impound_boat,500);
__CONST__(life_impound_air,2500);
life_istazed = false;
life_my_gang = ObjNull;
life_gangid = 0;
player setVariable["ziptied",false,true];
life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		life_atmcash = 500000; //Starting Bank Money
		life_paycheck = 1000; //Paycheck Amount
        life_bleedout_timer = 2.1; //Scaled in minutes
	};
	case civilian:
	{
		life_atmcash = 500000; //Starting Bank Money
		life_paycheck = 1150; //Paycheck Amount
        life_bleedout_timer = 1.5; //Scaled in minutes
	};

	case independent: {
		life_atmcash = 500000;
		life_paycheck = 2000;
        life_bleedout_timer = 0; //Scaled in minutes
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_poppies",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_c4charge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_meth",
	"life_inv_chemicals",
	"life_inv_uporn",
	"life_inv_eporn",
	"life_inv_ergot",
	"life_inv_lsd",
	"life_inv_silverore",
	"life_inv_silverbar",
	"life_inv_uranium",
	"life_inv_uraniumWeap",
	"life_inv_uraniumMed",
	"life_inv_painkill",
	"life_inv_blooddiamond",
	"life_inv_blooddiamondc",
	"life_inv_uSnuff",
	"life_inv_eSnuff",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_zipties",
	"life_inv_thermaldrill",
	"life_inv_pow",

	"life_inv_jimbeam",
	"life_inv_beer",
	"life_inv_vodka",
	"life_inv_dirtymoney"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_rebMedic","civ"],
	["license_civ_rebSniper","civ"],
	["license_civ_rebExplosive","civ"],
	["license_civ_rebGrenade","civ"],
	["license_civ_rebGunner","civ"],
	["license_civ_rebChemical","civ"],
	["license_civ_meth","civ"],
	["license_civ_eporn","civ"],
	["license_civ_snuff","civ"],
	["license_civ_lsd","civ"],
	["license_civ_uraniumWeap","civ"],
	["license_civ_uraniumMed","civ"],
	["license_civ_bath","civ"],
	["license_civ_painkill","civ"],
	["license_civ_silver","civ"],
	["license_civ_blooddiamond","civ"],
	["license_civ_home","civ"],
	["license_civ_taxi","civ"],
	["license_civ_passport","civ"]
	
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["uSnuff",3000],["eSnuff",4500],["chemicals",7000],["heroinp",2500],["coke",1500],["cokep",3500],["marijuana",2000],["turtle",15000],["lsd",6200],["uporn",2500],["eporn",3500],["meth",10000],["uraniumWeap",10000],["bath",9000],["blooddiamond",6000],["blooddiamondc",8000],["blastingcharge",10000],["boltcutter",500],["c4charge",10000],["thermaldrill",10000],["pow",15000],["goldbar",21000]];


/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",60],
	["poppies",3300],
	["heroinp",6000],
	["salema",5000],
	["ornate",5000],
	["mackerel",10000],
	["tuna",20000],
	["mullet",12500],
	["catshark",20000],
	["rabbit",65],
	["oilp",46000],
	["turtle",9000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2200],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["coke",2950],
	["cokep",6300],
	["diamond",1750],
	["diamondc",3500],
	["iron_r",2800],
	["copper_r",1700],
	["salt_r",1500],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",95000],
	["silverbar",7000],
	["eporn",2850],
	["lsd",3550],
	["meth",6050],
	["uranium",2000],
	["uraniumWeap",8750],
	["uraniumMed",4800],
	["painkill",5300],
	["chemicals",6600],
	["blooddiamond",5000],
	["blooddiamondc",7500],
	["bath",9000],
	["eporn",2950],
	["eSnuff",2950],
	["jimbeam",250],
	["beer",250],
	["vodka",250],
	["pow",115000],
	["dirtymoney",150000]
];
__CONST__(sell_array,sell_array);

buy_array =
[
	["apple",65],
	["rabbit",75],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",1000],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["c4charge",70000],
	["thermaldrill",50000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["zipties",10000],
	["jimbeam",250],
	["beer",250],
	["vodka",250]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0],
	["hgun_Pistol_heavy_01_MRD_F",nil,0],
	["11Rnd_45ACP_Mag",nil,0],
	["hgun_Rook40_F",nil,0],
	["16Rnd_9x21_Mag",nil,0],
	["30Rnd_9x21_Mag",nil,0],
	["hgun_Pistol_heavy_02_F",nil,0],
	["6Rnd_45ACP_Cylinder",nil,0],
	["hgun_ACPC2_F",nil,0],
	["9Rnd_45ACP_Mag",nil,0],
	["arifle_TRG20_F",nil,0],
	["30Rnd_556x45_Stanag",nil,0],
	["arifle_Katiba_F",nil,0],
	["30Rnd_65x39_caseless_green",nil,0],
	["srifle_DMR_01_F",nil,0],
	["10Rnd_762x51_Mag",nil,0],
	["arifle_SDAR_F",nil,0],
	["20Rnd_556x45_UW_mag",nil,0],
	["arifle_MX_SW_F",nil,0],
	["100Rnd_65x39_caseless_mag_Tracer",nil,0],
	["srifle_EBR_F",nil,0],
	["20Rnd_762x51_Mag",nil,0],
	["SMG_01_F",nil,0],
	["30Rnd_45ACP_Mag_SMG_01",nil,0],
	["srifle_GM6_F",nil,0],
	["5Rnd_127x108_Mag",nil,0],
	["5Rnd_127x108_APDS_Mag","TruckStopper",0],
	["srifle_LRR_F",nil,0],
	["7Rnd_408_Mag",nil,0],
	["optic_SOS",nil,0],
	["optic_DMS",nil,0],
	["optic_NVS",nil,0],
	["optic_ACO_grn",nil,0],
	["optic_Holosight",nil,0],
	["acc_flashlight",nil,0],
	["optic_Hamr",nil,0],
	["optic_Arco",nil,0],
	["muzzle_snds_H",nil,0],
	["muzzle_snds_L",nil,0],
	["muzzle_snds_M",nil,0],
	["muzzle_snds_B",nil,0],
	["NVGoggles",nil,0],
	["FirstAidKit",nil,0],
	["ToolKit",nil,0],
	["H_HelmetB_camo",nil,0],
	["U_O_GhillieSuit",nil,0],
	["V_TacVest_oli",nil,0],
	["U_IG_Guerilla1_1",nil,0],
	["U_I_G_Story_Protagonist_F",nil,0],
	["U_I_G_resistanceLeader_F",nil,0],
	["U_O_PilotCoveralls",nil,0],
	["U_IG_leader","Guerilla Leader",0],
	["U_B_SpecopsUniform_sgg",nil,0],
	["U_O_CombatUniform_oucamo",nil,0],
	["U_O_SpecopsUniform_ocamo",nil,0],
	["H_ShemagOpen_tan",nil,0],
	["H_Shemag_olive",nil,0],
	["H_ShemagOpen_khk",nil,0],
	["H_HelmetO_ocamo",nil,0],
	["H_MilCap_oucamo",nil,0],
	["H_Bandanna_camo",nil,0],
	["B_Carryall_oli",nil,0],
	["V_TacVest_oli",nil,0],
	["B_Carryall_oli",nil,0],
	["DemoCharge_Remote_Mag","IED",0],
	["V_HarnessOGL_brn","Suicide Vest",0],
	["LMG_Zafir_F",nil,0],
    ["150Rnd_762x51_Box_Tracer",nil,0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",1000],
	["C_Hatchback_01_F",1000],
	["C_Offroad_01_F",1000],
	["B_G_Offroad_01_F",1000],
	["C_SUV_01_F",1000],
	["C_Van_01_transport_F",1000],
	["C_Hatchback_01_sport_F",1000],
	["C_Van_01_fuel_F",1000],
	["I_Heli_Transport_02_F",3000],
	["C_Van_01_box_F",1000],
	["I_Truck_02_transport_F",1000],
	["I_Truck_02_covered_F",1000],
	["B_Truck_01_transport_F",1000],
	["B_Truck_01_box_F",1000],
	["O_MRAP_02_F",1000],
	["B_Heli_Light_01_F",3000],
	["O_Heli_Light_02_unarmed_F",3000],
	["C_Rubberboat",1000],
	["C_Boat_Civil_01_F",1000],
	["B_Boat_Transport_01_F",1000],
	["C_Boat_Civil_01_police_F",1000],
	["B_Boat_Armed_01_minigun_F",1000],
	["B_SDV_01_F",1000],
	["B_MRAP_01_F",1000],
	["O_Truck_03_device_F",1000],
	["O_Truck_03_transport_F",1000],
	["O_Truck_03_transport_F",1000],
	["O_Truck_03_covered_F",1000],
	["B_Heli_Transport_01_camo_F",350000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",300],
	["C_Hatchback_01_F",2000],
	["C_Offroad_01_F", 2000],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",2500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",1250000],
	["C_Van_01_box_F",20000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["B_Heli_Light_01_F",57000],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_MRAP_01_F",10000],
	["I_MRAP_03_F",2000000],
	["O_Truck_03_device_F",100000],
	["O_Truck_03_transport_F",100000],
	["O_Truck_03_covered_F",125000],
	["B_Heli_Transport_01_camo_F",2000000]
];
__CONST__(life_garage_sell,life_garage_sell);

life_waypoints = [
    [
        /* Illegal Gathering */
        "chemical_1",
        "cocaine_1",
        "coke_area",
        "blooddiamond_1",
        "heroin_1",
        "porn_1",
        "Rye_1",
        "turtle_1_name",
        "turtle_1_name_1",
        "turtle_1_name_2",
        "turtle_1",
        "turtle_2",
        "turtle_3",
        "weed_1",
        "weed_area_1"
    ],
    [
        /* Illegal Processing */
        "cocaine_processing",
        "dimond_1",
        "heroin_p",
        "icee",
        "LSD Lab",
        "snuffedit_1",
        "weed_p_1"
    ],
    [
        /* Illegal Dealer */
        "Dealer_1",
        "Dealer_1_3",
        "Dealer_1_4",
        "gold_bar_dealer",
        "turle_dealer",
        "Weaponsgradedealer"
    ],
    [
        /* Legal Gathering */
        "apple_1",
        "apple_2",
        "apple_3",
        "apple_4",
        "diamond_1",
        "dp_missions",
        "iron_1",
        "lead_1",
        "oil_1",
        "oil_2",
        "peaches_1",
        "peaches_2",
        "peaches_3",
        "salt_1",
        "UraniumMine"
    ],
    [
        /* Legal Processing */
        "copper_mine_1",
        "cocaine processing",
        "diamondproc",
        "iron_processing",
        "OilP",
        "Pharm_p_1",
        "Salt",
        "uraniumr_1"
    ],
    [
        /* Legal Trader */
        "oil_trader",
        "oil_trader_1",
        "oil_trader_2",
        "oil_trader_4",
        "radio_trader_1"
    ],
    [
        /* Gas stations */
        "Gas1",
        "Gas2",
        "Gas3",
        "Gas4",
        "Gas5",
        "Gas6"
    ],
    [
        /* Markets and General Stores and DMV and Outfits and diving shops */
        "dive_shop",
        "dive_shop_1",
        "donor_airfield",
        "donor_kavala",
        "donor_north",
        "fish_market_1",
        "Gen",
        "Gen_2",
        "Gen_2_1",
        "Gen_2_1_1",
        "Gen_2_2",
        "Gen_2_2_1",
        "Gen_3",
        "Gen_3_1",
        "Gen_3_1_1",
        "Gen_3_1_1_1",
        "Gen_3_1_1_1_1",
        "Gen_3_1_1_2",
        "Gen_3_1_1_3",
        "Gen_3_1_1_3_1",
        "Gen_3_1_1_3_1_1",
        "Gen_3_1_3",
        "Gen_3_2",
        "Gen_3_3",
        "Gen_3_4",
        "Gen_3_4_1",
        "Gen_4",
        "Gen_5",
        "gun_store_1",
        "license_shop",
        "license_shop_1",
        "license_shop_2",
        "license_shop_2_1"
    ],
    [
        /* Chop Shops and vehicle spawns */
        "airshop",
        "boat_2",
        "boat_2_1",
        "boat_2_1_1",
        "car1",
        "car1_1",
        "car1_2",
        "car1_2_1_1",
        "car_civ_prygos1",
        "car_civ_prygos1_1",
        "car_civ_prygos1_1_1",
        "civ_g_1",
        "civ_gar_1",
        "civ_gar_1_1",
        "civ_gar_1_2",
        "civ_gar_1_3",
        "civ_ship_1",
        "civ_ship_2",
        "civ_ship_2_1",
        "civ_ship_2_1_1",
        "civ_ship_2_1_1_1",
        "civ_ship_3",
        "civ_truck_shop1",
        "civ_truck_shop1_1",
        "civ_truck_shop1_1_1",
        "civ_truck_shop1_1_2",
        "chop_shop_1",
        "chop_shop_2",
        "chop_shop_3",
        "chop_shop_4",
        "civ_gar_1_2",
        "car_r_gaticon",
        "chop_shop_4",
        "chop_shop_3",
        "kart_shop_text_1"
    ],
    [
        /* Freight Yard's */
        "Charkia Freight Yard",
        "Charkia Freight Yard_1",
        "Kavala Freight Yard_1_1",
        "Kavala Freight Yard_1_1_1",
        "Kavala Freight Yard_1_1_1_1_1",
        "Kavala Freight Yard_1_1_1_1_1_1",
        "Lakka Freight Yard_1",
        "Zaros Freight Yard_1_1_1"
    ],
    [
        /* Misc */
        "7News_1",
        "air_serv_1",
        "Night Club",
        "Reb_Casino_Marker_2",
        "Shooting Range",
        "ThunderCunt"
    ]
];

// gun store

// car shop sofia BROKEN        car1_1
// channel 7 news BROKEN        7News_1
// aggelochori freight BROKEN   Charkia Freight Yard_1
