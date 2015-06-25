#inculde <macro.h>

if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

private["_uid", "_name"];
if((lbCurSel 1500) == -1) exitWith
{
    hint "Error: No player selected!";
};

_uid = lbData[1500,lbCurSel (1500)];
_name = lbText[1500,lbCurSel (1500)];

serverCommand format [ "#kick %1", _uid];

[[0,format["ADMIN: %1 Kicked.",_name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
hint format["%1 Kicked.", _name];
