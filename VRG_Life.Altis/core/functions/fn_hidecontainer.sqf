/*
  File: fn_revived.sqf
  Author: Anthony "Zanven" Poschen

  Description:
  Hides the container from being grabable or shows it.
  _hide (true = hide, false = show)
  this function is used mostly to hide the WeaponHolderSimulated
  container which is the gun of someone who dies. so no one else can pick it up.
*/

_container = _this select 0;
_hide = _this select 1;
if(!isNil "_container") exitWith {}; // no container so no point.
(_container select 0) hideObject _hide;
_w = (_container select 0);
if(!isNil "_w") exitWith {}; // no object in container to hide.
_movement = 0;
if(_hide) then {_movement = -10;};
// push it 10 metres underground i doubt even on slopes u can get this badboy now.
_w setPos [getPos _w select 0, getPos _w select 1, _movement];
