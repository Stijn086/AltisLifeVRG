class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
	};
};

class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
		class variableCheck{};
		class initSpy {preInit=1;};
	};
};

class Life_Client_Core
{
	tag = "life";

	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class welcomeNotification {};
	};

	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDebugCon {};
		class adminCompensate {};
		class adminGodMode {};
		class adminFreeze {};
		class adminMarkers {};
		class adminScrollMenu {};
		class adminInfAmmo {};
		class adminKick {};
		class adminRevive {};
		class adminOnDuty {};
		class delSpawnedVeh {};
	};

	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class newLifeRule {};
	};

	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class chemlightUse {};
		class heal {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class serviceTruck {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class execute {};
		class gatherApples {};
		class gatherCannabis {};
		class gatherHeroin {};
		class gatherOil {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class sellOil {};
		class suicideBomb {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class gatherPeaches {};
		class gatherCocaine {};
		class pumpRepair {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class sellTurtle {};
		class sellGoldBars {};
		class selldirtymoney {};
		class protprocessAction {};
		class captureHideout {};

		//From 3.1.2
		class rapeAction {};
		class rapefail {};
		class rapeme {};
		class surrender {};
		class gatherChemicals {};
		class gatherPorn {};
		class gatherSnuff {};
		class robGas {};
		class gatherFrogs {};

		//Nightclub
		class nclights {};
		class ncLightsOn {};
		class ncmusic {};
		class ncstage {};
		class ncsmoke {};
		class ncflash {};

		class robCasino {};
		class civrestrainAction {}; //ziptie system
		class civunrestrain {}; //ziptie unrestrained
		class processCasinoSlots {};
		class blackjack {};
		class alcoholSleep {};
		
		class exportWeapons {};
		class skyDive {};
	};
	
	class Paintball
	{
		file = "core\paintball";
		class pb_response {};
	};

	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
		class openHouseVInv {};
		class displayStats {};
		class swapItem {};
	};

	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class copDefault {};
		class pmcDefault {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};

		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};

		//For custom uniforms etc
		class updateClothing {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class wantedadd2 {};
		class wanted2 {};
	};

	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class collectArmaItems {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class hidecontainer {};
		class fetchGear{};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class handleVehDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class loadGear {};
		class saveGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class playSound {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class stripDownPlayer {};
		class martialSiren {};
		class ryn_message {};
		class fadeSound {};
		class setRating {};

		//From 3.1.2
		class timeK {};
		class timeL {};
		class timeG {};
		class timeP {};
		class timePa {};
		class timeS {};
		class copTeleport{};
		class civTeleport{};
		class slotMachineRewards {};
		class civpullOutVeh {}; //ziptie pull out for civs
		class slotMachineRandomizer{};
		class randomRound {};
		class useHeroin {};
		class useMarijuana {};
		class useCocain {};
		class useLSD {};
		class drinkbeer {};
		class drinkjimbeam {};
		class drinkvodka {};
		class Sperm {};
	};

	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};

	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class civFetchGear {};
		class civLoadGear {};
		class knockedOut {};
		class knockoutAction {};
		class knockedOut2 {};
		class knockoutAction2 {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class zoneCreator {};
		class demoChargeTimer {};
		class civInteractionMenu {};
		class civrestrain {}; //civ restrained
		class demoChargeTimer2 {};
		class demoChargeTimer3 {};
		class civcasCamDisplay0 {};
		class civcasCamDisplay0_1 {};
		class civcasCamDisplay0_2 {};
		class civcasCamDisplay0_3 {};
		class civLoadout {};
		class WantedUpdateValue {};
		class punchBalls {};
		class punchBallsAction {};
	};

	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
	};

	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class coploadGear {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class copOpener {};

		//Skalicons
		class seizeObjects {};
		class seizePlayerWeapon {};
		class seizePlayerWeaponAction {};
		class breathalyzer {};
		class doorlock {};		
	};

	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewOwner {};
        class gangRank {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangDrugCut {};
	};

	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
	};

	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class C4Charge {};
		class defuseKit {};
		class storageBox {};
		class SlotJackpotSound {};
		class bankalarmsound {};
		class thermalDrill {};
		class POW {};
	};

	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class gangWithdraw {};
		class safeInventory2 {};
		class safeInventory3 {};
		class safeOpen2 {};
		class safeOpen3 {};
		class safeTake2 {};
		class safeTake3 {};
		class safeFix2 {};
		class safeFix3 {};
	};

	class SlotMachine {
		file = "core\casino";
		class slotInit {};
		class slotPlay {};
		class slotReceive {};
	};

	class Dialog_sc
	{
		file = "dialog\sc";
		class slowDown {};
		class tooFast {};
		class woah {};
	};
	
	class Taxi
	{
		file = "core\taxi";
		class taxi_call {};
		class taxi_respond {};
		class taxi_acceptCall {};
		class finishRide {};
		class openTaxiMenu {};
	};
	
	class Auktionshaus
    {
    	file = "core\Auktionshaus";
    	class CAH_Sell {};
    	class CAH_Buy {};
    	class CAH_reciever {};
    	class CAH_getPlayerObj {};
    	class CAH_loadOffers {};
    	class CAH_loadInventory {};
    	class CAH_fetchDetails {};
    	class CAH_loggedIn {};
    };
};
