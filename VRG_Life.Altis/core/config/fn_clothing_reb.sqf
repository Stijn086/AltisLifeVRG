
/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,5000],
			["U_Marshal",nil,5000],
			["U_I_G_Story_Protagonist_F",nil,7500],
			["U_I_G_resistanceLeader_F",nil,11500],
			["U_O_SpecopsUniform_ocamo",nil,17500],
			["U_O_PilotCoveralls",nil,15610],
			["U_IG_leader","Guerilla Leader",15340],
			["U_I_CombatUniform",nil,50000],
			["U_B_PilotCoveralls",nil,50000],
			["U_O_GhillieSuit",nil,50000],
			["U_I_GhillieSuit",nil,50000],
			["U_O_FullGhillie_ard",nil,55000],
			["U_O_FullGhillie_lsh",nil,55000],
			["U_O_FullGhillie_sard",nil,55000],
			["U_B_SpecopsUniform_sgg",nil,50000],
			["U_O_CombatUniform_oucamo",nil,50000],
			["U_O_SpecopsUniform_ocamo",nil,50000],
			["U_C_Scientist","Protective Suit",10000],
			["U_I_Wetsuit","Wetsuit",10000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_HelmetO_ocamo",nil,2500],
			["H_PilotHelmetFighter_B",nil,2500],
			["H_HelmetB_light_snakeskin",nil,2500],
			["H_MilCap_oucamo",nil,1200],
			["H_Bandanna_camo",nil,650],
			["H_CrewHelmetHeli_B","GasMask",150000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Aviator",nil,25],
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Balaclava_blk",nil,25],
			["G_Balaclava_combat",nil,25],
			["G_Balaclava_lowprofile",nil,25],
			["G_Balaclava_oli",nil,25],
			["G_Bandanna_blk",nil,25],
			["G_Bandanna_beast",nil,25],
			["G_Bandanna_aviator",nil,25],
			["G_Bandanna_khk",nil,25],
			["G_Bandanna_oli",nil,25],
			["G_Bandanna_shades",nil,25],
			["G_Bandanna_sport",nil,25],
			["G_Bandanna_tan",nil,25],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,12500],
			["V_BandollierB_cbr",nil,4500],
			["V_HarnessO_brn",nil,7500],
			["V_PlateCarrier1_blk",nil,30000],
			["V_PlateCarrierGL_mtp",nil,50000],
			["V_PlateCarrierIAGL_dgtl",nil,150000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,500],
			["B_Kitbag_mcamo",nil,500],
			["B_TacticalPack_oli",nil,500],
			["B_FieldPack_ocamo",nil,500],
			["B_Bergen_sgg",nil,500],
			["B_Kitbag_cbr",nil,500],
			["B_Carryall_oucamo",nil,500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000],
			["B_Carryall_ocamo",nil,500]
		];
	};
};
