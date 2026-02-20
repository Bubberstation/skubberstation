/*!
This subsystem mostly exists to populate and manage the skill singletons.
*/

SUBSYSTEM_DEF(persistent_skills)
	name = "Persistent Skills"
	flags = SS_NO_FIRE
	///Dictionary of skill.type || skill ref
	var/list/all_skills = list()
	///List of level names with index corresponding to skill level
	var/list/level_names = list("None", "Dabbler", "Novice", "Apprentice", "Journeyman", "Skilled", "Expert", "Master", "Legendary", "Renowned") //List of skill level names. Note that indexes can be accessed like so: level_names[SKILL_LEVEL_NOVICE]

/datum/controller/subsystem/persistent_skills/Initialize()
	InitializePersistentSkills()
	return SS_INIT_SUCCESS

/datum/controller/subsystem/persistent_skills/proc/InitializePersistentSkills()
	for(var/type in GLOB.persistent_skill_types)
		var/datum/persistent_skill/ref = new type
		all_skills[type] = ref
