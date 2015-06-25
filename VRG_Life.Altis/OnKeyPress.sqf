//Taken from Hostage Rescue author Zooloo75
KeyPressUpEH =
{
    private ["_key", "_shift", "_handled"];
    _key     = _this select 1;
    _shift   = _this select 2;
    _handled = true;

    switch(_key) do
    {
        case 210:
        {
            if(vehicle player == player) then
            {
                if(player in (list build) || player in (list build1)) then
                {
                    if(player distance scartel > 500) then
                    {
                        call construction_Dialog;
                    }
                    else
                    {
                        titleText ["You must be 500 meters away from Cartel point to build.", "PLAIN DOWN"];
                        playSound "AddItemFailed";
                    };
                }
                else
                {
                    titleText ["You may not build near Here", "PLAIN DOWN"];
                    playSound "AddItemFailed";
                }
            }
            else
            {
                titleText ["You must be on-foot to build.", "PLAIN DOWN"];
                playSound "AddItemFailed";
            };
        };

        case 57:
        {
            if(vehicle player == player) then
            {
                if(construction_Building && !isNull construction_Object) then
                {
                    if(player in (list build) || player in (list build1)) then
                    {
                        if(player distance scartel > 500) then
                        {
                            detach construction_Object;
                            _obj = construction_Object;

                            if(construction_SnapToggle) then
                            {
                                [_obj] call construction_SnapCalc;
                            };

                            if(!(_obj in myStructures)) then
                            {
                                myStructures = myStructures + [_obj];
                            };

                            construction_Building = false;
                            construction_Object = objNull;
                        }
                        else
                        {
                            titleText ["You must be 500 meters away to build.", "PLAIN DOWN"];
                            playSound "AddItemFailed";
                        };
                    }
                    else
                    {
                        titleText ["You may not build Here.", "PLAIN DOWN"];
                        playSound "AddItemFailed";
                    };
                };
            };
        };
    };

    _handled
};

KeyPressDownEH =
{
    _this spawn
    {
        private ["_key", "_shift", "_handled"];
        _key     = _this select 1;
        _shift   = _this select 2;
        _handled = true;

        switch(_key) do
        {
            case 46:
            {
                if(construction_Building && !isNull construction_Object) exitWith
                {
                    if(_shift) then
                    {
                        construction_ObjectDir = construction_ObjectDir - 2;
                        construction_Object setDir construction_ObjectDir;
                    }
                    else
                    {
                        construction_ObjectZ = construction_ObjectZ - 0.05;
                        construction_Object attachTo [player,[0,((boundingBox construction_Object select 1) select 1) + 1,construction_ObjectZ]];
                    };
                };
            };

            case 18:
            {
                if(construction_Building && !isNull construction_Object) exitWith
                {
                    if(_shift) then
                    {
                        construction_ObjectDir = construction_ObjectDir + 2;
                        construction_Object setDir construction_ObjectDir;
                    }
                    else
                    {
                        construction_ObjectZ = construction_ObjectZ + 0.05;
                        construction_Object attachTo [player,[0,((boundingBox construction_Object select 1) select 1) + 1,construction_ObjectZ]];
                    };
                };
            };
        };
    };

    false
};

//Adds keypress EH to the game
waitUntil {!(isNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["KeyUp",{_this call KeyPressUpEH}];
(findDisplay 46) displayAddEventHandler ["KeyDown",{_this call KeyPressDownEH}];