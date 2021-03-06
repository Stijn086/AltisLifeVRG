AH_loaded = false;
systemChat "Calling Prices";
[[0,player],"TON_fnc_SAH_reciever",false,false] spawn life_fnc_mp;
waitUntil {AH_loaded};
systemChat "Loaded Prices";
waitUntil {createDialog "AH_buy";};
systemChat "Created Dialog";
disableSerialization;
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
{
	_curOffer = _x;
	_pid = _curOffer select 0;
	_item = _curOffer select 1;
	_price = _curOffer select 2;
	_seller = [_pid] call life_fnc_CAH_getPlayerObj;
	_myListbox lbAdd format ["Player: %1 | Price: $%2 | Item: %3",name _seller,_price,([_item] call VAS_fnc_fetchCfgDetails) select 1];
	_myListbox lbSetPicture [(lbSize _myListbox)-1, ([_item] call VAS_fnc_fetchCfgDetails) select 2];
	_myListbox lbSetPictureColor [(lbSize _myListbox)-1, [1, 1, 1, 1]];
	_myListbox lbSetData [(lbSize _myListbox)-1,format ["%1",[_pid,_item,_price]]];
} forEach AH_offers;
hint "Successfully loaded offers";