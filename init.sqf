if (isNil "paramsArray") then { paramsArray = [0] };

if (paramsArray select 0 == 1) then {
	if (isServer) then {
		headlessPresent = true;
		publicVariable "headlessPresent";
	};

	if (!hasInterface && !isServer) then {
		headlessName = name player;
		publicVariable "headlessName";
	};
} else {
	if (isServer) then {
		headlessPresent = false;
		headlessName = "NO_ONE";
		publicVariable "headlessPresent";
		publicVariable "headlessName";
	};
};

if (!isServer) then {
	waitUntil { !isNull player };
};

_assault = compile preprocessFileLineNumbers "lib\assault.sqf";

if (headlessPresent) then {
	if (!hasInterface && !isServer) then {
		// Spawn AI on headless client
		[_assault] spawn _assault;
	};
} else {
	if (isServer) then {
		// Spawn AI on server
		[_assault] spawn _assault;
	};
};
