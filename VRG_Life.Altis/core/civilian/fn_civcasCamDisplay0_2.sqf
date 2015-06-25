/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop4 = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_fed_scam4") then {
	life_fed_scam4 = "camera" camCreate [0,0,0];
	life_fed_scam4 camSetFov 0.700;
	life_fed_scam4 camCommit 0;
	"rendertarget3" setPiPEffect [0];
	life_fed_scam4 cameraEffect ["INTERNAL", "BACK", "rendertarget3"];
	_laptop4 setObjectTextureGlobal [0,"#(argb,256,256,1)r2t(rendertarget3,1.0)"];
};

switch (_mode) do {	
	case "Nclub": {
		life_fed_scam4 camSetTarget [93465.14,83602.48,-39875.65];
		life_fed_scam4 camSetPos [25906.71,21608.29,5.73];
		life_fed_scam4 camCommitPrepared 0;
		life_fed_scam4 camCommit 0;
	};	
	case "off" :{
		life_fed_scam4 cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam4;
		_laptop4 setObjectTextureGlobal [0,""];
		life_fed_scam4 = nil;
	};
};
