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

diag_log "Successfully loaded the CLiblordmarker/LM module on the client";

DFUNC(markerErstellen) = 
{
	params 
	[
		["_Name",""],
		["_Color",""],
		["_unitscount",0]
	];

	private _markerpool = [];
	
	for "_i" from 0 to _unitscount do 
	{ 
		private _marker = createMarkerLocal [format["%1_%2", _Name, _i], [0,0]];
		_marker setMarkerTypeLocal "mil_triangle";
		_marker setMarkerColorLocal _Color;
		_marker setMarkerSizeLocal [0.8, 0.8];
		_marker setMarkerAlphaLocal 0.6;
		_markerpool pushBack _marker;
	};	
	_markerpool
	
};

["missionStarted", 
{
	diag_log "Marker started";
	
	private _units = playableUnits;
	GVAR(markerpooleast) = [];
	GVAR(markerpoolwest) = [];
	GVAR(unitseast) = [];
	GVAR(unitswest) = [];

	_units apply 
	{ 
		if (side _x isEqualTo west) then
		{
			GVAR(unitswest) pushBack _x;
		};

		if (side _x isEqualTo east) then
		{
			GVAR(unitseast) pushBack _x;
		};
	};

	GVAR(markerpooleast) = ["OPTEAST","colorOPFOR",(count GVAR(unitseast))] call DFUNC(markerErstellen);
	GVAR(markerpoolwest)  = ["OPTWEST","colorBLUFOR",(count GVAR(unitswest))] call DFUNC(markerErstellen);
	
}, []] call CFUNC(addEventHandler); 



GVAR(Unitmarker) = 
[
	{
	private _units = playableUnits;
	private _unitseast = [];
	private _unitswest = [];
	private _unitsdeath = [];
		
	_units apply 
	{ 
		if ((alive _x) and (side _x isEqualTo west)) then
		{
			_unitswest pushBack _x;
		};

		if ((alive _x) and (side _x isEqualTo east)) then
		{
			_unitseast pushBack _x;
		};

		if (!alive _x) then
		{
			_unitsdeath pushBack _x;
		};
	};
	
	for "_i" from 0 to count _unitswest do 
	{ 
		
		(GVAR(markerpoolwest) select _i) setmarkerpos getPosWorld (_unitswest select _i);
		(GVAR(markerpoolwest) select _i) setmarkerdir getdir (_unitswest select _i);
		(GVAR(markerpoolwest) select _i) setMarkerTextLocal format["%1",name (_unitswest select _i)];
	};	

	for "_i" from 0 to count _unitseast do 
	{ 
		
		(GVAR(markerpooleast) select _i) setmarkerpos getPosWorld (_unitseast select _i);
		(GVAR(markerpooleast) select _i) setmarkerdir getdir (_unitseast select _i);
		(GVAR(markerpooleast) select _i) setMarkerTextLocal format["%1",name (_unitseast select _i)];	
	};

	for "_i" from 0 to count _unitsdeath do 
	{ 
		if (side (_unitsdeath select _i) isEqualTo west) then
		{
			(GVAR(markerpoolwest) select _i) setmarkerpos [0,0,0];
			(GVAR(markerpoolwest) select _i) setMarkerTextLocal format["%1",""];
		};

		if (side (_unitsdeath select _i) isEqualTo east) then
		{
			(GVAR(markerpooleast) select _i) setmarkerpos [0,0,0];
			(GVAR(markerpooleast) select _i) setMarkerTextLocal format["%1",""];
		};
	};

	}, 0, []
	
] call CFUNC(addPerFrameHandler);


