#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",10000],
			["C_SUV_01_F",10000],
			["I_Truck_02_medical_F",25000],
			["O_Truck_03_medical_F",45000],
			["B_Truck_01_medical_F",60000],
			["C_Van_01_box_F",20000]
		];
	};
	
	case "med_air_hs": {
		_return = [
			["B_Heli_Light_01_F",50000],
			["O_Heli_Light_02_unarmed_F",75000],
			["O_Heli_Transport_04_medevac_F",95000] //Heli DLC

		];
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Hatchback_01_sport_F",55000],
			["C_Van_01_transport_F",40000]
		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",275000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",250000],
			["B_Truck_01_box_F",350000],
			["O_Truck_03_device_F",450000]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["B_Heli_Light_01_F",650000]
		];
		
		if(license_civ_rebel) then
		{
			//Simplifed the array creation since the other method seems to process incorrectly.
			_return =
			[
				["B_Quadbike_01_F",2500],
				["B_G_Offroad_01_F",15000],
				["B_Heli_Light_01_F",650000],
				["B_G_Offroad_01_armed_F",1000000],
				["O_Heli_Light_02_unarmed_F",2800000],
				["I_Heli_Transport_02_F",6500000],
				["B_Heli_Transport_01_camo_F",9000000],
				["I_MRAP_03_F",5500000],
				["O_MRAP_02_F",4000000],
			    ["B_Heli_Transport_03_unarmed_F",9500000],
				["B_APC_Tracked_01_rcws_F",1000000],
				["B_MRAP_01_hmg_F",7000000],
			    ["I_Plane_Fighter_03_AA_F",13000000]
			];
		};
	};
	
	case "cop_car":
	{
		_return set[count _return,
		["C_Offroad_01_F",5000]];
		_return set[count _return,
		["C_SUV_01_F",20000]];
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["C_Hatchback_01_sport_F",22500]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,
			["B_MRAP_01_F",30000]];
            _return set[count _return,["O_MRAP_02_F",50000]]; //ifrit
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",600000],
			["O_Heli_Light_02_unarmed_F",2200000]
		];
	};
	
	case "cop_air":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",100000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",250000]];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",500000]];
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",350000]];
			_return set [count _return,
			["B_Heli_Transport_03_F",800000]]; //Heli DLC

		};
	};
	
	case "cop_airhq":
	{
		_return set[count _return,
		["B_Heli_Light_01_F",100000]];
		_return set[count _return,
		["O_Heli_Light_02_unarmed_F",250000]];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,
			["B_Heli_Transport_01_F",500000]];
			_return set[count _return,
			["I_Heli_light_03_unarmed_F",350000]];
			_return set [count _return,
			["B_Heli_Transport_03_F",800000]]; //Heli DLC
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["I_Boat_Armed_01_minigun_F",8000000]];
		
		};
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_SDV_01_F",100000]
		];
		if (__GETC__(life_coplevel) > 4) then
		{
		_return set[count _return,
		["B_Boat_Armed_01_minigun_F",75000]];
		};
	};


//3.1.2 MIGRATION
	

    case "donator_shop":
    {
            _return =
            [
                    ["B_Quadbike_01_F",500],
                    ["C_Offroad_01_F",2500],
                    ["C_SUV_01_F",20000],
                    ["C_Kart_01_F",30000]
            ];
     
		if(__GETC__(life_donator) == 1) then
		{
			_return set[count _return,["C_Hatchback_01_F",7000]];
			_return set[count _return,["C_Hatchback_01_sport_F",10000]];
			_return set[count _return,["C_Van_01_box_F",37000]];
			_return set[count _return,["I_Truck_02_covered_F",140000]];
			_return set[count _return,["B_Truck_01_medical_F",350000]];
			_return set[count _return,["B_Truck_01_box_F",380000]];
			_return set[count _return,["B_Heli_Light_01_F",550000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",2200000]];
			_return set[count _return,["I_MRAP_03_F",4000000]]; 
			_return set[count _return,["O_MRAP_02_F",3200000]];
		};
		if(__GETC__(life_donator) == 2) then
		{
			_return set[count _return,["C_Hatchback_01_F",6000]];
			_return set[count _return,["C_Hatchback_01_sport_F",8000]];
			_return set[count _return,["C_Van_01_box_F",35000]];
		    _return set[count _return,["I_Truck_02_covered_F",135000]];
			_return set[count _return,["B_Truck_01_medical_F",330000]];
			_return set[count _return,["B_Truck_01_box_F",350000]];
            _return set[count _return,["B_Heli_Light_01_F",500000]];		
		    _return set[count _return,["O_Heli_Light_02_unarmed_F",2000000]];
			_return set[count _return,["I_Heli_Transport_02_F",4600000]];
			_return set[count _return,["I_MRAP_03_F",3800000]];
			_return set[count _return,["O_MRAP_02_F",3066667]];
		};
		if(__GETC__(life_donator) == 3) then
		{
			_return set[count _return,["C_Hatchback_01_F",5000]];
			_return set[count _return,["C_Hatchback_01_sport_F",6000]];
			_return set[count _return,["C_Van_01_box_F",32000]];
		    _return set[count _return,["I_Truck_02_covered_F",120000]];
			_return set[count _return,["B_Truck_01_medical_F",310000]];
			_return set[count _return,["B_Truck_01_box_F",320000]];
			_return set[count _return,["B_Heli_Light_01_F",450000]];
			_return set[count _return,["I_Heli_Transport_02_F",4400000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",1800000]];
			_return set[count _return,["I_MRAP_03_F",3600000]];
			_return set[count _return,["O_MRAP_02_F",2933334]];
		};
		if(__GETC__(life_donator) == 4) then
		{
			_return set[count _return,["C_Hatchback_01_F",4000]];
			_return set[count _return,["C_Hatchback_01_sport_F",5000]];
			_return set[count _return,["C_Van_01_box_F",30000]];
			_return set[count _return,["I_Truck_02_covered_F",100000]];
			_return set[count _return,["B_Truck_01_medical_F",270000]];
			_return set[count _return,["B_Truck_01_box_F",300000]];
			_return set[count _return,["B_Heli_Light_01_F",400000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",1600000]];
			_return set[count _return,["I_Heli_Transport_02_F",4200000]];
			_return set[count _return,["B_Heli_Transport_01_camo_F",5200000]];
			_return set[count _return,["I_MRAP_03_F",3500000]];
			_return set[count _return,["O_MRAP_02_F",2800000]];
		};
		if(__GETC__(life_donator) == 5) then
		{
			_return set[count _return,["C_Hatchback_01_F",3000]];
			_return set[count _return,["C_Hatchback_01_sport_F",5000]];
			_return set[count _return,["C_Van_01_box_F",30000]];
		    _return set[count _return,["I_Truck_02_covered_F",100000]];
			_return set[count _return,["B_Truck_01_medical_F",270000]];
			_return set[count _return,["B_Truck_01_box_F",300000]];
			_return set[count _return,["B_Heli_Light_01_F",350000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",1500000]];
			_return set[count _return,["I_Heli_Transport_02_F",4000000]];
			_return set[count _return,["B_Heli_Transport_01_camo_F",5000000]];
			_return set[count _return,["I_MRAP_03_F",2850000]]; //Strider
			_return set[count _return,["O_MRAP_02_F",2666667]]; //Ifrit
			_return set[count _return,["B_Heli_Transport_03_unarmed_F",6500000]]; //Heli DLC

		};
	};
};
_return; // somefuckwit forgot to return the result. >.> looks at unclerifle... 

