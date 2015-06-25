private ["_vehicle", "_offroad", "_SUV", "_hatchback", "_hunter", "_ifrit", "_hummingbird", "_huron", "_hellcat", "_orca", "_ghosthawk", "_lightRed", "_lightBlue", "_lightHighBrightness", "_lightLowBrightness", "_lightAttenuation", "_lightFlareSize", "_lightFlareMaxDistance", "_numStrobes", "_strobeTimeOn", "_strobeTimeOff", "_offsetMultiplier", "_emergencyLights", "_extraLights", "_lightWhite", "_brightness", "_brightnessNight", "_brightnessday", "_lightFlareSizeNight", "_lightFlareSizeDay","_lightRedDay","_lightWhiteDay","_lightBlueDay","_lightRedNight","_lightWhiteNight","_lightBlueNight","_lightAttenuationDay","_lightAttenuationNight"];

_vehicle = (_this select 0);
if(_vehicle getVariable ["lights", false]) exitWith {};

_vehicle setVariable ["lights", true, false];

_modeChanged = true;

while {_modeChanged && !isNil "_vehicle" && !isNull _vehicle && _vehicle getVariable ["lights",false]} do {

    _emergencyLights = _vehicle getVariable ["emergencyLights", false];

    _offroad = typeOf _vehicle == "C_Offroad_01_F";
    _SUV = typeOf _vehicle == "C_SUV_01_F";
    _hatchback = typeOf _vehicle == "C_Hatchback_01_sport_F";
    _hunter = typeOf _vehicle == "B_MRAP_01_F";
    _ifrit = typeOf _vehicle == "O_MRAP_02_F";
    _hummingbird = typeOf _vehicle == "B_Heli_Light_01_F";
    _huron = typeOf _vehicle == "B_Heli_Transport_03_unarmed_F";
    _hellcat = typeOf _vehicle == "I_Heli_light_03_unarmed_F";
    _orca = typeOf _vehicle == "O_Heli_Light_02_unarmed_F";
    _ghosthawk = typeOf _vehicle == "B_Heli_Transport_01_F";

    if(!(_offroad || _SUV || _hatchback || _hunter || _Ifrit || _hummingbird || _huron || _hellcat || _orca || _ghosthawk)) exitWith{};

    _extraLights = _emergencyLights && !_hummingbird;

    //Night Colors (Red, White, Blue)
    _lightRedNight = [127.5, 0, 0];
    _lightWhiteNight = [127.5, 127.5, 127.5];
    _lightBlueNight = [0, 0, 127.5];
    //Day Colors (Red, White, Blue)
    _lightRedDay = [255, 0, 0];
    _lightWhiteDay = [255, 255, 255];
    _lightBlueDay = [0, 0, 255];
    //On-Off Brightness
    _lightHighBrightness = 10;
    _lightLowBrightness = 0.0005;
    //Day-Night Attenuation
    _lightAttenuationNight = [0.001, 3000, 100, 125000];
    _lightAttenuationDay = [0.001, 0, 100, 250000];
    //Intensity
    _intensity = 0;
    _intensityNight = 15000;
    _intensityDay = 45000;
    //Flare
    _lightFlareSize = 0;
    _lightFlareSizeNight = 0.25;
    _lightFlareSizeDay = 25;
    _lightFlareMaxDistance = 300;

    if (sunOrMoon < 1) then {
        //Night
        _lightRed = _lightRedNight;
        _lightWhite = _lightWhiteNight;
        _lightBlue = _lightBlueNight;
        _intensity = _intensityNight;
        _lightAttenuation = _lightAttenuationNight;
        _lightFlareSize = _lightFlareSizeNight
    } else {
        //Day
        _lightRed = _lightRedDay;
        _lightWhite = _lightWhiteDay;
        _lightBlue = _lightBlueDay;
        _intensity = _intensityDay;
        _lightAttenuation = _lightAttenuationDay;
        _lightFlareSize = _lightFlareSizeDay
    };

    _numStrobes = 3;
    _strobeTimeOn = 0.1;
    _strobeTimeOff = 0.02;

    _alphaLights = [];
    _betaLights = [];

    _attachLight = {
        _isAlpha = _this select 0;
        _color = _this select 1;
        _position = _this select 2;
        _light = "#lightpoint" createVehicle getPos _vehicle;
        _light setLightDayLight true;
        _light setLightAmbient [0.0,0.0,0.0];
        _light setLightUseFlare true;
        _light setLightBrightness 0;
        _light setLightIntensity _intensity;
        _light setLightAttenuation _lightAttenuation;
        _light setLightFlareSize _lightFlareSize;
        _light setLightFlareMaxDistance _lightFlareMaxDistance;
        _light setLightUseFlare true;

        switch (_color) do {
            case "red": {
                _light setLightColor _lightRed;
            };
            case "white": {
                _light setLightColor _lightWhite;
            };
            case "blue": {
                _light setLightColor _lightBlue;
            };
        };

        if(_isAlpha) then {
            _alphaLights = _alphaLights + [[_light, _position]];
        } else {
            _betaLights = _betaLights + [[_light, _position]];
        };
        _light attachTo [_vehicle, _position];
    };

    if(_offroad) then {
        [false, "red", [-0.44, 0.0, 0.525]] call _attachLight;
        [true, "blue", [0.345, 0.0, 0.525]] call _attachLight;
        if(_extraLights) then {
            [true, "blue", [0.17, 2.655, -0.49]] call _attachLight;
            [false, "red", [-0.25, 2.655, -0.49]] call _attachLight;

            [false, "white", [0.61, 2.2825, -0.355]] call _attachLight;
            [true, "white", [-0.695, 2.2825, -0.355]] call _attachLight;

            [false, "red", [-0.905, -2.875, -0.225]] call _attachLight;
            [true, "blue", [0.825, -2.875, -0.225]] call _attachLight;

            [true, "blue", [-0.645, -2.95, -0.77]] call _attachLight;
            [false, "red", [0.575, -2.95, -0.77]] call _attachLight;
        } else {
            [false, "red", [-0.44, 0.0, 0.525]] call _attachLight;
            [true, "blue", [0.345, 0.0, 0.525]] call _attachLight;
        };
    };

    if(_SUV) then {
        [true, "white", [0.79, 1.95, -0.48]] call _attachLight;
        [false, "white", [-0.80, 1.95, -0.48]] call _attachLight;
        if(_extraLights) then {
            [true, "red", [-0.39, 2.28, -0.52]] call _attachLight;
            [false, "blue", [0.38, 2.28, -0.52]] call _attachLight;

            [false, "blue", [-0.6, -2.925, -0.24]] call _attachLight;
            [true, "red", [0.59, -2.925, -0.24]] call _attachLight;

            [true, "red", [-0.86, -2.75, -0.18]] call _attachLight;
            [false, "blue", [0.86, -2.75, -0.18]] call _attachLight;
        } else {
            [true, "red", [-0.5, -1, 0.37]] call _attachLight;
        };
    };

    if(_hatchback) then {
        [true, "blue", [-0.03, -0, 0.2]] call _attachLight;
        [false, "red", [-0.03, -0, 0.2]] call _attachLight;
        if(_extraLights) then {
            [false, "white", [0.75, 1.615, -0.52]] call _attachLight;
            [true, "white", [-0.8, 1.615, -0.525]] call _attachLight;

            [true, "blue", [0.20, 2.15, -0.61]] call _attachLight;
            [false, "red", [-0.25, 2.15, -0.61]] call _attachLight;

            [true, "blue", [0.78, -2.25, -0.3]] call _attachLight;
            [false, "red", [-0.8, -2.25, -0.3]] call _attachLight;

            [true, "blue", [-0.55, -2.46, -0.3]] call _attachLight;
            [false, "red", [0.48, -2.46, -0.3]] call _attachLight;
        };
    };

    if(_hunter) then {
        [true, "blue", [0.85, -0.9, 0.6]] call _attachLight;
        [false, "red", [-0.85, -0.9, 0.6]] call _attachLight;

        [false, "blue", [0.93, -2.8, 0.6]] call _attachLight;
        [true, "red", [-0.93, -2.8, 0.6]] call _attachLight;

        if(_extraLights) then {
            [true, "white", [0.85, 1.475, -0.75]] call _attachLight;
            [false, "white", [-0.85, 1.475, -0.75]] call _attachLight;
        };
    };

    if(_ifrit) then {
        [false, "blue", [1.175, -1.5, 0.365]] call _attachLight;
        [true, "red", [-1.175, -1.5, 0.365]] call _attachLight;

        [false, "red", [0.4325, -1.5, 0.6275]] call _attachLight;
        [true, "blue", [0.4325, -1.5, 0.6275]] call _attachLight;

        if(_extraLights) then {
            [true, "red", [-0.2, 1.575, -1.125]] call _attachLight;
            [false, "blue", [0.2, 1.575, -1.125]] call _attachLight;

            [false, "white", [-0.775, 1.475, -1]] call _attachLight;
            [true, "white", [0.775, 1.475, -1]] call _attachLight;

            [true, "red", [0.525, -4.5, -1.3]] call _attachLight;
            [false, "blue", [-0.525, -4.5, -1.3]] call _attachLight;

            [true, "red", [-0.4, -4.95, 0.155]] call _attachLight;
            [false, "blue", [0.4, -4.95, 0.155]] call _attachLight;
        };
    };

    if(_hummingbird) then {
        [true, "red", [-0.3, 1.82, -0.6]] call _attachLight;
        [false, "blue", [0.3, 1.82, -0.6]] call _attachLight;

        if(_extraLights) then {
            [false, "blue", [-0.8, 1.25, -1]] call _attachLight;
            [true, "red", [0.8,  1.25, -1]] call _attachLight;

            [true, "blue", [0.8, -0.2, -1]] call _attachLight;
            [false, "red", [-0.8, -0.2, -1]] call _attachLight;

            [false, "blue", [0.08, -4.55, 1.25]] call _attachLight;
            [true, "red", [0.14, -4.55, 1.25]] call _attachLight;

            [true, "blue", [0.07, -4.05, -0.1]] call _attachLight;
            [false, "red", [0.14, -4.05, -0.1]] call _attachLight;
        };
    };

    if(_huron) then {
        [true, "red", [-0.4, 8.5, -1.85]] call _attachLight;
        [false, "blue", [0.4, 8.5, -1.85]] call _attachLight;

        if(_extraLights) then {
            [false, "red", [-2.05, 3.5, -1.9]] call _attachLight;
            [true, "blue", [1.9,  3.5, -1.9]] call _attachLight;

            [true, "blue", [-2.05, -1, -1.9]] call _attachLight;
            [false, "red", [1.9, -1, -1.9]] call _attachLight;

            [false, "red", [-1.65, -3.85, -1]] call _attachLight;
            [true, "red", [0.8, -5.33, -0.1]] call _attachLight;

            [true, "blue", [-0.9, -5.33, -0.1]] call _attachLight;
            [false, "blue", [1.55, -3.85, -1]] call _attachLight;
        };
    };

    if(_hellcat) then {
        [true, "blue", [-0.37, 6.25, -0.93]] call _attachLight;

        if(_extraLights) then {
            [false, "blue", [0.37, 6.25, -0.93]] call _attachLight;

            [false, "red", [-1.2, 3.85, -1.5]] call _attachLight;
            [true, "blue", [1.2, 3.85, -1.5]] call _attachLight;

            [true, "blue", [0.5, -0.26, -0.17]] call _attachLight;
            [false, "red", [-0.5, -0.26, -0.17]] call _attachLight;

            [false, "red", [-1.26, -4.35, -0.05]] call _attachLight;
            [true, "red", [1.25, -4.35, -0.05]] call _attachLight;

            [true, "blue", [-1.26, -3.95, -0.64]] call _attachLight;
            [false, "blue", [1.25, -3.95, -0.64]] call _attachLight;
        } else {
            [false, "red", [0.37, 6.25, -0.93]] call _attachLight;
        };
    };

    if(_orca) then {
        [true, "blue", [-0.37, 5.2, -1.7]] call _attachLight;

        if(_extraLights) then {
            [false, "blue", [0.37, 5.2, -1.7]] call _attachLight;

            [false, "red", [-0.9, 3, -1.5]] call _attachLight;
            [true, "red", [0.9, 3, -1.5]] call _attachLight;

            [true, "blue", [0.8, -1, 0.4]] call _attachLight;
            [false, "blue", [-0.8, -1, 0.4]] call _attachLight;

            [true, "red", [-1.35, -4.9, 0]] call _attachLight;
            [false, "red", [1.35, -4.9, 0]] call _attachLight;

            [false, "blue", [-1.35, -4.64, -0.77]] call _attachLight;
            [true, "blue", [1.35, -4.64, -0.77]] call _attachLight;
        } else {
            [false, "red", [0.37, 5.2, -1.7]] call _attachLight;
        };
    };

    if(_ghosthawk) then {
        [true, "blue", [0.7, 6.85, -1.25]] call _attachLight;

        if(_extraLights) then {
            [false, "blue", [-0.7, 6.85, -1.25]] call _attachLight;

            [false, "red", [-1.1, 2.9, -1.56]] call _attachLight;
            [true, "red", [1.2, 2.9, -1.56]] call _attachLight;

            [true, "blue", [0.65, -0.7, -0.2]] call _attachLight;
            [false, "blue", [-0.55, -0.7, -0.2]] call _attachLight;

            [false, "red", [-0.04, -7.1, 0.7]] call _attachLight;
            [true, "blue", [0.19, -7.1, 0.7]] call _attachLight;

            [true, "blue", [-0.15, -6, -0.85]] call _attachLight;
            [false, "red", [0.25, -6, -0.85]] call _attachLight;
        } else {
            [false, "red", [-0.7, 6.85, -1.25]] call _attachLight;
        };
    };

    _modeChanged = false;

    while{(alive _vehicle && _vehicle getVariable ["lights",false] && !_modeChanged)} do
    {
        for [{_i=0}, {_i<_numStrobes}, {_i=_i+1}] do {
            {
                (_x select 0) setLightBrightness _lightHighBrightness;
            } forEach _alphaLights;
            uiSleep _strobeTimeOn;
            {
                (_x select 0) setLightBrightness _lightLowBrightness;
            } forEach _alphaLights;
            uiSleep _strobeTimeOff;
        };
        {
            (_x select 0) setLightBrightness 0;
        } forEach _alphaLights;

        for [{_i=0}, {_i<_numStrobes}, {_i=_i+1}] do {
            {
                (_x select 0) setLightBrightness _lightHighBrightness;
            } forEach _betaLights;
            uiSleep _strobeTimeOn;
            {
                (_x select 0) setLightBrightness _lightLowBrightness;
            } forEach _betaLights;
            uiSleep _strobeTimeOff;
        };
        {
            (_x select 0) setLightBrightness 0;
        } forEach _betaLights;

        _modeChanged = (_vehicle getVariable ["emergencyLights",false] && !_emergencyLights) || (!(_vehicle getVariable ["emergencyLights", false]) && _emergencyLights);
    };

    {
        deleteVehicle (_x select 0);
    } forEach _alphaLights;
    {
        deleteVehicle  (_x select 0);
    } forEach _betaLights;
    _alphaLights = [];
    _betaLights = [];
};

_vehicle setVariable ["emergencyLights", false, true];
