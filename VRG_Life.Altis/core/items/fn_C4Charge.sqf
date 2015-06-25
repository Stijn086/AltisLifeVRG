

private["_vault2","_handle2"];
_vault2 = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if({side _x == west} count playableUnits < 12) exitWith {hint localize "STR_Civ_NotEnoughCops2"};
if(typeOf _vault2!= "Land_PaperBox_open_full_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault2 getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault2 getVariable["safe_open2",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(!([false,"c4charge",1] call life_fnc_handleInv)) exitWith {}; //Error?

_vault2 setVariable["chargeplaced",true,true];
[[1,localize "STR_ISTR_Blast_Placed2"],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
[[_vault2],"life_fnc_bankalarmsound",nil,true] spawn life_fnc_MP;
hint localize "STR_ISTR_Blast_KeepOff";
_handle2 = [] spawn life_fnc_demoChargeTimer2;
[[],"life_fnc_demoChargeTimer2",west,false] spawn life_fnc_MP;

waitUntil {scriptDone _handle2};
sleep 0.9;
if(!(cas_bank_1 getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL cas_bank_1 select 0, getPosATL cas_bank_1 select 1, (getPosATL cas_bank_1 select 2) -1.0];
cas_bank_1 setVariable["chargeplaced",false,true];
cas_bank_1 setVariable["safe_open2",true,true];
playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
hint localize "STR_ISTR_Blast_Opened";
