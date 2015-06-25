#inculde <macro.h>
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

[[name player],"life_fnc_revived",cursorTarget,FALSE] spawn life_fnc_MP;
[[0,format["Admin %1 has revived a player.",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;

