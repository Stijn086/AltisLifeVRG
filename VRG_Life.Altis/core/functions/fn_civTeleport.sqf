disableSerialization;
LIFE_spCfg = [];
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
if(!(createDialog "life_spawn_selection")) exitWith {[] call life_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

_a = _this select 0;
switch (_a) do
{

	case "civ_don":
	{
		LIFE_spCfg = 
				 [
					["donor_kavala","Donor Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["donor_north","Donor Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["donor_airfield","Donor Airfield","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
				 ];
				 
		
	};
	case "civ_reb":
	{
		LIFE_spCfg = 
				 [
					["reb_spawn_1","Rebel North","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["reb_spawn_2","Rebel South West","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
					["reb_spawn_3","Rebel South East","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
				 ];
				
		
	};
	case "civ_hospital":
	{
		if((side player) == civilian) exitWith {LIFE_spCfg = [];};
		
			LIFE_spCfg = 
					[
						["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
						["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
						["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
						["medic_spawn_4","Sofia Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
					];
					
		
	};	
	default
	{
		hint "wat";
	};
};
_spCfg = LIFE_spCfg;
_ctrl = ((findDisplay 38500) displayCtrl 38510);
{
	_ctrl lnbAddRow[(_spCfg select _ForEachIndex) select 1,(_spCfg select _ForEachIndex) select 0,""];
	_ctrl lnbSetPicture[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 2];
	_ctrl lnbSetData[[_ForEachIndex,0],(_spCfg select _ForEachIndex) select 0];
} foreach _spCfg;

_sp = _spCfg select 0;

[((findDisplay 38500) displayCtrl 38502),1,0.1,getMarkerPos (_sp select 0)] call life_fnc_setMapPosition;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 1,localize "STR_Spawn_CSP"]];

