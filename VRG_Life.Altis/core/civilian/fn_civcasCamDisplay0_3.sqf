/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop5 = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_fed_scam5") then {
	life_fed_scam5 = "camera" camCreate [0,0,0];
	life_fed_scam5 camSetFov 0.700;
	life_fed_scam5 camCommit 0;
	"rendertarget4" setPiPEffect [0];
	life_fed_scam5 cameraEffect ["INTERNAL", "BACK", "rendertarget4"];
	_laptop5 setObjectTexture [0,"#(argb,256,256,1)r2t(rendertarget4,1.0)"];
};

switch (_mode) do {
	case "Fright": {
		life_fed_scam5 camSetTarget [-48699.59,-32943.41,-38283.02];
		life_fed_scam5 camSetPos [25896.95,21528.47,11.65];
		life_fed_scam5 camCommitPrepared 0;
		life_fed_scam5 camCommit 0;
	};
	case "off" :{
		life_fed_scam5 cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam5;
		_laptop5 setObjectTexture [0,""];
		life_fed_scam5 = nil;
	};
};
