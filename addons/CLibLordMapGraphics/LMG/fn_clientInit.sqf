// Include the macro-file from the module-root
#include "macros.hpp"

/**
 * CLibLord - clientInit
 * 
 * Author: Raven
 * 
 * Description:
 * Erstellt Marker für alle Spieler und bindet sie an alle Spieler an. 
 * 
 * 
 * Parameter(s):
 * 0: None <Any>
 * 
 * Return Value:
 * None <Any>
 * 
 */

diag_log "Successfully loaded the CLibLord/LMG module on the client";

DFUNC(markerModified1) = 
{
	["M1"] call CFUNC(removeMapGraphicsGroup);

	private _icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";

	private _manIcon = ["ICON", _icon, [1,0,0,1], player, 20, 20, player, "Lord", 1, 0.08, "RobotoCondensed", "right"];
	
	["M1", [_manIcon]] call CFUNC(addMapGraphicsGroup);
};

DFUNC(markerModified2) = 
{
	["M1"] call CFUNC(removeMapGraphicsGroup);

	private _icon = "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

	private _manIcon = ["ICON", _icon, [0,0,1,1], player, 20, 20, player, "Lord", 1, 0.08, "RobotoCondensed", "right"];
	
	["M1", [_manIcon]] call CFUNC(addMapGraphicsGroup);
};

DFUNC(markerModified3) = 
{
	["M1"] call CFUNC(removeMapGraphicsGroup);

	private _icon = "\A3\ui_f\data\map\vehicleicons\iconHelicopter_ca.paa";

	private _manIcon = ["ICON", _icon, [1,1,1,1], player, 20, 20, player, "Lord", 1, 0.08, "RobotoCondensed", "right"];
	
	["M1", [_manIcon]] call CFUNC(addMapGraphicsGroup);
};

DFUNC(markerModified4) = 
{
	["M1"] call CFUNC(removeMapGraphicsGroup);

	private _icon = "\A3\ui_f\data\map\vehicleicons\iconTank_ca.paa";

	private _manIcon = ["ICON", _icon, [1,1,0,1], player, 20, 20, player, "Lord", 1, 0.08, "RobotoCondensed", "right"];
	
	["M1", [_manIcon]] call CFUNC(addMapGraphicsGroup);
};

["missionStarted", {
	diag_log "The mission has started";

	F1 addAction [("<t color=""#F60707"">" + ("Lord Revive") + "</t>"), {[] call FUNC(markerModified1);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Lord Alive") + "</t>"), {[] call FUNC(markerModified2);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Lord heli") + "</t>"), {[] call FUNC(markerModified3);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Lord Tod") + "</t>"), {[] call FUNC(markerModified4);},"", 6, false, true, "", ""];

	#define DEFAULT_ICON "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"

	private _icon = [(configFile >> "CfgVehicles" >> typeOf player >> "Icon"), DEFAULT_ICON, true] call CFUNC(getConfigDataCached);

	private _manIcon = ["ICON", _icon, [0,0,1,1], player, 20, 20, player, name player, 1, 0.08, "RobotoCondensed", "right"];

	private _manIconHover = ["ICON", _icon, [0,0,1,1], player, 20, 20, player, name player, 1, 0.08, "RobotoCondensed", "right"];

	private _manDescription = ["ICON", _icon, [0,1,1,1], player, 20, 20, player, format ["%1 : %2",name player,time], 1, 0.08, "RobotoCondensed", "right"];

	["M1", [_manIcon]] call CFUNC(addMapGraphicsGroup);

	["M1", [_manIcon, _manIconHover, _manDescription], "hover"] call CFUNC(addMapGraphicsGroup);

	["M1", "dblclicked", {systemChat "M1"	
	}, player] call CFUNC(addMapGraphicsEventHandler);
  	
}, []] call CFUNC(addEventHandler); 

GVAR(controlCheck) = 
[
	{
		//Eigender Dialog		
		[{((findDisplay 444001) displayCtrl 10007) call CFUNC(registerMapControl)}, {(!(isNull ((findDisplay 444001) displayCtrl 10007)))}] call CFUNC(waitUntil);	
		
		//BIS Artillery Dialog
		[{((findDisplay -1) displayCtrl 500) call CFUNC(registerMapControl)}, {(!(isNull ((findDisplay -1) displayCtrl 500)))}] call CFUNC(waitUntil);	
		
		//BIS  UAV Dialog (klappt nicht)
	
		[{((findDisplay 160) displayCtrl 51) call CFUNC(registerMapControl)}, {(!(isNull ((findDisplay 160) displayCtrl 51)))}] call CFUNC(waitUntil);	
			
	}, 0, []
	
] call CFUNC(addPerFrameHandler);
