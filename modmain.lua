PrefabFiles = {
	"pab",
    "fartcloud"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/pab.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/pab.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/pab.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/pab.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/pab_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/pab_silho.xml" ),

    Asset( "IMAGE", "bigportraits/pab.tex" ),
    Asset( "ATLAS", "bigportraits/pab.xml" ),

    Asset( "IMAGE", "images/map_icons/pab.tex" ),
    Asset( "ATLAS", "images/map_icons/pab.xml" ),
	
    Asset( "IMAGE", "images/avatars/avatar_pab.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_pab.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_pab.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_pab.xml" ),

    Asset( "SOUNDPACKAGE", "sound/farts.fev"),
    Asset( "SOUND", "sound/farts.fsb"),
}


-- strings! Any "pab" below would have to be replaced by the prefab name of your character.

-- The character select screen lines
-- note: these are lower-case character name
GLOBAL.STRINGS.CHARACTER_TITLES.pab = "The Ancient PHD"
GLOBAL.STRINGS.CHARACTER_NAMES.pab = "pab"  -- Note! This line is especially important as some parts of the game require
                                            -- the character to have a valid name.
GLOBAL.STRINGS.CHARACTER_DESCRIPTIONS.pab = "*Eat slowly but has great mind strength to write on time.\n*Farts. A lot."
GLOBAL.STRINGS.CHARACTER_QUOTES.pab = "\"Zizi.\""

-- You can also add any kind of custom dialogue that you would like. Don't forget to make
-- categores that don't exist yet using = {}
-- note: these are UPPER-CASE charcacter name
GLOBAL.STRINGS.CHARACTERS.pab = {}
GLOBAL.STRINGS.CHARACTERS.pab.DESCRIBE = {}
GLOBAL.STRINGS.CHARACTERS.pab.DESCRIBE.EVERGREEN = "A template description of a tree."

-- Let the game know pab is a male, for proper pronouns during the end-game sequence.
-- Possible genders here are MALE, FEMALE, or ROBOT
table.insert(GLOBAL.CHARACTER_GENDERS.MALE, "pab")


AddModCharacter("pab")

