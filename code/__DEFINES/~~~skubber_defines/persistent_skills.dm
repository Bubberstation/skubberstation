// Persistent Persistent_skill levels
#define PERSISTENT_SKILL_LEVEL_NONE 1
#define PERSISTENT_SKILL_LEVEL_DABBLER 2
#define PERSISTENT_SKILL_LEVEL_NOVICE 3
#define PERSISTENT_SKILL_LEVEL_APPRENTICE 4
#define PERSISTENT_SKILL_LEVEL_JOURNEYMAN 5
#define PERSISTENT_SKILL_LEVEL_SKILLED 6
#define PERSISTENT_SKILL_LEVEL_EXPERT 7
#define PERSISTENT_SKILL_LEVEL_MASTER 8
#define PERSISTENT_SKILL_LEVEL_LEGENDARY 9
#define PERSISTENT_SKILL_LEVEL_RENOWNED 10

#define PERSISTENT_SKILL_LVL 1
#define PERSISTENT_SKILL_EXP 2

// Level experience requirements
#define PERSISTENT_SKILL_EXP_NONE 0
#define PERSISTENT_SKILL_EXP_DABBLER 50000
#define PERSISTENT_SKILL_EXP_NOVICE 100000
#define PERSISTENT_SKILL_EXP_APPRENTICE 250000
#define PERSISTENT_SKILL_EXP_JOURNEYMAN 500000
#define PERSISTENT_SKILL_EXP_SKILLED 750000
#define PERSISTENT_SKILL_EXP_EXPERT 900000
#define PERSISTENT_SKILL_EXP_MASTER 1500000
#define PERSISTENT_SKILL_EXP_LEGENDARY 2000000
#define PERSISTENT_SKILL_EXP_RENOWNED 2500000

//Allows us to get EXP from level, or level from EXP
#define PERSISTENT_SKILL_EXP_LIST list(PERSISTENT_SKILL_EXP_NONE, PERSISTENT_SKILL_EXP_NOVICE, PERSISTENT_SKILL_EXP_APPRENTICE, PERSISTENT_SKILL_EXP_JOURNEYMAN, PERSISTENT_SKILL_EXP_EXPERT, PERSISTENT_SKILL_EXP_MASTER, PERSISTENT_SKILL_EXP_LEGENDARY)

//Persistent_skill modifier types
///ideally added/subtracted in speed calculations to make you do stuff faster
#define PERSISTENT_SKILL_SPEED_MODIFIER "persistent_skill_speed_modifier"
///ideally added/subtracted where beneficial in prob(x) calls
#define PERSISTENT_SKILL_PROBS_MODIFIER "persistent_skill_probability_modifier"
///ideally added/subtracted where beneficial in rand(x,y) calls
#define PERSISTENT_SKILL_RANDS_MODIFIER "persistent_skill_randomness_modifier"
///ideally for addittive operations
#define PERSISTENT_SKILL_VALUE_MODIFIER "persistent_skill_value_modifier"

// Gets the reference for the persistent_skill type that was given
#define GetPersistentSkillRef(A) (SSpersistent_skills.all_skills[A])
