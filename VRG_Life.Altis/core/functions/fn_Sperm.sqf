private ["_num","_store"];
_store = sperm;
removeAllActions sperm;
_num = round random 10;
sleep 5;
titleText ["", "BLACK FADED", 5];
titleText ["", "BLACK IN", 5];
if(_num > 7) then {
	sleep 10;
	hint "You couldn't stop thinking about that Fat Piggy's mum you needed x2 cups";
	life_redgull_effect = time;
	player enableFatigue false;
	life_cash = life_cash + 10000;
	hint "You have been paid $10,000 for your Sperm Donation and feel like you could run for Hours";

	}
	else
	{	
		if(_num < 3) then
		{
		sleep 10;
		hint "Seems you Didn't get it up and have hurt yourself trying too hard";
		player setDamage 0.50;
		life_cash = life_cash + 0;
		hint "You couldn't get it up to Donate Sperm $0";
		}
		else
		{
		sleep 10;
		hint "Not a bad donation better luck next time";
		player setDamage 0.10;
		life_hunger = 100;
		life_cash = life_cash + 5000;
		hint "You have been paid $5,000 for your Sperm Donation";
		};
	};

		waitUntil {!alive player OR ((time - life_redgull_effect) > (6 * 60))};
		player enableFatigue true;
		sleep 240;
		sperm addAction ["Sperm Donation",life_fnc_Sperm,"sperm"];
