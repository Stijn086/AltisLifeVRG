

private["_rand","_weaps","_weaps2","_weapf","_gun"];

_rand = random 100;
_rand = round _rand;
_weaps = ["srifle_EBR_SOS_F","arifle_Katiba_F", "arifle_MX_SW_F","arifle_SDAR_F","arifle_TRG21_F","SMG_01_Holo_F","srifle_DMR_01_SOS_F","hgun_PDW2000_F"];
_weaps2 = ["srifle_LRR_SOS_F", "LMG_Mk200_MRCO_F", "srifle_GM6_SOS_F", "LMG_Zafir_F"];
if(_rand > 5) then {
_weapf = _weaps;
} else {
_weapf = _weaps2;
};
_gun = _weapf select floor random count _weapf;
player addWeapon _gun;