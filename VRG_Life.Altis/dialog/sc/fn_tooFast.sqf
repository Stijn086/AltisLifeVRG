

	thisprice = 5000;
	_speed = speed player;
			if (jamiesaysstop == "0") do {
				cutText["!!! You have been caught speeding !!!","WHITE OUT"];
				0.00000001 cutFadeOut .01;
				sleep 5;
				0.00000001 cutFadeOut .01;
				titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
				titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
				titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
				titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
				titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
				titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
				titleText [format["You have been added to the wanted list for speeding at %1 Km/h",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
				[[getPlayerUID player,name player,"23582"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				jamiesaysstop = "1";
				sleep 10;
				jamiesaysstop = "0";
			}
