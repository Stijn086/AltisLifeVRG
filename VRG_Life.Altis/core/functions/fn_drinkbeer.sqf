/*File: fn_drinkbeer.sqf author:[midgetgrimm] drinkypoo*/
closeDialog 0;
hintSilent parseText format["Your BAC is now<br/> <t size='1.4'><t color='#FF0000'>%1</t></t>",[life_drink] call life_fnc_numberText];
sleep 4;
"radialBlur" ppEffectEnable true;
"dynamicBlur" ppEffectEnable true;
enableCamShake true;
player setVariable["inDrink",true,true];
for "_i" from 0 to 20 do
{
    if(life_drink > 0.07) then {
		"radialBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectEnable true;  
		"dynamicBlur" ppEffectAdjust [random 2];
		"dynamicBlur" ppEffectCommit 1;
		"radialBlur" ppEffectAdjust  [random 1,random 0.12,0.8,0.8];
		"radialBlur" ppEffectCommit 2;
		addcamShake[random 4, 2, random 4];
		sleep 3 + random 6;
	} else {sleep 3};
};
if (life_drink > 0.07) then {

			_chance = random(100);
			if(_chance >= 95) 
			then 
			{	

			titleText [localize "STR_MISC_DrunkBlackOut","BLACK OUT"];
			player playMoveNow "Incapacitated";
			//titleText[localize "STR_MISC_DrunkBlackOut","BLACK IN"];
			sleep 15;
			player playMoveNow "AinjPpneMstpSnonWrflDnon_rolltoback";
			sleep 10;
			life_drink = life_drink - 0.02;
			titleText[localize "STR_MISC_DrunkBlackOut1","PLAIN"];
			player playMoveNow "amovppnemstpsraswrfldnon";
			[[0,format[localize "STR_MISC_StPubIntox",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
			[[getPlayerUID player,profileName,"390"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;			

			};

};
//Stop effects
player setVariable["inDrink",false,true];

"radialBlur" ppEffectAdjust  [0,0,0,0];
"radialBlur" ppEffectCommit 5;
sleep 6;

//Deactivate ppEffects
"dynamicBlur" ppEffectEnable false;
"radialBlur" ppEffectEnable false;
resetCamShake;
if(life_drink != 0) then {life_drink = life_drink - 0.02;};