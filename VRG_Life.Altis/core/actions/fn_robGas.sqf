/*
Coded by: Robert "weiRd" May

Contact:
admin@luxegaming.com
ts3.luxegaming.com

File Purpose: Gas station robbery function
*/


//variables
_rip = true;
_delay = 0.6;
_gasSelect = _this select 3;
_gasCash = (random 30000) + 15000;
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; 
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbing gas station, stay close (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;


switch (_gasSelect) do 
{
	case "Kavala Gas":
	{	
	if(_rip) then 
	{
		if (playerSide == west) then
		{
			
			hint "You good for nothing pig! You are now wanted!";
			[[0,format["%1 tried to rob a gas station! Get the traitor!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else 
			{
			if (timeK == gasTimer) then
				{
				removeAllActions _shop;
				[[0,format["%1 is robbing Kavala gas station!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
				while{true} do
				{
					sleep _delay;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["Robbing gas station, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
					if(_cP >= 1) exitWith {};
					if(_robber distance _shop > 10.5) exitWith { };
					if!(alive _robber) exitWith {};
				};
			if!(alive _robber) exitWith {_rip = false;_shop addAction["Rob Kavala Gas",life_fnc_robGas,"Kavala Gas",0,false,false,"",' (currentWeapon player != "") '];};
			if(_robber distance _shop > 10.5) exitWith { hint "You need to stay within 10m to rob the attendent! The cops are on their way!"; 5 cutText ["","PLAIN"];_rip = false;_shop addAction["Rob Kavala Gas",life_fnc_robGas,"Kavala Gas",0,false,false,"",' (currentWeapon player != "") '];};
			5 cutText ["","PLAIN"];

			
			   
				sleep 0.1;
				_shop addAction["Rob Kavala Gas",life_fnc_robGas,"Kavala Gas",0,false,false,"",' (currentWeapon player != "") '];
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
				hint format["You have robbed Kavala gas station of $%1",[_gasCash] call life_fnc_numberText];
				life_cash = life_cash + _gasCash;
				[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				
				[] call life_fnc_timeK;
				_rip = false;
				
			
				} else 
					{
						5 cutText ["","PLAIN"];
						hint "Kavala Gas Station has recently been robbed and there are no funds! The cops are on their way!";
						[[0,format["%1 is trying to rob Kavala gas station again but theres no money!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
					};
			};
			};		
	};
	
	case "Lakka Gas":
	{	
		if(_rip) then 
	{
		if (playerSide == west) then
		{
			hint "You good for nothing pig! You are now wanted!";
			[[0,format["%1 tried to rob a gas station! Get the traitor!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else 
			{
			if (timeL == gasTimer) then
				{
				removeAllActions _shop;
				[[0,format["%1 is robbing Lakka gas station!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
				while{true} do
				{
					sleep _delay;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["Robbing gas station, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
					if(_cP >= 1) exitWith {};
					if(_robber distance _shop > 10.5) exitWith { };
					if!(alive _robber) exitWith {};
				};
			if!(alive _robber) exitWith {_rip = false; _shop addAction["Rob Lakka Gas",life_fnc_robGas,"Lakka Gas",0,false,false,"",' (currentWeapon player != "") '];};
			if(_robber distance _shop > 10.5) exitWith { hint "You need to stay within 10m to rob the attendent! The cops are on their way!"; 5 cutText ["","PLAIN"];_rip = false;_shop addAction["Rob Lakka Gas",life_fnc_robGas,"Lakka Gas",0,false,false,"",' (currentWeapon player != "") '];};
			5 cutText ["","PLAIN"];

			
			   
			
				if!(alive _robber) exitWith {};
				sleep 0.1;
				_shop addAction["Rob Kavala Gas",life_fnc_robGas,"Lakka Gas",0,false,false,"",' (currentWeapon player != "") '];
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
				hint format["You have robbed Lakka gas station of $%1",[_gasCash] call life_fnc_numberText];
				life_cash = life_cash + _gasCash;
				[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				
				[] call life_fnc_timeL;
				_rip = false;
			
				} else 
					{
						5 cutText ["","PLAIN"];
						hint "Lakka Gas Station has recently been robbed and there are no funds! The cops are on their way!";
						[[0,format["%1 is trying to rob Lakka gas station again but theres no money!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
					};
			};
			};	
	};
	
	case "Gravia Gas":
	{
		if(_rip) then 
	{
		if (playerSide == west) then
		{
			hint "You good for nothing pig! You are now wanted!";
			[[0,format["%1 tried to rob a gas station! Get the traitor!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else 
			{
			if (timeG == gasTimer) then
				{
				removeAllActions _shop;
				[[0,format["%1 is robbing Gravia gas station!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
				while{true} do
				{
					sleep _delay;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["Robbing gas station, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
					if(_cP >= 1) exitWith {};
					if(_robber distance _shop > 10.5) exitWith { };
					if!(alive _robber) exitWith {};
				};
			if!(alive _robber) exitWith {_rip = false;_shop addAction["Rob Gravia Gas",life_fnc_robGas,"Gravia Gas",0,false,false,"",' (currentWeapon player != "") '];};
			if(_robber distance _shop > 10.5) exitWith { hint "You need to stay within 10m to rob the attendent! The cops are on their way!"; 5 cutText ["","PLAIN"];_rip = false;_shop addAction["Rob Gravia Gas",life_fnc_robGas,"Gravia Gas",0,false,false,"",' (currentWeapon player != "") '];};
			5 cutText ["","PLAIN"];

			
			   
			
				if!(alive _robber) exitWith {};
				sleep 0.1; 
				_shop addAction["Rob Gravia Gas",life_fnc_robGas,"Gravia Gas",0,false,false,"",' (currentWeapon player != "") '];
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
				hint format["You have robbed Gravia gas station of $%1",[_gasCash] call life_fnc_numberText];
				life_cash = life_cash + _gasCash;
				[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				
				[] call life_fnc_timeG;
				_rip = false;
			
				} else 
					{
						5 cutText ["","PLAIN"];
						hint "Gravia Gas Station has recently been robbed and there are no funds! The cops are on their way!";
						[[0,format["%1 is trying to rob Gravia gas station again but theres no money!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
					};
			};
			};	
	};
	
	case "Pyrgos Gas":
	{
		if(_rip) then 
	{
		if (playerSide == west) then
		{
			hint "You good for nothing pig! You are now wanted!";
			[[0,format["%1 tried to rob a gas station! Get the traitor!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else 
			{
			if (timeP == gasTimer) then
				{
				removeAllActions _shop;
				[[0,format["%1 is robbing Pyrgos gas station!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
				while{true} do
				{
					sleep _delay;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["Robbing gas station, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
					if(_cP >= 1) exitWith {};
					if(_robber distance _shop > 10.5) exitWith { };
					if!(alive _robber) exitWith {};
				};
			if!(alive _robber) exitWith {_rip = false;_shop addAction["Rob Pyrgos Gas",life_fnc_robGas,"Pyrgos Gas",0,false,false,"",' (currentWeapon player != "") '];};
			if(_robber distance _shop > 10.5) exitWith { hint "You need to stay within 10m to rob the attendent! The cops are on their way!"; 5 cutText ["","PLAIN"];_rip = false;_shop addAction["Rob Pyrgos Gas",life_fnc_robGas,"Pyrgos Gas",0,false,false,"",' (currentWeapon player != "") '];};
			5 cutText ["","PLAIN"];

			
			   
			
				if!(alive _robber) exitWith {};
				sleep 0.1;
				_shop addAction["Rob Pyrgos Gas",life_fnc_robGas,"Pyrgos Gas",0,false,false,"",' (currentWeapon player != "") '];
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
				hint format["You have robbed Pyrgos gas station of $%1",[_gasCash] call life_fnc_numberText];
				life_cash = life_cash + _gasCash;
				[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				
				[] call life_fnc_timeP;
				_rip = false;
			
				} else 
					{
						5 cutText ["","PLAIN"];
						hint "Pyrgos Gas Station has recently been robbed and there are no funds! The cops are on their way!";
						[[0,format["%1 is trying to rob Pyrgos gas station again but theres no money!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
					};
			};
			};	
	};
	
	case "Paros Gas":
	{
		if(_rip) then 
	{
		if (playerSide == west) then
		{
			hint "You good for nothing pig! You are now wanted!";
			[[0,format["%1 tried to rob a gas station! Get the traitor!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else 
			{
			if (timePa == gasTimer) then
				{
				removeAllActions _shop;
				[[0,format["%1 is robbing Paros gas station!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
				while{true} do
				{
					sleep _delay;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["Robbing gas station, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
					if(_cP >= 1) exitWith {};
					if(_robber distance _shop > 10.5) exitWith { };
					if!(alive _robber) exitWith {};
				};
			if!(alive _robber) exitWith {_rip = false;_shop addAction["Rob Paros Gas",life_fnc_robGas,"Paros Gas",0,false,false,"",' (currentWeapon player != "") '];};
			if(_robber distance _shop > 10.5) exitWith { hint "You need to stay within 10m to rob the attendent! The cops are on their way!"; 5 cutText ["","PLAIN"];_rip = false;_shop addAction["Rob Paros Gas",life_fnc_robGas,"Paros Gas",0,false,false,"",' (currentWeapon player != "") '];};
			5 cutText ["","PLAIN"];

			
			   
			
				if!(alive _robber) exitWith {};
				sleep 0.1;
				_shop addAction["Rob Paros Gas",life_fnc_robGas,"Paros Gas",0,false,false,"",' (currentWeapon player != "") '];
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
				hint format["You have robbed Paros gas station of $%1",[_gasCash] call life_fnc_numberText];
				life_cash = life_cash + _gasCash;
				[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				
				[] call life_fnc_timePa;
				_rip = false;
			
				} else 
					{
						5 cutText ["","PLAIN"];
						hint "Paros Gas Station has recently been robbed and there are no funds! The cops are on their way!";
						[[0,format["%1 is trying to rob Paros gas station again but theres no money!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
					};
			};
			};	
	};
	
	case "Sofia Gas":
	{
		if(_rip) then 
	{
		if (playerSide == west) then
		{
			hint "You good for nothing pig! You are now wanted!";
			[[0,format["%1 tried to rob a gas station! Get the traitor!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
			[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else 
			{
			if (timeS == gasTimer) then
				{
				removeAllActions _shop;
				[[0,format["%1 is robbing Sofia gas station!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
				while{true} do
				{
					sleep _delay;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["Robbing gas station, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
					if(_cP >= 1) exitWith {};
					if(_robber distance _shop > 10.5) exitWith { };
					if!(alive _robber) exitWith {};
				};
			if!(alive _robber) exitWith {_rip = false;_shop addAction["Rob Sofia Gas",life_fnc_robGas,"Sofia Gas",0,false,false,"",' (currentWeapon player != "") '];};
			if(_robber distance _shop > 10.5) exitWith { hint "You need to stay within 10m to rob the attendent! The cops are on their way!"; 5 cutText ["","PLAIN"];_rip = false;_shop addAction["Rob Sofia Gas",life_fnc_robGas,"Sofia Gas",0,false,false,"",' (currentWeapon player != "") '];};
			5 cutText ["","PLAIN"];

			
			   
			
				if!(alive _robber) exitWith {};
				sleep 0.1;
				_shop addAction["Rob Sofia Gas",life_fnc_robGas,"Sofia Gas",0,false,false,"",' (currentWeapon player != "") '];
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", player];
				hint format["You have robbed Sofia gas station of $%1",[_gasCash] call life_fnc_numberText];
				life_cash = life_cash + _gasCash;
				[[getPlayerUID player,name player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
				
				[] call life_fnc_timeS;
				_rip = false;
			
				} else 
					{
						5 cutText ["","PLAIN"];
						hint "Sofia Gas Station has recently been robbed and there are no funds! The cops are on their way!";
						[[0,format["%1 is trying to rob Sofia gas station again but theres no money!",name player]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
					};
			};
			};	
	};
};
