//[className,price,display name]
//Taken from Stratis-RP: Ultimate
construction_Structures =
[
    ["Land_Shoot_House_Corner_F", 10000, "(Plywood) Corner"],
    ["Land_Shoot_House_Panels_F", 25000, "(Plywood) Wall"],
    ["Land_Shoot_House_Panels_Window_F", 10000, "(Plywood) Wall Window"],
    ["Land_Shoot_House_Panels_Windows_F", 15000, "(Plywood) Wall Windows"],
    ["Land_Shoot_House_Tunnel_F", 50000, "(Plywood) Tunnel"],
    ["Land_Wall_IndCnc_4_F", 50000, "(Concrete) Wall"],
    ["Land_Wall_Tin_4", 15000, "(Tin) Wall"],
    ["Land_Stone_4m_F", 30000, "(Stone) Wall"],
    ["Land_Stone_Gate_F", 15000, "(Stone) Gate"],
    ["Land_Ancient_Wall_4m_F", 25000, "(Ancient) Short Wall"],
    ["Land_Ancient_Wall_8m_F", 50000, "(Ancient) Long Wall"],
    ["Land_BarGate_F", 25000, "Bargate"],
    ["Land_ShootingPos_F", 10000, "Shooting Position"],
    ["MetalBarrel_burning_F", 10000, "Barrel Fire"],
    ["Land_CncBarrier_F", 25000, "Small Concrete Barrier"],
    ["Land_CncBarrierMedium_F", 50000, "Large Concrete Barrier"],
    ["RoadCone_L_F", 15000, "Road Cone (Light)"],
    ["Campfire_burning_F", 15000, "Campfire"],
    ["RoadBarrier_F", 20000, "Striped Road Barrier"],
    ["Land_RampConcreteHigh_F", 20000, "High Ramp of Concrete"],
    ["BlockConcrete_F", 20000, "Block of Concrete"],
    ["CamoNet_BLUFOR_open_F", 20000, "Camo Net Open"],
    ["Land_BagBunker_Small_F", 50000, "Small Bunker"],
    ["Land_BagBunker_Large_F", 100000, "Large Bunker"],
    ["Land_BagBunker_Tower_F", 250000, "Bunker Tower"],
    ["Land_Cargo_HQ_V1_F", 750000, "Headquarters"],
    ["Land_Cargo_Tower_V2_F", 500000, "(Military) Tower"],
    ["Land_Castle_01_tower_F", 250000, "(Castle) Tower"]
];


construction_Building = false;
construction_Object = objNull;
construction_SnapToggle = false;

construction_SnapCalc =
{
    _obj = _this select 0;
    _normal = surfaceNormal (position _obj);
    _obj setVectorUp _normal;
};

construction_Snap =
{
    if(construction_SnapToggle) then {playSound "hint"; construction_SnapToggle = false; ctrlSetText [1030,"Snap To Terrain (FALSE)"];}
    else
    {playSound "hint"; construction_SnapToggle = true; ctrlSetText [1030, "Snap To Terrain (TRUE)"];};
};

construction_Purchase =
{
    if(vehicle player != player) exitWith {titleText ["You need to be on foot.", "PLAIN DOWN"]; playSound "AddItemFailed";};
    if(construction_Building) exitWith {titleText ["You are already building something.", "PLAIN DOWN"]; playSound "AddItemFailed";};
    _sel = lbCurSel 1500;
    construction_Selection = _sel;
    _cost = round((construction_Structures select _sel) select 1);
    if(life_cash < _cost) exitWith {titleText ["Insufficient funds.", "PLAIN DOWN"]; playSound "AddItemFailed";};
    life_cash = life_cash - _cost;
    playSound "hint";
    construction_Building = true;
    construction_Object = ((construction_Structures select _sel) select 0) createVehicle [0,3,0];
    construction_Object setVariable ["builder",getPlayerUID player,true];
    _obj = construction_Object;
    construction_ObjectDir = 0;
    construction_ObjectZ = ((boundingBox construction_Object select 1) select 2);
    construction_Object attachTo [player,[0,((boundingBox construction_Object select 1) select 1) + 3,construction_ObjectZ]];
    construction_Object setDir construction_ObjectDir;
    construction_Object allowDamage true;
	construction_Object enableSimulationGlobal false;
	
	_nearestCollionObjects = nearestObjects[player, ["Man", "Car", "Air", "Ship"]];
	{
	construction_Object disableCollisionWith _x;
	} forEach _nearestCollionObjects;

	
    closeDialog 0;
    titleText ["SPACEBAR - PLACE OBJECT\nE - RAISE OBJECT\nC - LOWER OBJECT\nSHIFT+E - ROTATE\nSHIFT+C - ROTATE ","PLAIN DOWN"];

    [_obj] spawn
    {
        _obj = _this select 0;
        _pos = position player;
        waitUntil {!alive player || vehicle player != player || player distance _pos > 20};
        detach _obj;

        if(!(_obj in myStructures)) then
        {
            myStructures = myStructures + [_obj];
        };
 		construction_Object setVariable["collision", _nearestCollionObjects];       
        construction_Object = objNull;
        construction_Building = false;
    };
};

construction_Selection = 0;
construction_NearObjects = [];
myStructures = [];
construction_Dialog =
{
    if(vehicle player != player) exitWith {};
    if(construction_Building) exitWith {titleText ["You are already building something.", "PLAIN DOWN"]; playSound "AddItemFailed";};

    closeDialog 0;
    createDialog "constructionDialog";

    if(construction_SnapToggle) then {ctrlSetText [1030,"Snap To Terrain (TRUE)"];} else {ctrlSetText [1030,"Snap To Terrain (FALSE)"];};

    {
            lbAdd [1500,(format["%2 (%1 $)",_x select 1,_x select 2])];
    } forEach construction_Structures;
    lbSetCurSel [1500,construction_Selection];

    construction_NearObjects = nearestObjects [player,[],50];
    {
            if!(_x in myStructures) then {construction_NearObjects = construction_NearObjects - [_x]}
            else
            {
                    _name = (construction_Structures select (([construction_Structures,(typeOf _x)] call bis_fnc_findNestedElement) select 0)) select 2;
                    _dist = _x distance player;
                    lbAdd [1506,(format["%1 (Distance: %2m)",_name,_dist])];
            };
    } forEach construction_NearObjects;
    lbSetCurSel [1506,0];
};

construction_Move =
{
    _sel = lbCurSel 1506;
    if(_sel == -1) exitWith {titleText ["No selection.", "PLAIN DOWN"]; playSound "AddItemFailed";};
    if(count myStructures == 0 || count construction_Structures == 0) exitWith {titleText ["No structures.", "PLAIN DOWN"]; playSound "AddItemFailed";};
    if(!isNull construction_Object) then {titleText ["You are already placing a structure", "PLAIN DOWN"]; playSound "AddItemFailed";};
    construction_Building = true;
    _object = (construction_NearObjects select _sel);
    construction_Object = _object;
    construction_ObjectDir = 0;
    construction_ObjectZ = ((boundingBox construction_Object select 1) select 2);
    construction_Object attachTo [player,[0,((boundingBox construction_Object select 1) select 1) + 3,construction_ObjectZ]];
    construction_Object setDir construction_ObjectDir;
    closeDialog 0;
    titleText ["SPACEBAR - PLACE OBJECT\nE - RAISE OBJECT\nC - LOWER OBJECT\nSHIFT+E - ROTATE\nSHIFT+C - ROTATE","PLAIN DOWN"];
};

construction_Remove =
{
    _sel = lbCurSel 1506;
    if(_sel == -1) exitWith {titleText ["No selection.", "PLAIN DOWN"]; playSound "AddItemFailed";};
    if(count myStructures == 0 || count construction_Structures == 0) exitWith {titleText ["No selection.", "PLAIN DOWN"]; playSound "AddItemFailed";};
    closeDialog 0;
    _obj = construction_NearObjects select _sel;
    deleteVehicle _obj;
    myStructures = myStructures - [_obj];
    titleText ["Structure removed.", "PLAIN DOWN"];
};

construction_ButtonText =
{
    _sel = lbCurSel 1500;
    _txt = format ["Purchase ($ %1)",round((construction_Structures select _sel) select 1)];
    ctrlSetText [1600,_txt];
};

construction_RemoveAction =
{
    _obj = _this select 0;
    _obj addAction [_str,construction_RemoveObj,[_obj], 1, true, true, "", "vehicle player == player && _obj getVariable 'builder' == getPlayerUID player"];
};