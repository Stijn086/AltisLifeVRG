/*
	File: fn_alcoholSleep.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Script for a player to 'Sleep off' the effects of alcohol so they can legally drive
*/

private ["_fadeInTime","_fadeOutTime","_faded","_endTime","_player","_sound","_soundLoop","_bp","_load","_cfg"];

if(life_cash < 500)exitwith{hint 'You need $500 to stay here';};
life_cash = life_cash - 500;

if(!alive player)exitwith{};
if(isNil{life_drink})then{life_drink = 0;};

if(life_drink == 0)exitwith{hint 'You are not drunk';};
hint 'You are feeling very sleepy....';
sleep 2;
titleText ["", "BLACK FADED", 5];
[[player,"KIA_passenger_flatground"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
sleep 60;

titleCut ["","WHITE IN",0];		
life_drink = 0;
titleText ["", "BLACK IN", 5];
hint 'Ahhh feeling abit better now, should be ok to drive!';
player setDamage 0;
"radialBlur" ppEffectEnable false;
"wetDistortion" ppEffectEnable false;
"dynamicBlur" ppEffectEnable false;
resetCamShake;
[[player,"AidlPknlMstpSnonWnonDnon_AI"],"life_fnc_animSync",true,false] spawn life_fnc_MP;

