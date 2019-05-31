// Include the macro-file from the module-root
#include "macros.hpp"

/**
 * CLibLord - clientInit
 * 
 * Author: Raven
 * 
 * Description:
 * Test für Datenblocke über API funktion 
 * 
 * 
 * Parameter(s):
 * 0: None <Any>
 * 
 * Return Value:
 * None <Any>
 * 
 */

DUMP("Successfully loaded the CLibLord/LT module on the client");

// Event Liste
#include "Events.hpp"


DFUNC(Datenblock1) = 
{

		private _id = 0;

    	private _markerDatenblock = 
		[
		[0,0,0],
		"normal",
		w1,
		format ["%1",name w1],
		"mil_triangle",
		getdir w1,
		[0,0,1,1]		
		];

		_id = [OPT_ADD_MARKER, _markerDatenblock] call CFUNC(localEvent);
		
		systemChat format ["R:%1",_id];

};

DFUNC(Datenblock2) = 
{

		private _id = 0;

    	private _markerDatenblock = 
		[
		[0,0,0],
		"realtime",
		W2,
		format ["%1",name w2],
		"mil_triangle",
		getdir w2,
		[0,0,1,1]		
		];

		_id = [OPT_ADD_MARKER, _markerDatenblock] call CFUNC(localEvent);
		
		systemChat format ["R:%1",_id];

};

DFUNC(Datenblock3) = 
{

[OPT_SET_MARKER_TEXT, [0,"Ist Tod"]] call CFUNC(localEvent);	

};

DFUNC(Datenblock4) = 
{

[OPT_SET_MARKER_ICON, [0,"loc_Hospital"]] call CFUNC(localEvent);	

};

DFUNC(Datenblock5) = 
{

[OPT_SET_MARKER_ICON, [0,"mil_triangle"]] call CFUNC(localEvent);			

};

["missionStarted", {
	diag_log "CLibLord/LT";

	F1 addAction [("<t color=""#F60707"">" + ("OPTADDMARKER W1") + "</t>"), {[] call FUNC(Datenblock1);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("OPTADDMARKER W2") + "</t>"), {[] call FUNC(Datenblock2);},"", 6, false, true, "", ""];	
	F1 addAction [("<t color=""#F60707"">" + ("OPTSETMARKERTEXT") + "</t>"), {[] call FUNC(Datenblock3);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("OPTSETMARKERICON revive") + "</t>"), {[] call FUNC(Datenblock4);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("OPTSETMARKERICON normal") + "</t>"), {[] call FUNC(Datenblock5);},"", 6, false, true, "", ""];
 	
}, []] call CFUNC(addEventHandler); 

