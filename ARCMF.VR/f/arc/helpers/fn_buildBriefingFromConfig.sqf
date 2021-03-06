/*
    Author: Kingsley
    Description: Generate briefing string from the ARCMF config file
    Parameter(s):
        0: SIDE - which side to use
        1: STRING - which category to return
    Returns: String
    Example _missionString = [west, "mission"] call ARC_fnc_buildBriefingFromConfig;
*/

params [
    ["_side", sideUnknown, [sideUnknown, ""]],
    ["_category", "", [""]]
];

private _faction = switch (_side) do {
    case west: {"blufor"};
    case east: {"opfor"};
    case resistance: {"indfor"};
    case civilian: {"civilian"};
    case "gm": {"game_master"};
};

private _output = "";

{
    if (_x != "") then {
        _output = _output + format ["%1<br/><br/>", _x];
    };
} forEach (getArray (missionConfigFile >> "CfgARCMF" >> "briefing" >> _faction >> _category));

_output