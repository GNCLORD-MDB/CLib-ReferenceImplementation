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

diag_log "Successfully loaded the CLibLord/LT module on the client";

DFUNC(Datenblock1) = 
{
GVAR(Testruckgabe) = [];

private _block = ["M1","Spieler",[0,0,1,1],"Haus",1,(getpos H1),45];

GVAR(Testruckgabe) = [_block] call OFUNC(markererstellenNormal);

systemChat format ["R:%1",GVAR(Testruckgabe)];

};

DFUNC(Datenblock2) = 
{
GVAR(Testruckgabe) = [];

private _block = ["M1"];

GVAR(Testruckgabe) = [_block] call OFUNC(markerloschen);

systemChat format ["R:%1",GVAR(Testruckgabe)];

};

DFUNC(Datenblock3) = 
{
GVAR(Testruckgabe) = [];

private _block = ["M1"];

GVAR(Testruckgabe) = [_block] call OFUNC(markerloschen);

private _block = ["M1","Revive",[1,0,0,1],"Haus getötet",1,getpos H3,150];

GVAR(Testruckgabe) = [_block] call OFUNC(markererstellenNormal);

systemChat format ["R:%1",GVAR(Testruckgabe)];

};

DFUNC(Datenblock4) = 
{
GVAR(Testruckgabe) = [];

private _block = ["M4","Spieler",[1,1,1,1],"Haus",1,getpos H4,45,"60s"];

GVAR(Testruckgabe) = [_block] call OFUNC(markererstellenHover);

systemChat format ["R:%1",GVAR(Testruckgabe)];

};

["missionStarted", {
	diag_log "The mission has started";

	F1 addAction [("<t color=""#F60707"">" + ("Marker erstellen") + "</t>"), {[] call FUNC(Datenblock1);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Marker löschen") + "</t>"), {[] call FUNC(Datenblock2);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Marker ändern") + "</t>"), {[] call FUNC(Datenblock3);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Marker Hover erstellen") + "</t>"), {[] call FUNC(Datenblock4);},"", 6, false, true, "", ""];
 	
}, []] call CFUNC(addEventHandler); 

