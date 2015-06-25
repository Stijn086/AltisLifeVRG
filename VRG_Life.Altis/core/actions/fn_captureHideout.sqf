#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
			mullsm0ke
	
	Description:
	Blah blah.

	Added some shit to support the Extortion feature.
*/
private["_group","_hideout","_action","_cpRate","_cP","_progressBar","_title","_titleText","_ui","_flagTexture","_gangName","_location"];
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
_group = _hideout getVariable ["gangOwner",grpNull];
_location = _this select 3;

if(isNil {grpPlayer getVariable "gang_name"}) exitWith {titleText["You must create a gang first before capturing it!","PLAIN"];};
if(_group == grpPlayer) exitWith {titleText["Your gang already has control over this hideout!","PLAIN"]};
if((_hideout getVariable ["inCapture",FALSE])) exitWith {hint"Only one person shall capture at once";};
if(!isNull _group) then {
	_gangName = _group getVariable ["gang_name",""];
	_action = [
		format["This hideout is controlled by %1<br/>Are you sure you want to take over their gang area?",_gangName],
		"Hideout is currently under control..",
		"Yes",
		"No"
	] call BIS_fnc_guiMessage;

	_cpRate = 0.0045;
	[[1,format["%1 and his gang: %2 are attempting to retake a local hideout",name player,(group player) getVariable "gang_name"]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
} else {
	_cpRate = 0.0075;
};

if(!isNil "_action" && {!_action}) exitWith {titleText["Capturing cancelled","PLAIN"];};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Capturing Hideout...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;
/*
Since controlling a gang hideout is going to become much more important, include
alerting of current controlling gang members so they can respond.
*/
if(!isNull _group) then 
{
	switch (_location) do 
	{
		case "Kavala":
		{
			_gangname = (group player) getVariable "gang_name";
			_text = format["Your %1 hideout is being captured by %2!",_location,_gangname]; 
			[[1,_text],"life_fnc_broadcast",_group,false] spawn life_fnc_MP;
		};
		case "Athira":
		{
            _gangname = (group player) getVariable "gang_name";
			_text = format["Your %1 hideout is being captured by %2!",_location,_gangname]; 
			[[1,_text],"life_fnc_broadcast",_group,false] spawn life_fnc_MP;		
		};
		case "Pyrgos":
		{
			_gangname = (group player) getVariable "gang_name";
			_text = format["Your %1 hideout is being captured by %2!",_location,_gangname]; 
			[[1,_text],"life_fnc_broadcast",_group,false] spawn life_fnc_MP;		
		};
	};
};

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	_hideout setVariable["inCapture",true,true];
	if(_cP >= 1 OR !alive player) exitWith {_hideout setVariable["inCapture",false,true];};
	if(life_istazed) exitWith {_hideout setVariable["inCapture",false,true];}; //Tazed
	if(life_interrupted) exitWith {_hideout setVariable["inCapture",false,true];};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action cancelled","PLAIN"]; life_action_inUse = false;_hideout setVariable["inCapture",false,true];};
life_action_inUse = false;

titleText["Hideout has been captured.","PLAIN"];
_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
	] call BIS_fnc_selectRandom;
_this select 0 setFlagTexture _flagTexture;
//_gangName = _group getVariable ["gang_name",""];
[[1,format["%1 and his gang: %2 - have taken control of a local hideout",name player,(group player) getVariable "gang_name" ]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_hideout setVariable["inCapture",false,true];
_hideout setVariable["gangOwner",grpPlayer,true];
/*
Functionality for extortion payments. 20% of sale/purchase price is awarded to the 
controlling gang in the form of a direct deposit to their gang bank.
Hoping to integrate:
	-Car shops DONE
	-Chop shops DONE
	-Weapon stores
	-Maybe create some "Pokie" style venues in towns which will also generate income for clans/crime families
*/
switch (_location) do 
{
	case "Kavala":
	{
		_cuts = [Dealer_1, medical_items_trader, diamond_trader_kav1, market_kav1, genstore_kav1, clothingstore_kav1, carshop1, carshop1_2,chopshop_kav1];
		{
			_x setVariable["controlled_by",grpPlayer,true];
		} forEach _cuts;
	};
	case "Athira":
	{
		_cuts = [Dealer_2, market_ath1, clothingstore_ath1, carshop_ath2, chopshop_north1, chopshop_sof1];
		{
			_x setVariable["controlled_by",grpPlayer,true];
		} forEach _cuts;
	};
	case "Pyrgos":
	{
		_cuts = [Dealer_3, weaponised_dealer1, market_pyr1, genstore_pyr1, carshop2_pyr1, carshop_pyr1, chopshop_pyr1];
		{
			_x setVariable["controlled_by",grpPlayer,true];
		} forEach _cuts;
	};
};