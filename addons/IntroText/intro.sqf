//	@file Version: 1.0
//	@file Name: intro.sqf
//	@file Author: Cael817, original file by HellsGateGaming.com and IT07
//	@file Created: 20140724 19:34

_onScreenTime = 8;

sleep 60;

_maxLifetime = ["A3W_vehicleLifetime", 0] call getPublicVar;
_timeInterval = ["A3W_payrollInterval", 30*60] call getPublicVar;


_role1 = "Welcome to Rotten-Banana.com A3Wasteland";
_role1names = ["This server is under continuous configuration. We are doing our best to keep maintenance restarts to a minimum.","Please understand that database resets and errors can occur."];
_role2 = "Server Admins";
_role2names = ["Beefaloaf, L3V1ATH3N, SOBr13n, McGrizzle, KrazyK, Wolf, DredHawk"];
_role3 = "Visit us";
_role3names = ["www.rotten-banana.com"];
_role4 = "Vehicles";
_role4names = [format ["Vehicles remain on the server if used at least once every %1 hours.", _maxLifetime]];
_role5 = "Pay Day";
_role5names = [format ["Rewards every %1 minutes for holding territories.", (_timeInterval / 60)]];
_role6 = "A tip for you...";
_role6names = ["Press END to use ear plugs.  Great for loud vehicles."];
_role7 = "Class Perks: Medic";
_role7names = ["Revive with MedKit.","Heal with MedKit."];
_role8 = "Class Perks: Sniper";
_role8names = ["Perks coming soon."];
_role9 = "Class Perks: Engineer";
_role9names = ["Break into locked vehicles.","Repair vehicles with a ToolKit."];
_role10 = "Class Perks: Diver";
_role10names = ["This class is dumb, and will soon be replaced with something more festive."];

{
sleep 2;
_memberFunction = _x select 0;
_memberNames = _x select 1;
_finalText = format ["<t size='0.50' color='#f2cb0b' align='left'>%1<br /></t>", _memberFunction];
_finalText = _finalText + "<t size='0.70' color='#FFFFFF' align='left'>";
{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
_finalText = _finalText + "</t>";
_onScreenTime + (((count _memberNames) - 1) * 0.5);
[
_finalText,
[safezoneX + safezoneW - 0.8,0.50], //DEFAULT: 0.5,0.35
[safezoneY + safezoneH - 0.8,0.7], //DEFAULT: 0.8,0.7
_onScreenTime,
0.5
] spawn BIS_fnc_dynamicText;
sleep (_onScreenTime);
} forEach [
[_role1, _role1names],
[_role2, _role2names],
[_role3, _role3names],
[_role4, _role4names],
[_role5, _role5names],
[_role6, _role6names],
[_role7, _role7names],
[_role8, _role8names],
[_role9, _role9names],
[_role10, _role10names]
];

