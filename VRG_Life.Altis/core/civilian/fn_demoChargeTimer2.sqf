/*
	READ THE FILE NAME!
*/
private["_uiDisp2","_timer2","_time2"];
disableSerialization;
7 cutRsc ["cas_timer","PLAIN"];
_uiDisp2 = uiNamespace getVariable "cas_timer";
_timer2 = _uiDisp2 displayCtrl 39401;
_time2 = time + (5 * 60);
while {true} do {
	if(isNull _uiDisp2) then {
		7 cutRsc ["cas_timer","PLAIN"];
		_uiDisp2 = uiNamespace getVariable "cas_timer";
		_timer2 = _uiDisp2 displayCtrl 39401;
	};
	if(round(_time2 - time) < 1) exitWith {};
	if(!(cas_bank_1 getVariable["chargeplaced",false])) exitWith {};
	_timer2 ctrlSetText format["%1",[(_time2 - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
	sleep 0.08;
};
7 cutText["","PLAIN"];