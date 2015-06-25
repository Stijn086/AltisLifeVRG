private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad entry!
if(!(typeOf _vehicle in ["C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_MRAP_01_F","O_MRAP_02_F","B_Heli_Light_01_F","B_Heli_Transport_03_unarmed_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_F"])) exitWith {};

_trueorfalse = _vehicle getVariable["lights",FALSE];

if(_trueorfalse) then {
    _vehicle setVariable["lights",FALSE,TRUE];
} else {
    _vehicle setVariable["emergencylights",TRUE,TRUE];
    [[_vehicle,0.22],"life_fnc_copLights",true,false] call life_fnc_MP;
}
