/* author: preller @ freudenhaus <codepreller@gmail.com>
* for Freudenhaus Altis Life
*
* radarTrap.sqf
* a simple script to check if a vehicle is faster then the legal maximum limit. If so it 
* puts the driver on the wanted list.
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 0: OBJECT - the radar trap
* _this select 1: INTEGER - radius of the radar trap in meter
* _this select 2: INTEGER - speedlimit
*
*/

private ["_radar_radius","_speed_limit","_SLEEP_TIME","_BOUNTY_ID_1","_SPEED_MESSUREMENT_FACTOR","_DEBUG_MODE","_targets","_vehicle_speed","_driver","_radar_delay","_speeder"];

//Parameter
_radar = _this select 0;
_radar_radius = _this select 1;
_speed_limit = _this select 2;

//Bounty IDs 
_BOUNTY_ID_1 = "205";

_SLEEP_TIME = 2.0; //in Sekunden

//Faktor mit dem die Originalgeschwindigkeit für die Berechnung des _radar_delay angepasst wird.
//Soll verhindern, dass ein Fahrzeuge an einer Radarfalle mehrmals geblitzt wird.
_SPEED_MESSUREMENT_FACTOR = 0.85;

_DEBUG_MODE = false;

//HINWEIS: -in der aktuellen Version werden nur positive Geschwindigkeiten gewertet. (e.G. -1 kmh wird nicht geblitzt).
while {true} do {
    _pos = getPosATL _radar;
    _targets = _pos nearEntities ["Car",_radar_radius];
	
	if (_DEBUG_MODE) then {
		_radar globalChat ".";
	};
	
	//Geschwindigkeit messen bei allen und Verstoesse melden.
	{
		_vehicle_speed = speed _x;
		if (_vehicle_speed > _speed_limit) then {
			_driver = driver _x;
						
			//nur Zivilisten blitzen WEST = polizei
			if (side _driver != west) then {
				//Zivilist
				if (_DEBUG_MODE) then {
					_radar globalChat str _driver;
				};
				
				//zivilisten auf die wantedlist setzen
				["life_fnc_MP_packet",[0,[getPlayerUID _driver,name _driver,_BOUNTY_ID_1],"life_fnc_wantedAdd",false,false]] spawn life_fnc_MPexec;
				
				sleep 5.0;
			} else {
				//Polizist
				if (_DEBUG_MODE) then {
					_radar globalChat "du solltest nen cop sein. und zu schnell!";
					
				};
			};
		};
	} forEach _targets;
	
	sleep _SLEEP_TIME;
}