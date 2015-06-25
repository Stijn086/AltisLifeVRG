/*
	Date:			Func:				Auth:			Exec: 
	09.02.2015      delSpawnedVeh		mullsm0ke		call
		
	Desc: 
	Deletes all vehicles that have no ownership information such as those 
	spawned	in for an admin event or tanks and shit spawned in by hackers.
*/

_vehicles = vehicles;
{
	if((_x isKindOf "Car") or (_x isKindOf "Air")) then
	{
		_owners = _x getVariable "vehicle_info_owners";
		if(isNil {_owners}) then 
		{
			deleteVehicle _x;
		};   
	};		
} forEach _vehicles;

/*
	Server-sided on loop (every 5 minutes):

	while {true} do 
	{
		sleep 300;
		_vehicles = vehicles;
		{
			if((_x isKindOf "Car") or (_x isKindOf "Air")) then
			{
				_owners = _x getVariable "vehicle_info_owners";
				if(isNil {_owners}) then {deleteVehicle _x;};   
			};		
		} forEach _vehicles;
	};

	Exec:
	execVM, in server init
*/
