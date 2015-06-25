/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Turns on and displays a security cam like feed via PiP to the laptop display.
*/
_laptop3 = _this select 0;
_mode = _this select 3;

if(!isPiPEnabled) exitWith {hint localize "STR_Cop_EnablePiP";};
if(isNil "life_fed_scam3") then {
	life_fed_scam3 = "camera" camCreate [0,0,0];
	life_fed_scam3 camSetFov 0.700;
	life_fed_scam3 camCommit 0;
	"rendertarget2" setPiPEffect [1, 0.8, 1, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];
	life_fed_scam3 cameraEffect ["INTERNAL", "BACK", "rendertarget2"];
	_laptop3 setObjectTextureGlobal [0,"#(argb,256,256,1)r2t(rendertarget2,1.0)"];
};

switch (_mode) do {

	case "Bcar": {

		life_fed_scam3 camSetTarget [9971.91,-63268.02,-50421.64];
		life_fed_scam3 camSetPos [25879.46,21590.92,10.38];
		life_fed_scam3 camCommitPrepared 0;
		life_fed_scam3 camCommit 0;
	};	
	case "off" :{
		life_fed_scam3 cameraEffect ["terminate", "back"];
		camDestroy life_fed_scam3;
		_laptop3 setObjectTextureGlobal [0,""];
		life_fed_scam3 = nil;
	};
};
