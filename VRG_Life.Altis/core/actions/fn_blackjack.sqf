_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "sounds\shuffle.ogg";
_soundToPlay1 = _soundPath + "sounds\youblackjack.ogg";
_soundToPlay2 = _soundPath + "sounds\dealerblackjack.ogg";
_soundToPlay3 = _soundPath + "sounds\dealerv.ogg";
_soundToPlay4 = _soundPath + "sounds\playerv.ogg";

_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

hint "Welcome To the New BlackJack";

_store = BlackJack;
_denied1 = false;
_price = 15000;

if(life_cash < _price) exitWith {hint "You do not have enough money, a round costs $15000";};
life_cash = life_cash - _price;
removeAllActions BlackJack;





				_number = ceil(random 25);
				playSound3D [_soundToPlay, _vault, false, getPos _vault, 45, 1, 50];
				_pplayer = _this select 0;
			if (_number == 0) then 
				{
				robberyreward = 35000; 
				playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; 
				sleep 2;
				hint "19! Getting there"; 
				sleep 5;
				playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; 
				sleep 2; 
				hint "23 He BUSTED!! You Win!!";
				};
			if (_number == 1) then 
				{
				robberyreward = 0; 
				playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50];
				sleep 2;
				hint "18! Not bad!";
				sleep 5;
				playSound3D [_soundToPlay2, _vault, false, getPos _vault, 45, 1, 50];
				sleep 2; 
				hint "You Lose";
				};
			if (_number == 2) then 
				{
				robberyreward = 0; 
				playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; 
				sleep 2; 
				hint "8! Not even close son ...";
				sleep 5;
				playSound3D [_soundToPlay2, _vault, false, getPos _vault, 45, 1, 50];
				sleep 2; 
				hint "You Lose";
				};						
			if (_number == 3) then 
				{
				robberyreward = 0; 
				playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; 
				sleep 2; 
				hint "14! You feeling lucky punk";
				sleep 5;
				playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; 
				sleep 2; 
				hint "19 You Lose";
				};
				if (_number == 4) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "16 You got this"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "The Cunt gets 17 You Lose";};
				if (_number == 5) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "23! Incredibly you BUSTED!"; sleep 5; playSound3D [_soundToPlay2, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "You Lose";};
				if (_number == 6) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "13 Looking Really bad..!"; sleep 5;  playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "14 You Lose";};
				if (_number == 7) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "20 Almost perfect!"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "21! Blackjack!! You Lose, the odds are not in your favour!";};
				if (_number == 8) then {robberyreward = 100000; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "12! You Hit a Five Card Charlie!"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "19 You Win!!";};
				if (_number == 9) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "11 L like Loooooser!"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "16. You Lose";};
				if (_number == 10) then {robberyreward = 50000; playSound3D [_soundToPlay1, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "!!!! BlackJack!!!!"; sleep 5;  playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "24! BUSTED!! You Win!!";};
				if (_number == 11) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "4 Jesus turned water into wine!"; sleep 5;  playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "10 You Lose";};
				if (_number == 12) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "5 Luck is not on your side"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "12 You Lose";};
				if (_number == 13) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "7 This isn't Go Fish Mate!"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "15 You Lose My Fiend ";};
				if (_number == 14) then {robberyreward = 25000; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "16 The dealer believes that you read cards"; sleep 5;  playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "14 You Better Watch Yourself I've got my eye on you ";};
				if (_number == 15) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "14 You feeling luck punk"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "15 Guess your luck ran out ";};
				if (_number == 16) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "16 You got this"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "18 You Lose";};
				if (_number == 17) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "20 Almost perfect!"; sleep 5; playSound3D [_soundToPlay2, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "You Lose";};
				if (_number == 18) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "27! That was probably a little too much, did you go to school?"; sleep 5;  playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "7 You Lose";};
				if (_number == 19) then {robberyreward = 30000; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "18. Not bad!"; sleep 5;  playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "27! He BUSTED!! You Win!!";};
				if (_number == 20) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "19 Getting there"; sleep 5;  playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "19 You Lose";};
				if (_number == 21) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "12 At lest its not Unlucky 13th"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "13 ouch You Lose";};
				if (_number == 22) then {robberyreward = 20000; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "15. Easy money!"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "26! BUSTED!! You Win!!";};
				if (_number == 23) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "24! Sucks To be you"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "20 You Lose";};
				if (_number == 24) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "15 Easy money!"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "16 You Lose";};
				if (_number == 25) then {robberyreward = 0; playSound3D [_soundToPlay4, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "17 Seems a Fair call Mate!"; sleep 5; playSound3D [_soundToPlay3, _vault, false, getPos _vault, 45, 1, 50]; sleep 2; hint "20 You Lose";};
				life_action_inUse = true;


sleep 2;

_robberycash = robberyreward;
_timer = time + (1 * 5);	
_toFar = false;

while {true} do
{
	//Timer display (TO BE REPLACED WITH A NICE GUI LAYER)
	_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	hintSilent format["Plz wait to be paid thanks!\n\nTime remaining:\n %1\n\nDistance: %2m",_countDown,round(player distance _vault)];

	if(player distance _vault > 3) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {hint "You've been tazed!";};
};

switch(true) do
{
	case (_toFar):
	{
		hint "You're too far away stay at the table";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case (!alive player):
	{
		hint "The Dealer Wins because you're dead.";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case (life_istazed):
	{
		hint "You've been tazed!";
		_denied1 = false;
		life_action_inUse = false;
	};
	
	case ((round(_timer - time)) < 1):
	{
		hint format["You've won $ %1 That Hand.", _robberycash];
		life_cash = life_cash + _robberycash;
		_denied1 = false;
		life_action_inUse = false;
	};	
};

sleep 1;
BlackJack addAction["Black Jack Play ($15000)",life_fnc_blackjack,"blackjack"];
life_action_inUse = false;


