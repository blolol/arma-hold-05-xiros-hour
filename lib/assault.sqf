/*
 * Arguments:
 *
 * _this select 0 #=> This compiled script.
 * _this select 1 #=> Array of all OPFOR infantry units spawned by this script.
 */
_assault = _this select 0;
_infantryUnits = _this select 1;

_infantrySpawnPoints = [
	"opforInfantrySpawn_0",
	"opforInfantrySpawn_1",
	"opforInfantrySpawn_2",
	"opforInfantrySpawn_3",
	"opforInfantrySpawn_4"
];

_infantryUnitTypes = [
	"O_Soldier_F",    // Rifleman
	"O_Soldier_AR_F", // Automatic rifleman
	"O_Soldier_GL_F", // Grenadier
	"O_soldier_M_F",  // Marksman
	"O_Soldier_LAT_F" // Rifleman (AT)
];

/*
 * Scale the number of spawned infantry units to the active player count.
 *
 * The server will attempt to maintain a maximum of _maxInfantryUnits live infantry
 * firing on the players, and no more than _maxSpawnCount infantry spawned per wave.
 */
_targets = list xiros;
_liveTargets = { alive _x } count _targets;
_liveInfantryUnits = { alive _x } count _infantryUnits;

_maxInfantryUnits = _liveTargets * 5;
_maxSpawnCount = _maxInfantryUnits - _liveInfantryUnits;
_spawnCount = floor(random _maxSpawnCount) + 1;

_group = createGroup east;

for "_i" from 1 to _spawnCount do {
	_unitType = (_infantryUnitTypes select floor(random count _infantryUnitTypes));
	_unit = _group createUnit [_unitType, [0, 0, 0], _infantrySpawnPoints, 10, "NONE"];

	_unit setSkill ["aimingAccuracy", 0.15];
	_unit setSkill ["aimingShake", 0.15];
	_unit setSkill ["aimingSpeed", 0.15];
	_unit setSkill ["spotDistance", 1];
	_unit setSkill ["spotTime", 1];
	_unit setSkill ["reloadSpeed", 0.5];

	_unit doTarget (_targets select floor(random count _targets));
	_unit setCombatMode "RED";

	_infantryUnits set [count _infantryUnits, _unit];
};

sleep 10;
[_assault, _infantryUnits] spawn _assault;
