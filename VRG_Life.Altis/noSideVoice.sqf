[] spawn {
	disableSerialization;

	DS_double_cut = {1 cutText [format ["%1",_this select 0],"PLAIN DOWN"];2 cutText [format ["%1",_this select 0],"PLAIN"];};
	
	while {true} do {
		waitUntil {sleep 1;((!isNull findDisplay 63) && (!isNull findDisplay 55))};
		if (ctrlText ((findDisplay 55) displayCtrl 101) == "\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa") then 
		{
			if (ctrlText ((findDisplay 63) displayCtrl 101) == "Side Channel") then 
			{
				[] spawn {
					if (isNil "reset_timer") then {
						reset_timer = true;
						sleep 90;
						disconnect_me = nil;
						warn_one = nil;
						warn_two = nil;
						warn_three = nil;
						warn_last = nil;
						reset_timer = nil;
					};
				};
				if (isNil "disconnect_me") then {disconnect_me = 0;} else {disconnect_me = disconnect_me + 1;};
				if (disconnect_me == 0) then {
					if (isNil "warn_one") then {
						warn_one = true;
						systemChat ("No voice in Side Chat!");
						["No voice in side chat!"] spawn DS_double_cut;
					};
				};
				if (disconnect_me == 1) then {
					if (isNil "warn_two") then {
						warn_two = true;
						systemChat ("Please do not use voice on sidechat, this is your second warning.");
						["NO VOICE ON SIDE"] spawn DS_double_cut;
					};
				};
				if (disconnect_me == 2) then {
					if (isNil "warn_three") then {
						warn_three = true;
						systemChat ("PLEASE DO NOT USE VOICE ON SIDECHAT!! This is your LAST warning!");
						systemChat ("You will be frozen and then KILLED!");
						["NO VOICE ON SIDE! This is your LAST warning!"] spawn DS_double_cut;
					};
				};
				if (disconnect_me >= 3) then {
					if (isNil "warn_last") then {
						warn_last = true;
                        _soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
                        _soundToPlay = _soundPath + "sounds\rekt.ogg";
						["You've asked for it..."] spawn DS_double_cut;
						1 fadeMusic 10;
						1 fadeSound 10;
                        playSound3D [_soundToPlay, player, false, getPos player, 100, 1, 50]; 
						disableUserInput true;
                        player allowDamage false;
						removeAllContainers player;
						systemChat ("Deleting gear.!");
						sleep 2.5;
						removeUniform player;
						systemChat ("Removing uniform.!");
						sleep 2.5;
						removeBackpack player;
						systemChat ("Stealing your backpack.!");
						sleep 2.5;
						removeVest player;
						systemChat ("That is a nice Vest I will take that too thanks.!");
						sleep 2.5;
						removeHeadgear player;
						systemChat ("Might as well have your Head gear too.!");
						sleep 2.5;
						player removeWeapon (primaryWeapon player);
						systemChat ("I need a main gun now too mind if I take yours thanks.!");
						sleep 2.5;
						player removeWeapon (handGunWeapon player);
						systemChat ("Sweet I wanted a side-arm thanks .!");
						sleep 2.5;
						removeAllWeapons player;
						systemChat ("Empty your pockets I am taking the lot HAVE a NICE DAY you FAT NERD.");
						sleep 2.5;
						disableUserInput false;
                        player allowDamage true;
                        player setDamage 1;
					};
				};
			};
		};
		sleep 1;
	};
};