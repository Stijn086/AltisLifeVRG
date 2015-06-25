private["_uiDisp3","_time3","_timer3"];
disableSerialization;
7 cutRsc ["mb_timer","PLAIN"];
_uiDisp3 = uiNamespace getVariable "mb_timer";
_timer3 = _uiDisp3 displayCtrl 41401;
_time3 = time + (10 * 60);
while {true} do {
	if(isNull _uiDisp3) then {
		7 cutRsc ["mb_timer","PLAIN"];
		_uiDisp3 = uiNamespace getVariable "mb_timer";
		_timer3 = _uiDisp3 displayCtrl 41401;
	};
	if(round(_time3 - time) < 1) exitWith {};
	if(!(mb_vault getVariable["drillplaced",false])) exitWith {};
	_timer ctrlSetText format["%1",[(_time3 - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
7 cutText["","PLAIN"];