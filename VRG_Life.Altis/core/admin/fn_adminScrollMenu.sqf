//All merged into the onduty function.
//#inculde <macro.h>
//if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
//LIFE_ASM_1 = player addAction["<t color='#F00FEC'>Repair",{cursorTarget setDamage 0;hint "Repaired";}];
//LIFE_ASM_2 = player addAction["<t color='#F00FEC'>Delete Vehicle",{deletevehicle cursortarget;hint "Deleted"}];
//LIFE_ASM_3 = player addAction["<t color='#F00FEC'>Repair Building",{_buildingarray = nearestObjects [(position player), ["static"], 100];  {    (nearestBuilding _x) setDamage 0;  } forEach _buildingarray;hint "Building Repaired";}];
//LIFE_ASM_4 = player addAction["<t color='#F00FEC'>Revive Player",{[[name player],"life_fnc_revived",cursorTarget,FALSE] spawn life_fnc_MP;hint "Player Revived";}];
//LIFE_ASM_5 = player addAction["<t color='#F00FEC'>Heal",{cursorTarget setDamage 0;hint "Target Healed";}];
