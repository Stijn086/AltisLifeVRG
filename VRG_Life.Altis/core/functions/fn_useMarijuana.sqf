if (player getVariable ["useMarijuana", false]) exitWith {};

closeDialog 0;

hint "420 it up!";

player setVariable ["useMarijuana", true, true];
_smoke = "SmokeShell" createVehicle position player;
if (vehicle player != player) then
    {
        _smoke attachTo [vehicle player, [0,-1,0]];
    }
    else
    {
        _smoke attachTo [player, [0,0,1]];
    };


"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust[ 0.22, 0.55, 0.02, [5, 0, 5, -0.38],[5, 1.8, 5, 0.7],[5, 2.47, 4.99, -0.84]];	
"colorCorrections" ppEffectCommit 1;
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
"chromAberration" ppEffectCommit 1;
sleep 2.25;	

private["_force","_target","_obj"];
for "_i" from 0 to 20 do {
"colorCorrections" ppEffectAdjust[ 0.22, 0.55, 0.02, [5, 0, 5, -0.38],[5, 1.8, 5, 0.7],[5, 2.47, 4.99, -0.84]];	
"chromAberration" ppEffectEnable true;
"chromAberration" ppEffectAdjust [0.01,0.01,true];
"chromAberration" ppEffectCommit 1;	
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [random 2];
"dynamicBlur" ppEffectCommit 1;
sleep 3 + random 6;
};
"dynamicBlur" ppEffectEnable false;
"chromAberration" ppEffectEnable false;
"colorCorrections" ppEffectEnable false;
player setVariable ["useMarijuana", false, true];
life_hunger = life_hunger - 5;
life_thirst = life_thirst - 5;
[] call life_fnc_hudUpdate;