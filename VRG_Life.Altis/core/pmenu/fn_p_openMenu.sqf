#include <macro.h>
/*
        File: fn_p_openMenu.sqf
        Author: Bryan "Tonic" Boardwine
       
        Description:
        Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;
ctrlShow[1992,false];
switch(playerSide) do
{
 
                case independent: {
                        ctrlShow[2011,false]; //Gangs
                        ctrlShow[6780,false]; //taxi call button
                        ctrlShow[6600,false]; //TAXI
                        ctrlShow[2012,false]; //Wanted List
                };
        case west:
        {
                ctrlShow[2011,false];
                                ctrlShow[6600,false]; //TAXI
                                ctrlShow[6780,false]; //taxi call button
        };
       
        case civilian:
        {
                ctrlShow[2012,false];
                                if(!license_civ_taxi) then {
                                        ctrlShow[6600,false]; //TAXI if do not have the license then they dont see the menu
                                };
                                ctrlShow[6780,false]; //taxi call button if you dont have the license
        };
};
 
if(__GETC__(life_adminlevel) < 1) then
{
        ctrlShow[2020,false];
        ctrlShow[2021,false];
        ctrlShow[9800,false];
};
if((__GETC__(life_coplevel) > 4) && (playerSide==west)) then
{
                        ctrlShow[9800,true];
                        if(__GETC__(life_coplevel) > 5) then
                        {
                                ctrlShow[1992,true];
                        };
};
 
[] call life_fnc_p_updateMenu;