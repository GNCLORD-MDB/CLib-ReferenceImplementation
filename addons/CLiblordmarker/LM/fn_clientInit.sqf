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

FUNC(markerErstellen) = 
{
	params 
	[
		["_Name",""],
		["_Color",""],
		["_units",""]
	];

	private _markerpool = [];
	
	for "_i" from 0 to _units do 
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
	markerpooleast = [];
	markerpoolwest = [];
	unitseast = [];
	unitswest = [];

	for "_i" from 0 to count _units do 
	{ 
		if (side (_units select _i) isEqualTo west) then
		{
			unitswest pushBack (_units select _i);
		};

		if (side (_units select _i) isEqualTo east) then
		{
			unitseast pushBack (_units select _i);
		};
	};

	markerpooleast = ["OPTEAST","colorOPFOR",(count unitseast)] call FUNC(markerErstellen);
	markerpoolwest = ["OPTWEST","colorBLUFOR",(count unitswest)] call FUNC(markerErstellen);
	
}, []] call CFUNC(addEventHandler); 



GVAR(Unitmarker) = 
[
	{
	private _units = playableUnits;
	private _unitseast = [];
	private _unitswest = [];
	private _unitsdeath = [];
		
	for "_i" from 0 to count _units do 
	{ 
		if ((alive (_units select _i)) and (side (_units select _i) isEqualTo west)) then
		{
			_unitswest pushBack (_units select _i);
		};

		if ((alive (_units select _i)) and (side (_units select _i) isEqualTo east)) then
		{
			_unitseast pushBack (_units select _i);
		};

		if (!alive (_units select _i)) then
		{
			_unitsdeath pushBack (_units select _i);
		};
	};
	
	for "_i" from 0 to count _unitswest do 
	{ 
		
		(markerpoolwest select _i) setmarkerpos getPosWorld (_unitswest select _i);
		(markerpoolwest select _i) setmarkerdir getdir (_unitswest select _i);
		(markerpoolwest select _i) setMarkerTextLocal format["%1",name (_unitswest select _i)];
	};	

	for "_i" from 0 to count _unitseast do 
	{ 
		
		(markerpooleast select _i) setmarkerpos getPosWorld (_unitseast select _i);
		(markerpooleast select _i) setmarkerdir getdir (_unitseast select _i);
		(markerpooleast select _i) setMarkerTextLocal format["%1",name (_unitseast select _i)];	
	};

	for "_i" from 0 to count _unitsdeath do 
	{ 
		if (side (_units select _i) isEqualTo west) then
		{
			(markerpoolwest select _i) setmarkerpos [0,0,0];
			(markerpoolwest select _i) setMarkerTextLocal format["%1",""];
		};

		if ((_units select _i) isEqualTo east) then
		{
			(markerpooleast select _i) setmarkerpos [0,0,0];
			(markerpooleast select _i) setMarkerTextLocal format["%1",""];
		};
	};

	}, 0, []
	
] call CFUNC(addPerFrameHandler);


