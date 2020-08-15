<CONSTANT SKILL-GLOSSARY <LTABLE SKILL-AGILITY SKILL-CHARMS SKILL-CUNNING SKILL-FOLKLORE SKILL-ROGUERY SKILL-SEAFARING SKILL-SPELLS SKILL-STREETWISE SKILL-SWORDPLAY SKILL-THROWING SKILL-UNARMED-COMBAT SKILL-WILDERNESS-LORE>>
<CONSTANT CHARACTERS <LTABLE CHARACTER-AVENGER CHARACTER-SANDEK CHARACTER-CHAKHAM CHARACTER-CABBALIST CHARACTER-SCHNORER CHARACTER-NAZIRITE CHARACTER-SEER>>

<OBJECT CHARACTER-AVENGER
    (DESC "Avenger")
    (SYNONYM AVENGER)
    (LDESC "Your life is dedicated to settling blood feuds. If there is injustice, you are called upon to
even the score")
    (SKILLS <LTABLE SKILL-AGILITY SKILL-STREETWISE SKILL-SWORDPLAY SKILL-UNARMED-COMBAT>)
    (POSSESSIONS <LTABLE SWORD>)
    (LIFE-POINTS 10)
    (MONEY 35)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-SANDEK
    (DESC "Sandek")
    (SYNONYM SANDEK)
    (LDESC "Your ruthlessness and ambition have made you a respected leader of the Godorno
underworld")
    (SKILLS <LTABLE SKILL-ROGUERY SKILL-SEAFARING SKILL-STREETWISE SKILL-SWORDPLAY>)
    (POSSESSIONS <LTABLE SWORD>)
    (LIFE-POINTS 11)
    (MONEY 35)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-CHAKHAM
    (DESC "Chakham")
    (SYNONYM CHAKHAM)
    (LDESC "You have preserved sacred traditions with pride. Now use your skills and wisdom to
become the saviour of your people")
    (SKILLS <LTABLE SKILL-AGILITY SKILL-CHARMS SKILL-FOLKLORE SKILL-UNARMED-COMBAT>)
    (POSSESSIONS <LTABLE MAGIC-AMULET>)
    (LIFE-POINTS 10)
    (MONEY 35)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-CABBALIST
    (DESC "Cabbalist")
    (SYNONYM CABBALIST)
    (LDESC "You have travelled far and wide in the study of magic and now it is time to put your
knowledge to the test")
    (SKILLS <LTABLE SKILL-CHARMS SKILL-FOLKLORE SKILL-SEAFARING SKILL-SPELLS>)
    (POSSESSIONS <LTABLE MAGIC-AMULET MAGIC-WAND>)
    (LIFE-POINTS 11)
    (MONEY 5)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-SCHNORER
    (DESC "Schnorer")
    (SYNONYM SCHNORER)
    (LDESC "You live by your wits, a familiar figure on the streets of Godorno where you are famous
for your audacity")
    (SKILLS <LTABLE SKILL-CUNNING SKILL-ROGUERY SKILL-STREETWISE SKILL-UNARMED-COMBAT>)
    (POSSESSIONS NONE)
    (LIFE-POINTS 10)
    (MONEY 50)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-NAZIRITE
    (DESC "Nazirite")
    (SYNONYM NAZIRITE)
    (LDESC "Your talents derive from your holy vows which endow you with great strength and luck")
    (SKILLS <LTABLE SKILL-CHARMS SKILL-CUNNING SKILL-SWORDPLAY SKILL-WILDERNESS-LORE>)
    (POSSESSIONS <LTABLE MAGIC-AMULET SWORD>)
    (LIFE-POINTS 11)
    (MONEY 20)
    (FLAGS PERSONBIT)>

<OBJECT CHARACTER-SEER
    (DESC "Seer")
    (SYNONYM SEER)
    (LDESC "Your life amounted to nothing until the angel Raziel appeared to you in a vision and
granted you second sight")
    (SKILLS <LTABLE SKILL-CUNNING SKILL-ROGUERY SKILL-SPELLS SKILL-SWORDPLAY>)
    (POSSESSIONS <LTABLE MAGIC-AMULET SWORD>)
    (LIFE-POINTS 10)
    (MONEY 5)
    (FLAGS PERSONBIT)>

<OBJECT SKILL-AGILITY
    (DESC "AGILITY")
    (LDESC "The ability to perform acrobatic feats, run, climb, balance and leap. A character with this skill is nimble and dexterous")>

<OBJECT SKILL-CHARMS
    (DESC "CHARMS")
    (LDESC "The expert use of magical wards to protect you from danger. Also includes that most elusive of qualities. luck. You must possess a magic amulet to use this skill")
    (REQUIRES <LTABLE MAGIC-AMULET>)>

<OBJECT SKILL-CUNNING
    (DESC "CUNNING")
    (LDESC "The ability to think on your feet and devise clever schemes for getting out of trouble. Useful in countless situations")>

<OBJECT SKILL-FOLKLORE
    (DESC "FOLKLORE")
    (LDESC "Knowledge of myth and legend, and how best to deal with supernatural menaces such as garlic against vampires, silver bullets against a werewolf, and so on")>

<OBJECT SKILL-ROGUERY
    (DESC "ROGUERY")
    (LDESC "The traditional repertoire of a thief's tricks: picking pockets, opening locks, and skulking unseen in the shadows")>

<OBJECT SKILL-SEAFARING
    (DESC "SEAFARING")
    (LDESC "Knowing all about life at sea, including the ability to handle anything from a rowing boat right up to a large sailing ship")>

<OBJECT SKILL-SPELLS
    (DESC "SPELLS")
    (LDESC "A range of magical effects encompassing illusions, elemental effects, commands, and summonings. You must possess a magic wand to use this skill")
    (REQUIRES <LTABLE MAGIC-WAND>)>

<OBJECT SKILL-STREETWISE
    (DESC "STREETWISE")
    (LDESC "With this skill you are never at a loss in towns and cities. What others see as the squalor and menace of narrow cobbed streets is home to you")>

<OBJECT SKILL-SWORDPLAY
    (DESC "SWORDPLAY")
    (LDESC "The best fighting skill. You must possess a sword to use this skill")
    (REQUIRES <LTABLE SWORD>)>

<OBJECT SKILL-THROWING
    (DESC "THROWING")
    (LDESC "The skill of hitting things accurately with things you throw. You must possess a knife to use this skill")
    (REQUIRES <LTABLE KNIFE>)>

<OBJECT SKILL-UNARMED-COMBAT
    (DESC "UNARMED COMBAT")
    (LDESC "Fisticuffs, wrestling holds, jabs and kicks, and the tricks of infighting. Not as effective as SWORDPLAY, but you do not need weapons - your own body is the weapon!")>

<OBJECT SKILL-WILDERNESS-LORE
    (DESC "WILDERNESS LORE")
    (LDESC "A talent for survival in the wild - whether it be forest, desert, swamp or mountain peak")>

<OBJECT CHARACTER-CUSTOM
    (DESC "Custom Character")
    (SYNONYM CHARACTER)
    (ADJECTIVE CUSTOM)
    (LDESC "Custom character with user selected skills")
    (LIFE-POINTS 10)
    (MONEY 50)
    (FLAGS PERSONBIT NARTICLEBIT)>
