#include <macro.h>
/*
	File: fn_sellTurtle.sqf
	
	Description:
	Sells the turtles! Save the turtles!
	This was a super lazy thing to do but I just want to push it...
*/
private["_index","_price","_val"];
if(life_inv_dirtymoney == 0) exitWith {
	titleText["You don't have any Dirty money(s) to launder.","PLAIN"];
};

_index = ["dirtymoney",__GETC__(sell_array)] call fnc_index;
_price = (__GETC__(sell_array) select _index) select 1;
_val = life_inv_dirtymoney;
_price = _price * _val;

if([false,"dirtymoney",life_inv_dirtymoney] call life_fnc_handleInv) then {
	titleText[format["You laundered %1 Bits of Dirty Money(s) for $%2",_val,[_price] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _price;
};
