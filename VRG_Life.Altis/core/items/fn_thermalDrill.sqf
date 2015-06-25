private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if({side _x == west} count playableUnits < 7) exitWith {hint "Not enough cops online!"};
if(typeOf _vault != "Land_MetalCase_01_large_F") exitWith {hint "This can only be used at the Military Base"};
if(_vault getVariable["drillplaced",false]) exitWith {hint "Drill has already been placed!"};
if(_vault getVariable["mb_safe_open",false]) exitWith {hint "Military store is already open!"};
if(!([false,"thermaldrill",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault setVariable["drillplaced",true,true];
[[1,"A Thermal Drill has been placed on the Military Store!"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

hint "Now drilling...";
_handle = [] spawn life_fnc_demoChargeTimer3;
[[],"life_fnc_demoChargeTimer3",west,false] spawn life_fnc_MP;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(mb_vault getVariable["drillplaced",false])) exitWith {hint "Drill has been disarmed!"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL mb_vault select 0, getPosATL mb_vault select 1, (getPosATL mb_vault select 2)+0.5];
mb_vault setVariable["drillplaced",false,true];
mb_vault setVariable["mb_safe_open",true,true];

hint "Military store is open!";