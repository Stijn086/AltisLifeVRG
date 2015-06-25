/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {10000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {80000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {100000}; //Heroin processing license cost
	case "marijuana": {40000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {75000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {90000}; //diamond licence cost
	case "salt": {50000}; //salt licence cost
	case "coke": {100000}; //cocaine licence cost
	case "sand": {14500}; //sand licence cost
	case "iron": {30000}; //iron licence cost
	case "copper": {8000}; //copper licence cost
	case "cement": {6500}; //cement licence cost
	case "mair": {15000}; //noidea licence cost
	case "meth": {99000}; //meth licence cost
	case "eporn": {20000}; //eporn licence cost
	case "lsd": {95000}; //lsd licence cost
	case "rebMedic": {50000}; //rebmedic licence cost
	case "rebSniper": {300000}; //rebsniper licence cost
	case "rebExplosive": {300000}; //rebexplosive licence cost
	case "rebGrenade": {300000}; //rebgrenade licence cost
	case "rebGunner": {300000}; //rebgunner licence cost
	case "rebChemical": {200000}; //rebchemical licence cost
	case "silver": {20000}; //silver licence cost
	case "uraniumWeap": {120000}; //weaponised uranium licence cost
	case "uraniumMed": {80000}; //medical uranium licence cost
	case "bath": {25000}; //Heroin i believe licence cost
	case "painkill": {90000}; //noidea licence cost
	case "blooddiamond": {120000}; //blood diamond licence cost
	case "snuff": {25000}; //snuff licence cost
	case "home": {100000}; //homeowner licence cost
	case "taxi": {15000}; //Taxi Drive Licence Cost
	case "passport": {50000}; //Passport Licence Cost
};