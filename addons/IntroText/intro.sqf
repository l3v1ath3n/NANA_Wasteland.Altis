//	@file Version: 1.0
//	@file Name: intro.sqf
//	@file Author: Cael817, original file by HellsGateGaming.com and IT07
//	@file Created: 20140724 19:34

_onScreenTime = 8;

sleep 45;

_role1 = "Welcome to Rotten-Banana.com A3Wasteland";
_role1names = ["This server is under continuous configuration. We are doing our best to keep maintenance restarts to a minimum.","Please understand that database resets and errors can occur."];
_role2 = "Server Admins";
_role2names = ["Beefaloaf, L3V1ATH3N, SOBr13n, McGrizzle, KrazyK, Wolf, DredHawk"];
_role3 = "Visit us";
_role3names = ["www.rotten-banana.com"];
_role4 = "Vehicles";
_role4names = ["Vehicles remain on the server if used at least once every 72 hours."];
_role5 = "Vehicles";
_role5names = ["All locked vehicles can be hot-wired by anyone with the right tools."];
_role6 = "Money";
_role6names = ["Any ATM, is a working ATM. (2,000,000 limit)"];
_role7 = "Pay Day";
_role7names = ["Rewards every 10 minutes for holding territories."];
_role8 = "A tip for you...";
_role8names = ["Press END to use ear plugs.  Great for loud vehicles."];


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
[_role8, _role8names]
];

