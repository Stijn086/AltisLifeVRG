

	thisprice = 10000;
	_speed = speed player;

			if (_jamiesaysstop == "0") do {
			license_civ_driver = false;
			cutText["!!! You have been caught speeding !!!","WHITE OUT"];
			0.00000001 cutFadeOut .01;
			titleText [format["Your driving license has been removed and you have been added to the wanted list for your extreme speed.",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your driving license has been removed and you have been added to the wanted list for your extreme speed.",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your driving license has been removed and you have been added to the wanted list for your extreme speed.",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your driving license has been removed and you have been added to the wanted list for your extreme speed.",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your driving license has been removed and you have been added to the wanted list for your extreme speed.",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your driving license has been removed and you have been added to the wanted list for your extreme speed.",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your driving license has been removed and you have been added to the wanted list for your extreme speed.",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			[[getPlayerUID player,name player,"23582E"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
			_jamiesaysstop = "1";
			sleep 10;
			_jamiesaysstop = "0";
			}