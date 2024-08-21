extends Node

enum {PYRO, HYDRO, EARTH, LIGHTNING, FLORA, ALLOY, PRISMATIC, WANED, NONE, ALL}

var int2str: Dictionary = {
	PYRO: "Pyro",
	HYDRO: "Hydro",
	EARTH: "Earth",
	LIGHTNING: "Lightning",
	FLORA: "Flora",
	ALLOY: "Alloy",
	PRISMATIC: "Prismatic",
	WANED: "Waned",
	NONE: "Nothing",
	ALL: "Everything"
}

var strengths: Dictionary = {
	PYRO: [FLORA, ALLOY],
	HYDRO: [PYRO, EARTH],
	EARTH: [PYRO, LIGHTNING],
	LIGHTNING: [HYDRO, ALLOY],
	FLORA: [HYDRO, LIGHTNING],
	ALLOY: [EARTH, FLORA],
	PRISMATIC: [ALL],
	WANED: [NONE]
}

var weaknesses: Dictionary = {
	PYRO: [HYDRO, EARTH],
	HYDRO: [LIGHTNING, FLORA],
	EARTH: [HYDRO, ALLOY],
	LIGHTNING: [EARTH, FLORA],
	FLORA: [PYRO, ALLOY],
	ALLOY: [PYRO, LIGHTNING],
	PRISMATIC: [NONE],
	WANED: [ALL]
}
