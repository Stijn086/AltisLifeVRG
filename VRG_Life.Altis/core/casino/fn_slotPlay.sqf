/*
	@Version: 4.0
	@Author: Kri
	@Edited: 15.03.2014
*/
_delay = 7;

with missionNamespace do {
	if ((player getVariable ["slotmachine_lastplay", 0]) + _delay > time) exitWith {};
	player setVariable ["slotmachine_lastplay", time];
	
	_bet = player getVariable ["slotmachine_bet", 0];
	if (life_cash < _bet) exitWith { hint "You don't have enough money with you."; };
	
	playSound "caching";
	
	disableSerialization;
	ctrlEnable [88808, false];
	
	life_slotPlayNow = [player, _bet];
	publicVariableServer "life_slotPlayNow";
};
