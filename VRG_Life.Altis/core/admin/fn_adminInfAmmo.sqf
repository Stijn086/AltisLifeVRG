#include <macro.h>
if(__GETC__(life_adminlevel) < 5) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

[] spawn {
  while {dialog} do {
   closeDialog 0;
   sleep 0.01;
  };
};

if(life_ammo) then {
	titleText ["infinite ammountion disabled","PLAIN"]; titleFadeOut 2;
  player removeAllEventHandlers "fired";
  life_ammo = false;
  [[0,format["Admin %1 has disabled infinite ammo.",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
} else {
	titleText ["infinite ammountion enabled","PLAIN"]; titleFadeOut 2;
	player addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
  life_ammo = true;
	[[0,format["Admin %1 has enabled infinite ammo.",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
};
