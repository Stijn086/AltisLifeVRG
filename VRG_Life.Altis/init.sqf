enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;
gasTimer = 1800;
timeK = gasTimer;
timeL = gasTimer;
timeG = gasTimer;
timeP = gasTimer;
timePa = gasTimer;
timeS = gasTimer;
vdmlock = false; // fn_vdmhandle (used to make sure added to wanted list only once per vdm)

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
//[] execVM "zlt_fastrope.sqf";
[] execVM "scripts\gas\teargas.sqf";
[] execVM "scripts\gas\teargas40.sqf";
[] execVM "scripts\HandBrake.sqf";
[] execVM "Server Messages\message.sqf";
[] execVM "noSideVoice.sqf";
[] execVM "construction.sqf"; //Taken from Stratis-RP: Ultimate
[] execVM "OnKeyPress.sqf"; //Taken from Hostage Rescue author Zooloo75
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";
[] execVM "scripts\disableAnimals.sqf";
[] execVM "scripts\fn_statusBar.sqf"; 

[] spawn
{
while {true} do
{
waitUntil {!isNull (findDisplay 49)};
((findDisplay 49) displayCtrl 122) ctrlEnable false;
((findDisplay 49) displayCtrl 122) ctrlShow false;
waitUntil {isNull (findDisplay 49)};
};
}; 

StartProgress = true;
player setVariable["restrained",false,true];
player setVariable["hostage",false,true];
