/*
	File: fn_pickupMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Picks up money
*/
if((time - life_action_delay) < 1.5) exitWith {
	hint "You can't rapidly use action keys!";
	if(!isNil {(_this select 0) getVariable "inUse"}) then {
		_this select 0 setVariable["inUse",false,true];
	};
};
private["_obj","_val", "_cashthreshold"];
_cashthreshold = 5000000;
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_val = (_obj getVariable "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 3) exitWith {if(!isNull _obj) then {_obj setVariable["inUse",false,true];};};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;}; //Object was already picked up.
_obj setVariable["PickedUp",TRUE,TRUE];
if(!isNil {_val}) then
{
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	
	//Stop people picking up huge values of money which should stop spreading dirty money.
	switch (true) do
	{
		case (_val > _cashthreshold ) : {_val = _cashthreshold + (_val - _cashthreshold) * 0.5;}; // _val = 5m + 0.5 * remaining cash. (so u keep up to 5m then half of every dollar above that.)
		default {};
	};
	
	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText[format[localize "STR_NOTF_PickedMoney",[_val] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _val;
	life_action_delay = time;
};