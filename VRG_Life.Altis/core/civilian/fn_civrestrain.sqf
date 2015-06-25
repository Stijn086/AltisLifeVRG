/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_civi","_player"];
_civi = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _civi) exitWith {};

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (3 * 60)};
		
		if(!(player getVariable["ziptied",FALSE])) exitWith {};
		if(!([civilian,getPos player,30] call life_fnc_nearUnits) && (player getVariable["ziptied",FALSE]) && vehicle player == player) exitWith {
			player setVariable["ziptied",FALSE,TRUE];
			player setVariable["Escorting",FALSE,TRUE];
			player setVariable["transporting",false,true];
			detach player;
			titleText["You have been released automatically for excessive restrainment time","PLAIN"];
		};
	};
};

titleText[format["You have been ziptied by %1",_civi getVariable["realname",name _civi]],"PLAIN"];
				
while {player getVariable "ziptied"} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "ziptied") || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["ziptied",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
	};
	
	if(!alive _civi) exitWith {
		player setVariable ["Escorting",false,true];
		detach player;
	};
	
	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

//disableUserInput false;
		
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};