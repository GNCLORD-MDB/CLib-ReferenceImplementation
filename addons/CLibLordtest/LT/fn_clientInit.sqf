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

private _block = ["M1","Spieler",[1,1,1,1],"Haus",1,(getpos H1),45];

GVAR(Testruckgabe) = [_block] call OFUNC(dynmarkerverwaltung,markererstellenNormal);
};

DFUNC(Datenblock2) = 
{
GVAR(Testruckgabe) = [];

private _block = ["M2","Spieler",[1,1,1,1],"Haus",1,getpos H2,45];

GVAR(Testruckgabe) = [_block] call OFUNC(dynmarkerverwaltung,markererstellenNormal);

};

DFUNC(Datenblock3) = 
{
GVAR(Testruckgabe) = [];

private _block = ["M3","Spieler",[1,1,1,1],"Haus",1,getpos H3,45];

GVAR(Testruckgabe) = [_block] call OFUNC(dynmarkerverwaltung,markererstellenNormal);

};

DFUNC(Datenblock4) = 
{
GVAR(Testruckgabe) = [];

private _block = ["M4","Spieler",[1,1,1,1],"Haus",1,getpos H4,45];

GVAR(Testruckgabe) = [_block] call OFUNC(dynmarkerverwaltung,markererstellenNormal);

};

["missionStarted", {
	diag_log "The mission has started";

	F1 addAction [("<t color=""#F60707"">" + ("Datenblock 1") + "</t>"), {[] call FUNC(Datenblock1);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Datenblock 2") + "</t>"), {[] call FUNC(Datenblock2);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Datenblock 3") + "</t>"), {[] call FUNC(Datenblock3);},"", 6, false, true, "", ""];
	F1 addAction [("<t color=""#F60707"">" + ("Datenblock 4") + "</t>"), {[] call FUNC(Datenblock4);},"", 6, false, true, "", ""];
 	
}, []] call CFUNC(addEventHandler); 

