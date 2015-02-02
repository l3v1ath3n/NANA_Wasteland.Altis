///////////////////////////////////////////////////////////////////////////////////////////////////
//  B2 Weapon Restriction Script v1.01                                                           //
//  Execute from mission init.sqf                                                                //
//  [classesArray,weaponsArray] execVM "scripts\b2_restrictions.sqf";                            //
//  0 = [["B_recon_M_F"],["srifle_GM6_F","srifle_LRR_F"]] execVM "scripts\b2_restrictions.sqf";  //
///////////////////////////////////////////////////////////////////////////////////////////////////

if (isDedicated) exitWith {};

private ["_r_class","_r_weap","_p_weap","_p_weap_base","_p_weap_base2","_p_weap_name","_s_weap","_s_weap_base","_s_weap_base2","_s_weap_name"];

while {true} do
{
  sleep 1;
  _r_class = _this select 0;
  _r_weap = _this select 1;

  _p_weap = primaryWeapon player;
  _p_weap_base = configName(inheritsFrom (configFile >> "CfgWeapons" >> _p_weap));
  _p_weap_base2 = configName(inheritsFrom (configFile >> "CfgWeapons" >> _p_weap_base));
  _p_weap_name = getText(configFile >> "CfgWeapons" >>_p_weap >> "displayName");
  
  _s_weap = secondaryWeapon player;
  _s_weap_base = configName(inheritsFrom (configFile >> "CfgWeapons" >> _s_weap));
  _s_weap_base2 = configName(inheritsFrom (configFile >> "CfgWeapons" >> _s_weap_base));
  _s_weap_name = getText(configFile >> "CfgWeapons" >>_s_weap >> "displayName");
  
  if (((_p_weap in _r_weap) || (_p_weap_base in _r_weap) || (_p_weap_base2 in _r_weap)) && !(typeOf player in _r_class))
  then {
    player removeWeapon _p_weap;
    hint format ["RESTRICTED WEAPON\n\nYou are not qualified\nto use %1",_p_weap_name];
  };
  
  if (((_s_weap in _r_weap) || (_s_weap_base in _r_weap) || (_s_weap_base2 in _r_weap)) && !(typeOf player in _r_class))
  then {
    player removeWeapon _s_weap;
    hint format ["RESTRICTED WEAPON\n\nYou are not qualified\nto use %1",_s_weap_name];
  };
} forEach allUnits;