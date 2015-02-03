///////////////////////////////////////////////////////////////////////////////////////////////////
//  B2 Weapon Restriction Script v1.01                                                           //
//  Execute from mission init.sqf                                                                //
//  [classesArray,weaponsArray] execVM "scripts\b2_restrictions.sqf";                            //
//  0 = [["B_recon_M_F"],["srifle_GM6_F","srifle_LRR_F"]] execVM "scripts\b2_restrictions.sqf";  //
///////////////////////////////////////////////////////////////////////////////////////////////////

if (isDedicated) exitWith {};

private ["_r_class","_r_weap","_c_weap","_c_weap_base","_c_weap_base2","_c_weap_name"];

while {true} do
{
	sleep 1;
	_r_class = _this select 0;
	_r_weap = _this select 1;

	_c_weap = currentWeapon player;
	_c_weap_base = configName(inheritsFrom (configFile >> "CfgWeapons" >> _c_weap));
	_c_weap_base2 = configName(inheritsFrom (configFile >> "CfgWeapons" >> _c_weap_base));
	_c_weap_name = getText(configFile >> "CfgWeapons" >>_c_weap >> "displayName");
  
	if (((_c_weap in _r_weap) || (_c_weap_base in _r_weap) || (_c_weap_base2 in _r_weap)) && !(typeOf player in _r_class)) then 
	{
		//player removeWeapon _c_weap;
		player action ["SwitchWeapon", player, player, 100];
		hint format ["RESTRICTED WEAPON\n\nYou are not the correct\nclass to use\n%1",_c_weap_name];
	};

} forEach allUnits;