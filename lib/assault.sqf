_assault = _this select 0;
_group = createGroup east;

_infantrySpawnPoints = [
	"opforInfantrySpawn_0",
	"opforInfantrySpawn_1",
	"opforInfantrySpawn_2",
	"opforInfantrySpawn_3",
	"opforInfantrySpawn_4"
];

_targets = list xiros;
_unitCount = floor(random 5) + 1;

_unitTypes = [
	"O_Soldier_F",    // Rifleman
	"O_Soldier_AR_F", // Automatic rifleman
	"O_Soldier_GL_F", // Grenadier
	"O_soldier_M_F",  // Marksman
	"O_Soldier_LAT_F" // Rifleman (AT)
];

for "_i" from 1 to _unitCount do {
	_unitType = (_unitTypes select floor(random count _unitTypes));

	_unit = _group createUnit [_unitType, [0, 0, 0], _infantrySpawnPoints, 10, "NONE"];
	_unit doTarget (_targets select floor(random count _targets));
	_unit setCombatMode "RED";
};

sleep 10;
[_assault] spawn _assault;
