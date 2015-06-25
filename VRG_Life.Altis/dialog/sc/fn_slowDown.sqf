

	_speed = speed player;
			if (jamiesaysstop == "0") do {
			0.0001 cutFadeOut .01;
			titleText [format["Your speed is excessive, please slow down...",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your speed is excessive, please slow down...",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your speed is excessive, please slow down...",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your speed is excessive, please slow down...",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your speed is excessive, please slow down...",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your speed is excessive, please slow down...",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;
			titleText [format["Your speed is excessive, please slow down...",_speed,thisprice,(player getVariable 'bankmoney')],"PLAIN DOWN"]; titlefadeout 10;

			jamiesaysstop = "1";
			sleep 10;
			jamiesaysstop = "0";
			}
