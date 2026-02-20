GLOBAL_LIST_INIT(persistent_skill_types, subtypesof(/datum/persistent_skill))

/datum/persistent_skill
	var/name = "Skilling"
	var/title = "Skiller"
	var/desc = "the art of doing things"
	///Dictionary of modifier type - list of modifiers (indexed by level). 100 entries in each list for all 100 skill levels.
	var/modifiers = list(PERSISTENT_SKILL_SPEED_MODIFIER = list(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1))
	///List Path pointing to the skill item reward that will appear when a user finishes leveling up a skill
	var/skill_item_path
	///List associating different messages that appear on level up with different levels (indexed by level/10)
	var/list/levelUpMessages = list()
	///List associating different messages that appear on level down with different levels (indexed by level/10)
	var/list/levelDownMessages = list()

/datum/persistent_skill/proc/get_persistent_skill_modifier(modifier, level)
	return modifiers[modifier][level] //Levels range from 1 to 100

/**
 * new: sets up some lists.
 *
 * Can't happen in the datum's definition because these lists are not constant expressions
 */
/datum/persistent_skill/New()
	. = ..()
	levelUpMessages = list(
		span_nicegreen("What the hell is [name]? Tell an admin if you see this message."),
		span_nicegreen("I'm starting to figure out what [name] really is!"), // Level 10
		span_nicegreen("I'm getting a little better at [name]!"), // Level 20
		span_nicegreen("I'm getting much better at [name]!"), // Level 30
		span_nicegreen("I feel like I've become quite proficient at [name]!"), // Level 40
		span_nicegreen("After lots of practice, I've begun to truly understand the intricacies and surprising depth behind [name]. I now consider myself a master [title]."), // Level 50
		span_nicegreen("My skills at [name] are increasing even further, I'll be renowned in no time..."), // Level 60
		span_nicegreen("My [name] skills have reached an impressive level of expertise!"), // Level 70
		span_nicegreen("I'm approaching the pinnacle of [name] mastery!"), // Level 80
		span_nicegreen("I've nearly perfected my [name] abilities!"), // Level 90
		span_boldnicegreen("Through incredible determination and effort, I've reached the peak of my [name] abilities. I'm finally renowned at [title]!") // Level 100
	)
	levelDownMessages = list(
		span_nicegreen("I have somehow completely lost all understanding of [name]. Please tell an admin if you see this."),
		span_nicegreen("I'm starting to forget what [name] really even is. I need more practice..."),
		span_nicegreen("I'm getting a little worse at [name]. I'll need to keep practicing to get better at it..."),
		span_nicegreen("I'm getting a little worse at [name]..."),
		span_nicegreen("I'm losing my [name] expertise ...."),
		span_nicegreen("I feel like I'm losing my mastery of [name]."),
		span_nicegreen("My [name] expertise seems to be slipping away..."),
		span_nicegreen("I'm losing ground in my [name] abilities!"),
		span_nicegreen("My legendary [name] skills are beginning to deteriorate!"),
		span_nicegreen("I feel as though my legendary [name] skills have deteriorated. I'll need more intense training to recover my lost skills.")
	)

/datum/persistent_skill/proc/level_gained(datum/mind/mind, new_level, old_level, silent)
	if(silent)
		return
	var/message_index = round(new_level / 10)
	to_chat(mind.current, levelUpMessages[message_index])

/datum/persistent_skill/proc/level_lost(datum/mind/mind, new_level, old_level, silent)
	if(silent)
		return
	var/message_index = round(old_level / 10)
	to_chat(mind.current, levelDownMessages[message_index])

/datum/persistent_skill/proc/try_skill_reward(datum/mind/mind, new_level)
	if (new_level != PERSISTENT_SKILL_LEVEL_RENOWNED)
		return
	if (!ispath(skill_item_path))
		to_chat(mind.current, span_nicegreen("My [name] skill is quite impressive, though it seems the Professional [title] Association doesn't have any status symbols to commemorate my abilities with. I should let Centcom and my skilling guild know of this travesty, maybe they can do something about it."))
		return
	if (LAZYFIND(mind.skills_rewarded, src.type))
		to_chat(mind.current, span_nicegreen("It seems the Professional [title] Association won't send me another status symbol."))
		return
	podspawn(list(
		"target" = get_turf(mind.current),
		"style" = /datum/pod_style/advanced,
		"spawn" = skill_item_path,
		"delays" = list(POD_TRANSIT = 150, POD_FALLING = 4, POD_OPENING = 30, POD_LEAVING = 30)
	))
	to_chat(mind.current, span_nicegreen("My universe renowned skill has attracted the attention of the Professional [title] Guild. It seems they are sending me a status symbol to commemorate my abilities."))
	LAZYADD(mind.skills_rewarded, src.type)
