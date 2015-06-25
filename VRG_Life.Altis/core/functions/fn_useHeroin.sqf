closeDialog 0;
private["_force","_unit","_damage"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
for "_i" from 0 to 60 do
{
	_force = random 5;
	"chromAberration" ppEffectEnable true;
	"chromAberration" ppEffectAdjust [_force / 24, _force / 24, false];
	"chromAberration" ppEffectCommit (0.3 + random 0.1);
	waituntil {ppEffectCommitted "chromAberration"};
	sleep 0.02;
};

player setDamage 0;
[] call life_fnc_hudUpdate;

_chance = random(100);
if(_chance >= 75) 
then 
{			
			if((animationState player) != "life_knockout" && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[player] spawn life_fnc_knockoutAction2;
			};
};
"chromAberration" ppEffectEnable false;



	
