_assault = _this select 0;
_group = createGroup east;
_targets = list xiros;

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

// Scale the number of spawned units to the active player count
_liveTargets = { alive _x } count _targets;
_spawnCount = floor(random (_liveTargets * 2)) + 1;

for "_i" from 1 to _spawnCount do {
	_unitType = (_infantryUnitTypes select floor(random count _infantryUnitTypes));

	_unit = _group createUnit [_unitType, [0, 0, 0], _infantrySpawnPoints, 10, "NONE"];
	_unit doTarget (_targets select floor(random count _targets));
	_unit setCombatMode "RED";
};

sleep 10;
[_assault] spawn _assault;
