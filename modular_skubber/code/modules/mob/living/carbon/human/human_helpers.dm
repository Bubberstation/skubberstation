/// Saves our skills to the designated slot.
/mob/living/carbon/human/proc/save_persistent_skills()
	if(!ckey || !mind?.original_character_slot_index)
		return

	var/path = "data/player_saves/[ckey[1]]/[ckey]/skills.sav"
	var/savefile/save = new /savefile(path)
	var/char_index = mind.original_character_slot_index
	var/slot_key = "skills[char_index]"

	if(!save[slot_key])
		save[slot_key] = list()

	for(var/type in mind.known_persistent_skills)
		var/list/data = mind.known_persistent_skills[type]

		save[slot_key][type] = data
