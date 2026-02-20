/// Saves skills for every character.
/datum/controller/subsystem/persistence/proc/save_persistent_skills()
	for(var/i in GLOB.joined_player_list)
		var/mob/living/carbon/human/ending_human = get_mob_by_ckey(i)
		if(!istype(ending_human) || !ending_human.mind?.original_character_slot_index)
			continue

		var/mob/living/carbon/human/original_human = ending_human.mind.original_character.resolve()

		if(!original_human)
			continue

		original_human.save_persistent_skills()

/datum/controller/subsystem/persistence/proc/load_persistent_skills(key, type, char_index)
	var/path = "data/player_saves/[key[1]]/[key]/skills.sav"
	var/savefile/save = new /savefile(path)
	var/slot_key = "skills[char_index]"

	log_game("LOADING skill [type] for [key] at slot [char_index]")

	if(!save[slot_key])
		log_game("Slot key missing")
		return null

	if(!save[slot_key][type])
		log_game("Skill [type] missing")
		return null

	return save[slot_key][type]
