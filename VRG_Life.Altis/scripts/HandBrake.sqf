if (isNull player) exitwith {} ;

fn_HandBrake =
{
	_vcl = vehicle player;
	_speed = speed _vcl;
	if(_speed <= 2) exitWith {};
	_pitchBank = _vcl call bis_fnc_getPitchBank;
	if(_pitchBank select 1 > 10 || _pitchBank select 1 < -10) exitWith {};
	_modelVX = abs(velocityModelSpace _vcl select 0);
	_modelVY = abs(velocityModelSpace _vcl select 1);
	_modelVZ = velocityModelSpace _vcl select 2;
	_dir = direction _vcl;
	_velX = velocity _vcl select 0;
	_velY = velocity _vcl select 1;
	_velZ = velocity _vcl select 2;
	if(_modelVY > _modelVX) then
	{
		_vcl setVelocity [_velX - ((sin _dir * 2) * _modelVY/_speed),_velY - ((cos _dir * 2) * _modelVY/_speed),_velZ];
	}
	else
	{
		_vcl setVelocity [_velX - ((sin _dir / 5) * _modelVX/_speed),_velY - ((cos _dir / 5) * _modelVX/_speed),_velZ];
	};
	if(isOnRoad position _vcl) then
	{
		addCamShake [_speed/200, 0.2, 10];
	}
	else
	{
		addCamShake [_speed/150, 0.2, 50];
	};
};

dokeyDown={
	   private ["_r","_key_delay"] ;
        _key_delay  = 0.01;// MAX TIME BETWEEN KEY PRESSES 
     // player setvariable ["key",false];// ENABLE THIS LINE FOR SINGLE KEYPRESS BY REMOVING // AT THE START OF THE LINE
   _r = false ; 
	   if (player getvariable["key",true] and (_this select 1)  == 46) exitwith {player setvariable["key",false]; [_key_delay] spawn {sleep (_this select 0);player setvariable["key",true]; };_r};
	  if ((_this select 1)  == 29 and speed player >1) then {
	   if(vehicle player != player && vehicle player isKindOf "LandVehicle" && isTouchingGround vehicle player && driver vehicle player == player) then {
	   call fn_HandBrake;
   };
    _r=true;
      };
     _r;
} ;




waituntil {!(IsNull (findDisplay 46))};
(FindDisplay 46) displayAddEventHandler ["keydown","_this call dokeyDown"];  
