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

	private _icon = "\CLibLordMapGraphics\LMG\sani2.paa";

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

	private _icon = "\CLibLordMapGraphics\LMG\vehiclegui_ca.paa";

	private _manIcon = ["ICON", _icon, [1,0,0,1], player, 20, 20, player, "Lord", 1, 0.08, "RobotoCondensed", "right"];
	
	["M1", [_manIcon]] call CFUNC(addMapGraphicsGroup);
};

["missionStarted", {
	diag_log "The mission has started";

	F1 addAction [("<t color=""#F60707"">" + ("Lord Revive") + "</t>"), {[] call FUNC(markerModified1);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Lord Alive") + "</t>"), {[] call FUNC(markerModified2);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Lord Tod") + "</t>"), {[] call FUNC(markerModified3);},"", 6, false, true, "", ""];

	#define DEFAULT_ICON "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa"

	private _icon = [(configFile >> "CfgVehicles" >> typeOf player >> "Icon"), DEFAULT_ICON, true] call CFUNC(getConfigDataCached);

	private _manIcon = ["ICON", _icon, [0,0,1,1], player, 20, 20, player, "Lord", 1, 0.08, "RobotoCondensed", "right"];

	private _manIconHover = ["ICON", "\a3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa", [0.85,0.85,0,0.5], player, 25, 25, player, "", 1, 0.08, "RobotoCondensed", "right"];

	private _manDescription = ["ICON", "a3\ui_f\data\Map\Markers\System\dummy_ca.paa", [1, 1, 1, 1], player, 22, 22, 0, name player, 2];

	["M1", [_manIcon]] call CFUNC(addMapGraphicsGroup);

	["M1", [_manIcon, _manIconHover, _manDescription], "hover"] call CFUNC(addMapGraphicsGroup);

	["M1", "dblclicked", {systemChat "M1"	
	}, player] call CFUNC(addMapGraphicsEventHandler);

	//[10007] call CFUNC(registerMapControl);

		
}, []] call CFUNC(addEventHandler); 




