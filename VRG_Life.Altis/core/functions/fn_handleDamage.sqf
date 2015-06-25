/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep","_vehSpeed","_isVehicle"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_vehSPeed = speed _unit;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};

//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"] && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then {
			if(side _source == west) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_556x45_dual") then {100} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				//_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};

				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle) then {
							if(_vehSPeed < 45) then
								{
								[_unit,_source] spawn life_fnc_tazed;
								};
						} else {
							[_unit,_source,false] spawn life_fnc_tazed;
						};
					};
				};
			};

			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
/*
// VDM check
	_isVehicle = if(vehicle _source != _source) then {true} else {false};
	if(_isVehicle) then
	{
		_damage = false;
		// add speed test to see if should be added to wanted list for vehicle manslaughter.
		_vehSPeed = speed _source;
		if(_vehSpeed > 20) then
		{
			_curtime = diag_tickTime;
			_savedtime = player getVariable["vdmtimer",0];
			if((_curtime - _savedtime) > 2 ) then
			{
				player setVariable["vdmtimer",_curtime];
				if(side _source != west && _source != _unit) then
				{
					[[getPlayerUID _source,_source getVariable["realname",name _source],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
					[[0,format["%1 was just run over by %2. what a cunt act",_unit getVariable["realname",name _unit],_source getVariable["realname",name _source]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				};
			};
		};
	};
*/	
};
[] call life_fnc_hudUpdate;
_damage;
