if (joinmode==0) then {
	_PUID = getPlayerUID player;
	_spielerGeld = life_cash;
	hint "A request has been sent to the server, please wait a moment";
	[[_PUID,_spielerGeld],"TON_fnc_paintball",false,false] spawn life_fnc_MP;
	joinmode = 1;
} else {
	hint "You have already joined the lobby, please try again later!";
};