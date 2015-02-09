// *******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, AgentRev
//	@file Description: The main init.

#define DEBUG false

enableSaving [false, false];

_descExtPath = str missionConfigFile;
currMissionDir = compileFinal str (_descExtPath select [0, count _descExtPath - 15]);

X_Server = false;
X_Client = false;
X_JIP = false;

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

A3W_scriptThreads = [];

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";

if (!isDedicated) then
{
	[] spawn
	{
		if (hasInterface) then // Normal player
		{
			9999 cutText ["Welcome to [NANA] A3Wasteland, please wait while we publish your social security number...  (initializing)", "BLACK", 0.01];

			waitUntil {!isNull player};
			removeAllWeapons player;
			client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

			// Reset group & side
			[player] joinSilent createGroup playerSide;
			player setVariable ["playerSpawning", true, true];

			execVM "client\init.sqf";
		}
		else // Headless
		{
			waitUntil {!isNull player};
			if (typeOf player == "HeadlessClient_F") then
			{
				execVM "client\headless\init.sqf";
			};
		};
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND SERVER - Initializing Server";
	[] execVM "server\init.sqf";
};

//init 3rd Party Scripts
[] execVM "addons\R3F_LOG\init.sqf";
[] execVM "addons\proving_ground\init.sqf";
[] execVM "addons\scripts\DynamicWeatherEffects.sqf";
[] execVM "addons\JumpMF\init.sqf";
[] execVM "addons\IntroText\intro.sqf";
[] execVM "addons\vactions\functions.sqf";				// Micovery vehicle actions

waitUntil {time > 0};
[] execVM "addons\etv\etv.sqf";
waitUntil {!isNil "EtVInitialized"};
[player] call EtV_Actions;


//0 = [["I_sniper_F","B_sniper_F", "O_sniper_F"],["srifle_GM6_F","srifle_LRR_F", "srifle_EBR_F","arifle_MXM_F"]] execVM "addons\restrict\b2_restrictions.sqf";
//0 = [["I_diver_F","B_diver_F", "O_diver_F"],["arifle_SDAR_F"]] execVM "addons\restrict\b2_restrictions.sqf";
//0 = [["I_engineer_F","B_engineer_F", "O_engineer_F"],["ModuleOrdnanceMortar_F"]] execVM "addons\restrict\b2_restrictions.sqf";