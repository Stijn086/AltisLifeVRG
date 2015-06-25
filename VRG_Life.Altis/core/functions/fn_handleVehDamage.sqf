/*
  File: fn_handleVehDamage.sqf
  Author: Anthony "Zanven" Poschen

  Description:
  when a vehicle is spawned via garage. server tells all players to execute this file. which tells them to set the vehicle to use this for handling damage.
*/
private["_vehicle"];
_vehicle = _this select 0;
_vehicle addEventHandler["handleDamage",
{
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;


if(isNull _source) then { // palivo is fuel tank. bohemia why. just why cunts.
  if(_damage >= 0.9 && (_part == "" || _part == "palivo")) then
  {
    _veh = vehicle _unit;
    _damage = 0.85;
    _veh setHit ["wheel_1_1_steering", 1];
    _veh setHit ["wheel_1_2_steering", 1];
    _veh setHit ["wheel_1_3_steering", 1];
    _veh setHit ["wheel_1_4_steering", 1];   
    _veh setHit ["wheel_2_1_steering", 1];
    _veh setHit ["wheel_2_2_steering", 1];
    _veh setHit ["wheel_2_3_steering", 1];
    _veh setHit ["wheel_2_4_steering", 1];
    _veh setHit ["motor", 1];

  };
};
_damage;
}];

/*
-----------------------------------------
This script is usefull to print out every single part of a vehicle to the rpt log
so you can see the names of the parts and maybe change damage modifiers. i.e wheels or glass on ifirts??. 
just sit in vehicle and run the below script in debug console. 
then drive into a wall at a decent enough speed to do damage then open ur local rpt logs.
-----------------------------------------
(vehicle player) addEventHandler ["HandleDamage", {
	_v = _this select 0;
	if (alive _v) then {
		diag_log _this;
	} else {
		_v removeAllEventHandlers "HandleDamage";
		hintSilent "Vehicle destroyed. woops.";
	};
}];

*/