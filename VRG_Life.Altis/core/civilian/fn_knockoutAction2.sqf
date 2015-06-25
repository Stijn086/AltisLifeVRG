
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
life_knockout = true;
[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
sleep 0.08;
[[_unit,profileName],"life_fnc_knockedOut2",false,false] spawn life_fnc_MP;

sleep 3;
life_knockout = false;