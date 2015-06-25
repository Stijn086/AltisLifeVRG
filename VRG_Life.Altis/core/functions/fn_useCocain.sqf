
if (player getVariable ["useCocain", false]) exitWith {};
closeDialog 0;


hint "***SNORT***";
player setVariable ["useCocain", true, true];

life_redgull_effect = time;
player enableFatigue false;

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [0.8, 0.8, 0, [1,1,1,0], [1,1,1,0], [1,1,1,0]]; 
"colorCorrections" ppEffectCommit 0.8;

"dynamicBlur" ppEffectEnable true;

for "_i" from 0 to 60 do {
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [random 2];
	"dynamicBlur" ppEffectCommit 0.8;

	
	sleep 3 + random 6;
};


"colorCorrections" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false;

player setVariable ["useCocain", false, true];
waitUntil {!alive player OR ((time - life_redgull_effect) > (6 * 60))};
player enableFatigue true;
player setFatigue 1;
life_thirst = life_thirst - 5;
[] call life_fnc_hudUpdate;