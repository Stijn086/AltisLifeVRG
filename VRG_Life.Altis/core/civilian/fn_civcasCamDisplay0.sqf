/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop2 = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_fed_scam2") then {
	life_fed_scam2 = "camera" camCreate [0,0,0];
	life_fed_scam2 camSetFov 0.700;
	life_fed_scam2 camCommit 0;
	"rendertarget1" setPiPEffect [0];
	life_fed_scam2 cameraEffect ["INTERNAL", "BACK", "rendertarget1"];
	_laptop2 setObjectTextureGlobal [0,"#(argb,256,256,1)r2t(rendertarget1,1.0)"];
};

switch (_mode) do {
	case "Fleft": {
		life_fed_scam2 camSetTarget [116505.79,13293.86,-41489.55];
		life_fed_scam2 camSetPos [25914.78,21574.93,15.92];
		life_fed_scam2 camCommitPrepared 0;
		life_fed_scam2 camCommit 0;
	};
	case "Fright": {
		life_fed_scam2 camSetTarget [-48699.59,-32943.41,-38283.02];
		life_fed_scam2 camSetPos [25896.95,21528.47,11.65];
		life_fed_scam2 camCommitPrepared 0;
		life_fed_scam2 camCommit 0;
	};	
	case "off" :{
		life_fed_scam2 cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam2;
		_laptop2 setObjectTextureGlobal [0,""];
		life_fed_scam2 = nil;
	};
};
