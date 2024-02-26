<INSERT-FILE "gamebook">

<GLOBAL STARTING-POINT PROLOGUE>

<ROUTINE RESET-OBJECTS ()
	<PUTP ,KNIFE ,P?QUANTITY 1>>

<ROUTINE RESET-STORY ()
	<PUTP ,STORY003 ,P?DEATH T>
	<PUTP ,STORY005 ,P?DEATH T>
	<PUTP ,STORY014 ,P?DEATH T>
	<PUTP ,STORY016 ,P?DEATH T>
	<PUTP ,STORY052 ,P?DEATH T>
	<PUTP ,STORY061 ,P?DEATH T>
	<PUTP ,STORY074 ,P?DEATH T>
	<PUTP ,STORY106 ,P?DEATH T>
	<PUTP ,STORY121 ,P?DEATH T>
	<PUTP ,STORY123 ,P?DEATH T>
	<PUTP ,STORY130 ,P?DEATH T>
	<PUTP ,STORY135 ,P?DEATH T>
	<PUTP ,STORY143 ,P?DEATH T>
	<PUTP ,STORY149 ,P?DEATH T>
	<PUTP ,STORY170 ,P?DEATH T>
	<PUTP ,STORY176 ,P?DEATH T>
	<PUTP ,STORY182 ,P?DEATH T>
	<PUTP ,STORY184 ,P?DEATH T>
	<PUTP ,STORY224 ,P?DEATH T>
	<PUTP ,STORY226 ,P?DEATH T>
	<PUTP ,STORY263 ,P?DEATH T>
	<PUTP ,STORY271 ,P?DEATH T>
	<PUTP ,STORY278 ,P?DEATH T>
	<PUTP ,STORY282 ,P?DEATH T>
	<PUTP ,STORY283 ,P?DEATH T>
	<PUTP ,STORY296 ,P?DEATH T>
	<PUTP ,STORY338 ,P?DEATH T>
	<PUTP ,STORY363 ,P?DEATH T>
	<PUTP ,STORY389 ,P?DEATH T>>

<CONSTANT HEALING-KEY-CAPS !\U>

<CONSTANT HEALING-KEY !\u>

<ROUTINE SPECIAL-INTERRUPT-ROUTINE (KEY)
	<COND (<AND <EQUAL? .KEY ,HEALING-KEY-CAPS ,HEALING-KEY> <CHECK-ITEM ,HEALING-SALVE> <L? ,LIFE-POINTS ,MAX-LIFE-POINTS>>
		<CRLF>
		<TELL CR "Use " T ,HEALING-SALVE " to restore 1 life point?">
		<COND (<YES?>
			<GAIN-LIFE 1>
			<LOSE-ITEM ,HEALING-SALVE>
		)>
		<RTRUE>
	)>
	<RFALSE>>

<CONSTANT PROLOGUE-TEXT "You are down on your luck, but you will not swallow your pride and look for a job. Every day a throng of hopefuls gathers outside the rich palazzi of the riverfront. Others seek to join a trader's caravan as a guide or guard. Those turned away drift at last to the seaweed-stinking waterfront to become rowers in the fleet and begin a life no better than slavery.||In your heart you know that your destiny, the destiny of a Judain, is greater than this. Not for nothing have you toiled to learn your skills. Now you are without peer among your people. One thing only you lack: a sense of purpose, a quest to show the world your greatness and put your skills to the test.||The city of Godorno is a stinking cesspit. The Judain are not wanted here. Your people are rich but the pale ones of Godorno covet those riches. \"Usurers, thieves,\" they cry as your people walk the streets going about their daily business.||The Overlord stokes the fire of discontent. When those who speak out against his cruel reign disappear, never to be seen again, he blames the Judai,n. When people starve because he sells the harvest to the westerners for jewels and silks, his minions say it is the Judain who profit from his peoples' wretchedness. Now the people hate you and all your kind. Soon it will not be safe to walk the streets. The caravan lines are swelled by tall proud Judain slaves with their glittering black eyes, backs bent under casks of spices and bolts of silk.||In the past two centuries Godorno has become a byword for decadence, luxury and idle pleasure. Everywhere you look you see the insignia of the winged lion, once the proud standard of the city's legions. Now it stands as the very symbol of corruption and evil.">

<ROOM PROLOGUE
	(DESC "PROLOGUE")
	(STORY PROLOGUE-TEXT)
	(CONTINUE STORY001)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT001 "Walk the streets you must, for there is no food and nothing to be gained from idling here in the hovel you call home. You push the rotten front door open gently. There is a wet cracking noise and it splinters, coming off its hinges. You jump past into Copper Street as it falls into the street and breaks. It is beyond repair.||Even before you turn the corner of the narrow mired street a prowling thief, a sewer rat escaped from the fleet, is going into your home. Let him. You are carrying everything you own. He will find nothing but tick-ridden blankets and a leaking earthenware pot or two.||As you turn your back on the grey stone shacks of Copper Street a youth, gangling and pasty-faced, spits in your eye and calls out \"Judain scum.\" The boy is beneath notice. He sneers with his nose in the air, like the rich folk of the riverfront, but his sailcloth breeches are out at the knees. His father is probably a tanner or a tinker or some such.||Your time in Godorno has taught you to ignore such insults.">
<CONSTANT CHOICES001 <LTABLE "round on him because you cannot stand this treatment any longer" "walk on, humbly wiping the spittle from your cheek">>

<ROOM STORY001
	(DESC "001")
	(STORY TEXT001)
	(CHOICES CHOICES001)
	(DESTINATIONS <LTABLE STORY033 STORY048>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT002 "You run on, leaving your pursuers fifty yards or so behind, though looking back you see the youth running ahead of them. You hurtle into the square and attempt to lose yourself in a gathering throng. A large walled flowerbed encircles a rare sight. It is a greenbark tree, eighty feet tall. The smooth bark is striped lime green and grey-green and the heart-shaped leaves are golden yellow. There is a shrine here to the tree spirit with a few offerings of potash and wine.||Next to the shrine is the town crier dressed in the traditional black and gold tabard. He unfurls a scroll and begins to declaim to the gathered crowd. He is flanked by a bodyguard of the Overlord's men armoured in black leather. You push forward to hear better.">

<ROOM STORY002
	(DESC "002")
	(STORY TEXT002)
	(CONTINUE STORY254)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT003 "As nightfall approaches and a thunderstorm brews, you leave the road to find shelter in a copse of trees. But you are destined to sleep under better than a canopy of leaves -- hidden among the trees is a dilapidated cottage by a well. The dwelling's solid, green-tiled roof alone will mean you'll not get wet tonight.||The well is an even more welcome sight; you have fled Godorno ill-prepared and have travelled most of the day without a single drink. Drawing water from the well, you drink deeply.||On entering the rude shelter, you find it is empty but largely clean, with no signs of recent habitation by men or animals. Making yourself as comfortable as you can on the hard-packed earth floor you settle down to sleep.||When you awake in the morning, however, you feel strangely feverish. The trials of your journey might have been too much for you and perhaps you have sunstroke. Or did you dehydrate too much, and that refreshing drink come too late? There again, perhaps the water from the well is tainted, though to you it was as sweet as honeyed wine upon the tongue.||Such thoughts plague your mind as you sink deeper into delirium, restlessly tossing and turning on the cottage's floor. A kind of madness possesses you, and you are sure that several times you run out into the copse in search of food, grasping at and eating anything that seems remotely edible. How many days must you be gripped by the. coils of madness that threaten to destroy your mind and body?">

<ROOM STORY003
	(DESC "003")
	(STORY TEXT003)
	(PRECHOICE STORY003-PRECHOICE)
	(CONTINUE STORY015)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY003-PRECHOICE ()
	<TEST-MORTALITY ,DIED-GREW-WEAKER ,STORY003>>

<CONSTANT TEXT004 "The road leading up to Greenbank Plaza has been renamed the Avenue of Skulls. At regular intervals posts have been erected from which iron cages swing. Inside the cages are executed Judain. Hundreds have been slain. The smell of rank corruption has drawn clouds of flies. Nearby you hear the clang of a bell and a dolorous voice calling, \"Bring out your dead. Bring out your dead.\"||The plague has struck Godorno like a ravaging scourge. No respecter of a man's station, it has carried off nobleman and beggar alike. The streets have not been swept for what must have been weeks. Refuse is piling up in drifts in the wind. There is a blank look of despair on the faces of the people you pass and even the guards seem too preoccupied to notice a Judain. The sun is drawing the humours from the city like the fumes from a witch's kettle by the time you turn the corner into Copper Street.||You return to the hovel which you used to call home. You can use it as a base to see if you can contact some of your fellow Judain and learn what has taken place in the city. The old door has been broken up and used for firewood. There is nobody and nothing in the hovel -- but did you hear voices from beneath the trap door that leads to the hidden cellar?">
<CONSTANT CHOICES004 <LTABLE "fling the trap door open" "knock first">>

<ROOM STORY004
	(DESC "004")
	(STORY TEXT004)
	(CHOICES CHOICES004)
	(DESTINATIONS <LTABLE STORY061 STORY046>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT005 "Hate shrieks -- a cry of insensate fury as it sees you charging back to slice at it with your enchanted blade. In a welter of carnage, you and your monstrous foe lock in mortal combat. The green-tinted metal of your blade chops deep into Hate's soft purulent flesh, while its tentacles slap into you with stunning force. Those baleful green eyes gleam with a new emotion now -- not hatred and unreasoning violence, but the liquid gleam of fear. Hate knows that it is going to die today. But it sells its life dearly.">

<ROOM STORY005
	(DESC "005")
	(STORY TEXT005)
	(PRECHOICE STORY005-PRECHOICE)
	(CONTINUE STORY416)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY005-PRECHOICE ("AUX" (DAMAGE 9))
	<COND (<CHECK-SKILL ,SKILL-CHARMS>
		<SET DAMAGE 6>
	)>
	<TEST-MORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY005>
	<COND (<NOT <IS-ALIVE>>
		<STORY-JUMP ,STORY017>
	)>>

<CONSTANT TEXT006 "You spend much of the day poring over your battle plans with the heads of the resistance. Not only other Judain have rallied to your cause. Now you have many people who have equally good cause to fight the Overlord -- those whose families have been starved by his harsh taxes or abused by his brutish soldiers.|| Some time after noon, as you are explaining the tactics for the final pitched battle to decide the fate of the city, a little street urchin brings news that Lucie's house has collapsed. She is feared dead.">
<CONSTANT CHOICES006 <LTABLE "go to see if you can do anything" "carry on making your plans for the battle">>

<ROOM STORY006
	(DESC "006")
	(STORY TEXT006)
	(CHOICES CHOICES006)
	(DESTINATIONS <LTABLE STORY210 STORY195>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT007 "On your way to meet Lucie the next day, you notice bushels of red flowers bobbing on the surface of the Circle Canal and wander over to the edge to look. On closer inspection they look like pieces of meat. An uneasy feeling steals over you as you realize they are human hearts, hundreds of them, bobbing on the surface, waiting for the carrion crows. These cannot be the hearts of the slaughtered Judain, for your people hang in iron cages and their chests are still intact.||When you arrive at the Garden of Statues, Lucie is there, looking as pretty as ever. She pretends not to have seen you and walks down the deserted street towards a dog-handler who has a gigantic deerhound straining at a leash. Perhaps Lucie doesn't want to give you away, in which case she is being very streetwise. You can stay hidden here but the dog seems to have picked up your scent and barks excitedly. What is it that makes bloodhounds bark so? Is the dog already imagining sinking his teeth into soft manfiesh?||Lucie may have some plan.">
<CONSTANT CHOICES007 <LTABLE "wait to see what she does" "break cover and walk out into the street">>

<ROOM STORY007
	(DESC "007")
	(STORY TEXT007)
	(CHOICES CHOICES007)
	(DESTINATIONS <LTABLE STORY027 STORY039>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT008 "The brigands strip you of everything useful and ride off down the trade road, leaving you nothing. There is much mirth at your plight and a certain amount of cursing that you are so poor. \"This one's gear will hardly pay for the horseshoe metal we wasted in the chase,\" grumbles one of them.||It is obvious these men will forget about you as soon as you are out of sight, just another victim on the road. At least they haven't harmed you.||You are more fortunate later, however. Your journey to Bagoe on the Palayal river is charmed. You find food dropped in a sack by the side of the path and are treated to a beer at an inn. At Bagoe you are welcomed aboard a barge and the bargees promise to hide you when you near Godorno. They say you will easily be able to slip ashore, unseen, in the dead of night.||They are as good as their word and one fine dawn you find yourself back in Godorno, with the wharfs and warehouses behind you and the city befqre you. The revetments of the buildings lend the city an unmistakable air of patrician hauteur. This is the hub of the civilized world.">

<ROOM STORY008
	(DESC "008")
	(STORY TEXT008)
	(PRECHOICE STORY008-PRECHOICE)
	(CONTINUE STORY300)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY008-PRECHOICE ()
	<RESET-POSSESSIONS>
	<SETG ,MONEY 0>>

<CONSTANT TEXT009 "The centre of this corridor has a series of holes covered by metal grilles down its length. The stench of human decay rises from each of them. These are the oubliettes: holes which prisoners who have lost the power to entertain under torment are thrown down. They are forgotten there and left to rot.||This whole place fills you with horror at man's inhumanity to his fellow man. Your heart flutters at the thought of the plight of the Judain who are locked away here. You only hope they are not down the oubliettes.||There is a loud slurping noise from another corridor. A waft of sweet cloying scent like roses and honeysuckle bathes you. Is that the monster Hate advancing to claim you and draw you in to the orgy of despair? How are you going to face up to Hate in all its majestic horror? You are just one poor Judain, about to go the way of so many of your kind. A heavy squelching and rubbing, like chafing rubber, announces that Hate is about to turn the corner before you. You decide better of facing Hate alone and flee down a side corridor.">

<ROOM STORY009
	(DESC "009")
	(STORY TEXT009)
	(CONTINUE STORY072)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT010 "You speak the word of power and throw your ha,nds wide in a dramatic gesture that releases the power of the planes beyond. There is a whoof and a cloud of thick green fog fills the room. There are no windows and the door is shut behind you. There is no escape. The occult fog is killing the snakes but it is also causing you to retch with nausea and you fall onto the serpents which writhe beneath you and sink their envenomed fangs into your soft flesh. The poison of the garter snake is virulent indeed and you are soon dead. There is no one left to save the Judain now.">

<ROOM STORY010
	(DESC "010")
	(STORY TEXT010)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT011 "The black plume sways as the Jade Warrior swivels its head to observe you closely, brandishing its sword as it does so. By chance you have chosen to attack the leader. It clicks and whirrs ominously as it advances to do battle. Its sword has a halo which glows more strongly than the others. You manoeuvre behind the Jade Warrior and throw yourself against its sword arm, wrenching the blade from its armoured grasp.||There seems to be a mind inside the sword itself, prompting you to issue orders to the Jade Warriors. ||\"Obey me!\" you cry out.||To your relief and amazement they line up before you and stand to attention. The warrior from whom you robbed the sword picks up another from behind an awning. The warriors are ready to do your bidding. They whirr and click as they follow you dutifully to the edge of the precincts of the burial chambers, and there they grind to a halt. There is nothing you can do to move them further. Although you cannot command the Jade Warriors to go forth and attack Hate, you tell them that they must attack Hate if it should loop its coils into the burial chambers of the Megiddo dynasty. You leave all doors and traps wide open in the hope that Hate will blunder in and get carved up.||Sure enough, when you return the next day the place shows the signs of an epic battle. Great gouts of translucent flesh hang from lintel and corners. There is a fine green powder in the air, like pulverized glass. The Jade Warriors have been ground to dust by Hate but, judging by the quantity of purple ichor smeared over the walls, they must have given the monster acute indigestion.">

<ROOM STORY011
	(DESC "011")
	(STORY TEXT011)
	(PRECHOICE STORY011-PRECHOICE)
	(CONTINUE STORY174)
	(ITEM JADE-WARRIORS-SWORD)
	(CODEWORD CODEWORD-HECATOMB)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY011-PRECHOICE ()
	<COND (<NOT <CHECK-ITEM ,PLUMED-HELMET>>
		<TELL CR "Take a plumed helmet?">
		<COND (<YES?>
			<TAKE-ITEM ,PLUMED-HELMET>
		)>
	)>>

<CONSTANT TEXT012 "Melmelo has his majordomo, a tall, stooping man with a wooden leg, show you into his snug. Doubtless this man lost his leg doing a job for Melmelo and has been rewarded by the sinecure of becoming the guildmaster's senior servant. The snug is a comfortable little wood-panelled room lined with bookcases and trophies picked up from the villas of the nobility. It is one of the smallest rooms in what must be one of the grandest villas in the city. Melmelo is very rich.||He is a small shrewd-looking man, missing his left little finger and just beginning to lose his greying hair. He is dressed simply and you are reasonably sure he is not armed. You can hear the majordomo working in the garden; the stub of his wooden leg thumps on the flagstones of the garden path. He is too far away to help Melmelo should you attack him. Melmelo looks quite relaxed. He doesn't seem either prepared for or worried about trouble.">
<CONSTANT CHOICES012 <LTABLE "take advantage of Melmelo's apparent helplessness and kill him" "ask him if he can think of a way of vanquishing Hate">>

<ROOM STORY012
	(DESC "012")
	(STORY TEXT012)
	(CHOICES CHOICES012)
	(DESTINATIONS <LTABLE STORY258 STORY078>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT013 "\"You'll burn in hell for this, Judain scum, for all eternity. You'll join me here in the swamp of Hate. You'll rue the day you wouldn't offer a helping hand to an old soldier ...\"||He breaks off and moans in despair. His flesh is mottled horribly and a gaping wound on his neck seems to have the pus of Hate oozing into it rather than his own fluids leaking out. You could never describe the horror of seeing these lost souls in their degradation. All you can do is try to keep hold of your sanity. You close your ears to the sounds of torment and walk on.">

<ROOM STORY013
	(DESC "013")
	(STORY TEXT013)
	(CONTINUE STORY009)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT014 "Promised Land. It is full of the most marvellous stories of heroism in the face of stark adversity. The stories of your noble people lift up your heart and give you the strength to dare to be a hero and strive to be the saviour of the Judain. The understanding you gain here in this shrine means you will never nurture hate in your heart.||You linger at the shrine and go on reading until the failing light tires your eyes. When you awaken in the morning you begin reading again, and the cycle of waking, reading and sleeping continues until you have absorbed every word of the holy book. Time for you has passed quickly, but after you have finished the book you realize that you have been at the shrine for more than a week, your body sustained only by the knowledge you have learned.">
<CONSTANT TEXT014-CONTINUED "Your mind is made up. You will go back to Godorno to try to save your people. Turning your back on the bucolic dales and farmsteads is easy when you travel with a light heart. You will live to be a hero or perish in the attempt. Nothing can shake your resolve">
<CONSTANT CHOICES014 <LTABLE "go back down the road you travelled from Godorno" "cut across country towards the Palayal river">>

<ROOM STORY014
	(DESC "014")
	(STORY TEXT014)
	(PRECHOICE STORY014-PRECHOICE)
	(CHOICES CHOICES014)
	(DESTINATIONS <LTABLE STORY085 STORY155>)
	(TYPES TWO-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY014-PRECHOICE ()
	<TEST-MORTALITY 1 ,DIED-GREW-WEAKER ,STORY014>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT014-CONTINUED>
		<TELL ,PERIOD-CR>
		<GAIN-CODEWORD ,CODEWORD-SATORI>
	)>>

<CONSTANT TEXT015 "After several days -- or could it be weeks? -- your ravaged body throws off the disease. You are greatly weakened, but the desire to leave this wretched hovel motivates your limbs into motion and you stagger back to the road.">
<CONSTANT TEXT015-CONTINUED "Throwing caution to the wind you continue alone on the road until you see a cloud of smoke or dust on the road ahead">

<ROOM STORY015
	(DESC "015")
	(STORY TEXT015)
	(PRECHOICE STORY015-PRECHOICE)
	(CONTINUE STORY035)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY015-PRECHOICE()
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<LOSE-SKILL ,SKILL-AGILITY>
	)>
	<TELL ,TEXT015-CONTINUED>
	<TELL ,PERIOD-CR>
	<SKILL-JUMP ,SKILL-WILDERNESS-LORE, STORY022>>

<CONSTANT TEXT016 "You turn tail and flee from the Jade Warriors, but on your way out you fall foul of a trap that stabs your thigh with a broken-off spear shaft.">
<CONSTANT TEXT016-CONTINUED "You pull the shaft out. The blood wells forth ominously; you are lucky it didn't sever an artery. You hobble back to your bolt-hole on Bumble Row and lie down to recuperate">

<ROOM STORY016
	(DESC "016")
	(STORY TEXT016)
	(PRECHOICE STORY016-PRECHOICE)
	(CONTINUE STORY020)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY016-PRECHOICE ()
	<TEST-MORTALITY 1 ,DIED-FROM-INJURIES ,STORY016>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT016-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT017 "At the last, you seem to hear a high-pitched uncanny whispering coming from Hate's black maw. As it shudders in its death throes and you sink into the oblivion of death, you imagine that you hear its words: \"To the last I grapple with thee, Judain. From hell's heart I stab at thee. For Hate's sake I spit my last breath at thee!\"||It pulls you close to its rancid maw as the two of you die. But you have died a true hero's death, bringing salvation to the city of your birth. In days to come, when Godorno is rebuilt, a statue will be erected to honour your memory. You have triumphed.">

<ROOM STORY017
	(DESC "017")
	(STORY TEXT017)
	(VICTORY T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT018 "The spell works for you here, even in the bright sunlight, and you slink back down the road unseen. The brigands, coarse looking hard-bitten men and women, linger to steal everything they can pillage from the farmsteads on either side of the road. They start to set fire to the farmsteads in an orgy of looting so you retrace your steps towards the city of Godorno, content for fate to steer you back towards less immediate but greated danger.">

<ROOM STORY018
	(DESC "018")
	(STORY TEXT018)
	(CONTINUE STORY171)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT019 "In the morning, you reach under your pack for your sword only to find the scabbard empty. Your trusty blade is nowhere to be seen. The other Judain are all out somewhere, probably foraging for supplies. But who has stolen the sword on which you depend?||You will have to go out without it for you promised to meet Lucie to see if she has any news for you, down by the Garden of Statues. It is most odd that someone has stolen your sword. You had thought you were among friends here. It is an easily recognizable sword, anyone using it cannot hide the fact they are a thief. There is nothing you can do about it now, so you set out to meet Lucie.">

<ROOM STORY019
	(DESC "019")
	(STORY TEXT019)
	(PRECHOICE STORY019-PRECHOICE)
	(CONTINUE STORY007)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY019-PRECHOICE ()
	<COND (<AND <CHECK-ITEM ,SWORD> ,RUN-ONCE>
		<LOSE-ITEM ,SWORD>
	)>>

<CONSTANT TEXT020 "You resolve to enter the prison fortress of Grond. Once there, you can free the captured Judain and other political prisoners detained to await the mercy of the Overlord's torturers. But you cannot succeed at such an ambitious mission alone, and you are unwilling to put your fellow Judain at further risk. They are brave enough, but to get inside the prison you will need the help of an expert rogue.">
<CONSTANT CHOICES020 <LTABLE "pay a visit to your mulatto friend, Mameluke, who has been useful to you in the past" "call on the little gamine Lucie">>

<ROOM STORY020
	(DESC "020")
	(STORY TEXT020)
	(CHOICES CHOICES020)
	(DESTINATIONS <LTABLE STORY303 STORY293>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT021 "Your ploy works. The lasso catches Tormil's leg and with the help of some bystanders you are able to drag him free.||\"Why do we help him?\" asks one of the men as he releases the rope. \"The Overlord's men treat us like cattle!\"||\"True, he has earned our hatred,\" you say. \"But now, see, he deserves our pity.\"||Tormil weeps over the body of his daughter, past saving in the body of the monster. You creep away while he mourns.">

<ROOM STORY021
	(DESC "021")
	(STORY TEXT021)
	(PRECHOICE STORY021-PRECHOICE)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY021-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-VENEFIX>
		<DELETE-CODEWORD ,CODEWORD-VENEFIX>
	)(ELSE
		<GAIN-CODEWORD ,CODEWORD-SATORI>
	)>>

<CONSTANT TEXT022 "You realize that the cloud of dust is thrown up from the hoofs of horses being ridden fast. You take cover in the bushes beside the road -- a prudent move which conceals you from the brigands who soon go thundering past. Obviously the trouble in Godorno has led to lawlessness in the surrounding countryside. If you venture further you have a good chance of simply being slaughtered for the clothes on your back. On the other hand, if you return to the city you might at least sell your life dearly in the Judain cause.">
<CONSTANT CHOICES022 <LTABLE "strike out into the depths of the forest" "risk returning to the gates of Godorno">>

<ROOM STORY022
	(DESC "022")
	(STORY TEXT022)
	(CHOICES CHOICES022)
	(DESTINATIONS <LTABLE STORY014 STORY188>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT023 "The wind whistles, causing the miserable wailing of the gargoyles to roll around you as the air streams through the holes in their faces. This is going to be a very dangerous climb.">

<ROOM STORY023
	(DESC "023")
	(STORY TEXT023)
	(PRECHOICE STORY023-PRECHOICE)
	(CONTINUE STORY203)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY023-PRECHOICE ()
	<SKILL-JUMP ,SKILL-AGILITY ,STORY050>>

<CONSTANT TEXT024 "You step gingerly onto the carpet and the gold and silver filigree threads seem to bunch and tighten beneath the balls of your feet. The Overlord stops breathing for a moment and you copy him. Then he rolls over and the stertorous noise starts again. In his sleep his hand caresses the girl's flank, but she doesn't wake. You take another step and then struggle to make another, but the wires have snared around your ankle. The slender metal thread is cutting into your skin like a cheesewire. Cursing, you bend to free yourself. It should be easy enough to get free before the wire cuts through your leg.||Your sixth sense alerts you to a louring presence somewhere above, a presence that broods, heavy with hate. You dart a look upwards at the canopy of the Overlord's bed.">

<ROOM STORY024
	(DESC "024")
	(STORY TEXT024)
	(CONTINUE STORY062)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT025 "The guard squeezes your hand fiercely and tries to heave himself out of Hate's soft embrace. You are drawn towards the purple flesh as the guard, driven to feats of great strength by terror, pulls on you for all he is worth. His face is as purple as Hate as he exerts a great effort and you are dragged into the translucent flesh of the monster. You have joined the orgy of despair and the poor guard who dragged you in cannot escape. He is exhausted. You must lie together, like eggs in a basket, as Hate goes on devouring lost souls. There is no one left to save the Judain now. Hate will conquer all.">

<ROOM STORY025
	(DESC "025")
	(STORY TEXT025)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT026 "You were a fool to return to the Inn of the Inner Temple. Skakshi's friends seize you when you go to the latrines. Your last sight is of the knife protruding from your heart as you die face down in the puddles of urine mingling with your own blood. You have failed to save the city from Hate.">

<ROOM STORY026
	(DESC "026")
	(STORY TEXT026)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT027 "Lucie gives a sweetnieat to the dog which wolfs it down and then starts to nuzzle the pocket of her dress for more. The dog-handler leers at the pretty young girl.||You walk out into the street and the dog notices you right away, giving vent to the sighting cry -- a series of short urgent barks which sound like \"Look there, look there, look there.\" The dog-handler sees you and slips the dog off the leash and runs towards you, drawing his sword. Lucie sticks out her leg and trips him. He goes sprawling flat on his face in the muddy gutter, his sword clattering towards you across the cobbles. The dog stops still with its tail down.">
<CONSTANT CHOICES027 <LTABLE "make a dash for the sword" "go to Lucie's help without delay">>

<ROOM STORY027
	(DESC "027")
	(STORY TEXT027)
	(CHOICES CHOICES027)
	(DESTINATIONS <LTABLE STORY124 STORY075>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT028 "Your senses have been honed razor-keen by your many escapades on the hazy edge of the law. When a thief treads lightly on the steps leading down to your cellar hideout, you are instantly awake and on your feet. A figure stands in the shadows. Snatching up your sword, you call for the intruder to stay where he is. His response is to turn and bolt away. You chase him up to the street, but he is already out of sight. Your only impression was of a small build and very quick reflexes. You must be on the look-out for such a person.||You go back to your lair and spend the rest of the night undisturbed.">

<ROOM STORY028
	(DESC "028")
	(STORY TEXT028)
	(CONTINUE TEXT007)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT029 "After a perilous exploration to find the best way up, you mount the tower. Your fingers clutch into the cracks between the massive stone blocks, and you use the ivy to help you climb. Your gasps of breath are drowned by the whistle and roar of the wind as it claws at the jutting masonry so far from the ground.||At last, a hundred feet up, you reach a set of steps winding round the outside of the tower. There is no balustrade and the steps are no more than a foot wide, winding in a spiral up the outside of the tower. There is nothing at all to hold on to.">
<CONSTANT CHOICES029 <LTABLE "try to walk up the steps" "crawl up the steps" "give up and leave the tower">>

<ROOM STORY029
	(DESC "029")
	(STORY TEXT029)
	(CHOICES CHOICES029)
	(DESTINATIONS <LTABLE STORY050 STORY023 STORY172>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT030 "The Overlord lies beside his concubine, the silk sheets disturbed by his restless tossing and turning. The back of the girl is towards you and her fair pale skin is disfigured by what look like vile purple birthmarks that are weeping a clear yellowish fluid and puckered at the edges. She seems to be sleeping the sleep of the damned. He is breathing stertorously and twitching occasionally, while she is as still as death. The smell of putrefaction is is here just as it pervades and penetrates the whole city.||The richness of the wall-hangings, furniture and pictures, ransacked and taxed from the old nobility, have been placed and hung without taste.||The Overlord lies there at your mercy. Will you avenge the terrible suffering of your fellow Judain, or carry off the concubine so that you can question her and find out what is happening to the city and its Overlord?">
<CONSTANT CHOICES030 <LTABLE "get to the bed" "accept discretion as the better part of valour and make a run for it">>

<ROOM STORY030
	(DESC "030")
	(STORY TEXT030)
	(CHOICES CHOICES030)
	(DESTINATIONS <LTABLE STORY040 STORY161>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT031 "You cling to the axles of a slaver's cart in the mews of Slave Market Plaza and let yourself fall, unnoticed, to the cobbles as it turns a corner. Next you pick your way through a maze of old alleyways, built soon after this part of the city was razed to the ground in the Great Fire of two thousand years ago. You are soon looking at the doors of the Inn of the Inner Temple.">

<ROOM STORY031
	(DESC "031")
	(STORY TEXT031)
	(CONTINUE STORY063)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT032 "You have made the right choice. Skakshi cannot get past your guard as your blade cuts through the air. He is becoming increasingly desperate. \"Impossible ...\" he gasps, face twisted into a look of fury. \"You must be cheating -- using some Judain sorcery to aid you!\"||You are about to step up the tempo of your attack when he throws down the club and tries to make a run for the door.">
<CONSTANT CHOICES032 <LTABLE "cut him down" "let him escape">>

<ROOM STORY032
	(DESC "032")
	(STORY TEXT032)
	(CHOICES CHOICES032)
	(DESTINATIONS <LTABLE STORY036 STORY043>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT033 "You spin on your heel. The fierce look of anger on your face makes the boy step back in fear, but he is used to treating your kind with scorn. He recovers himself.||\"Judain scum, your kind aren't wanted here.\"||He pulls a tanner's knife from his pocket. It is long, sharp and menacing. There is no time to cast a spell.">
<CONSTANT CHOICES033 <LTABLE "break the law of Godorno by unsheathing your sword here in the street" "use" "rely on" "use" "you had better run">>

<ROOM STORY033
	(DESC "033")
	(STORY TEXT033)
	(CHOICES CHOICES033)
	(DESTINATIONS <LTABLE STORY056 STORY092 STORY099 STORY112 STORY130>)
	(REQUIREMENTS <LTABLE SKILL-SWORDPLAY SKILL-UNARMED-COMBAT SKILL-STREETWISE SKILL-CHARMS NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT034 "As soon as they are outside the gates of Grond, the freed guards flee. They are leaving the city taking only what they can grab as they run. This is the most sensible option and a very tempting one for you.">
<CONSTANT CHOICES034 <LTABLE "return to Bumble Row and ponder what to do next" "return to Grond to free more of the guards and prisoners">>

<ROOM STORY034
	(DESC "034")
	(STORY TEXT034)
	(PRECHOICE STORY034-PRECHOICE)
	(CHOICES CHOICES034)
	(DESTINATIONS <LTABLE STORY006 STORY311>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY034-PRECHOICE ()
	<COND(,RUN-ONCE
		<COND (<CHECK-CODEWORD ,CODEWORD-VENEFIX>
			<DELETE-CODEWORD ,CODEWORD-VENEFIX>
		)(ELSE
			<GAIN-CODEWORD ,CODEWORD-SATORI>
		)>
	)>>

<CONSTANT TEXT035 "The cloud of dust is coming closer and when it is no more than a quarter of a mile away you begin to make out the figures of several horsemen. They are moving at a fast trot, faster than merchants or most other travellers. They could be brigands.">
<CONSTANT CHOICES035 <LTABLE "flee back towards the city of Godorno, hoping to elude them until nightfall" "stand your ground, greet them, and offer to throw in your lot with them">>

<ROOM STORY035
	(DESC "035")
	(STORY TEXT035)
	(CHOICES CHOICES035)
	(DESTINATIONS <LTABLE STORY044 STORY064>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT036 "You cut Skakshi down in a welter ofblood, wipe your blade on a barcloth, and replace it in its scabbard before looking round you once more.||All is quiet in the Inn of the Inner Temple. No one will meet your eye. They stare at Skakshi's corpse, shocked at the sudden violence you have done to one of their comrades. You don't expect any trouble from them after that demonstration. Nor will you make many friends here. You feel Skakshi's pockets, quickly finding a concealed flap in which you discover a set of throwing knives.||You look up from the body. One man gives you a narrow glare and spits on the floor. You won't make any friends here so you decide to go back to your lair on Bumble Row.||In your heart you know that you did not have to kill Skakshi. Perhaps you are beginning to succumb to the general hysteria and hatred that seems to be infetting most others in the city?">

<ROOM STORY036
	(DESC "036")
	(STORY TEXT036)
	(PRECHOICE STORY036-PRECHOICE)
	(CONTINUE STORY214)
	(CODEWORD CODEWORD-IMPASSE)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY036-PRECHOICE ()
	<COND (,RUN-ONCE
		<KEEP-ITEM ,KNIFE>
		<COND (<CHECK-CODEWORD ,CODEWORD-SATORI>
			<DELETE-CODEWORD ,CODEWORD-SATORI>
		)(<NOT <CHECK-CODEWORD ,CODEWORD-VENEFIX>>
			<GAIN-CODEWORD ,CODEWORD-VENEFIX>
		)>
	)>>

<CONSTANT TEXT037 "You know from experience that the dust cloud is raised by a group of riders riding at a canter. They will overtake you within half an hour.">
<CONSTANT CHOICES037 <LTABLE "hide in one of the farms until they pass" "choose a place to ambush them in case they are the Overlord's men">>

<ROOM STORY037
	(DESC "037")
	(STORY TEXT037)
	(CHOICES CHOICES037)
	(DESTINATIONS <LTABLE STORY069 STORY082>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT038 "People turn to stare as you run past and then take up the hue and cry as they are engulfed by the mob that pursues you. You run on, your lungs beginning to hurt. They are not closing but you don't know how much longer you can keep going like this. Every time you see a likely place to hide there seems to be someone else there. You turn a corner and run on in the direction of the main gate where the trade road enters the city. Behind you can hear the sound of hoofs on the cobbles. A squadron of the Overlord's cavalry is giving chase. Ahead there is a drinking house, outside is a horse tethered to a post.">
<CONSTANT CHOICES038 <LTABLE "steal the horse" "hide in the drinking house">>

<ROOM STORY038
	(DESC "038")
	(STORY TEXT038)
	(CHOICES CHOICES038)
	(DESTINATIONS <LTABLE STORY237 STORY255>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT039 "You are not scared of a mere dog. You walk out from hiding nonchalantly enough but the dog is at you in a trice.">

<ROOM STORY039
	(DESC "039")
	(STORY TEXT039)
	(PRECHOICE STORY039-PRECHOICE)
	(CONTINUE STORY057)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY039-PRECHOICE ()
	<COND(,RUN-ONCE
		<ITEM-JUMP ,SWORD ,STORY068>
	)>>

<CONSTANT TEXT040 "As you pad quietly towards the Overlord;s bed the candles flicker in a gust of wind. Far off you can hear the baying of his hunting dogs in their kennels. Farther off still the wind carries the moans and screams of the unfortunates in Grond.||The Overlord's bed is set on a rich ruby-red carpet with intricate patterns ofgold and silver thread woven into it. There are signs and sigils, perhaps magical wards.">
<CONSTANT CHOICES040 <LTABLE "walk quietly across the carpet to the concubine's side" "jump straight onto the bed so your feet don't touch the carpet">>

<ROOM STORY040
	(DESC "040")
	(STORY TEXT040)
	(PRECHOICE STORY040-PRECHOICE)
	(CHOICES CHOICES040)
	(DESTINATIONS <LTABLE STORY024 STORY098>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY040-PRECHOICE ()
	<COND(<AND ,RUN-ONCE <CHECK-SKILL ,SKILL-CHARMS>>
		<STORY-JUMP ,STORY135>
	)>>

<CONSTANT TEXT041 "You pass a troubled night in your lair and wake listening to the chittering of the rats that flourish as the city becomes a slum. You feel better for the rest and wake refreshed. You wash in cold water and plan what to do on this grey morning. There is only one course of action left to you. You will have to attack Hate itself and vanquish it utterly if you are to save your people.">

<ROOM STORY041
	(DESC "041")
	(STORY TEXT041)
	(PRECHOICE STORY041-PRECHOICE)
	(CONTINUE STORY272)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY041-PRECHOICE ()
	<COND(,RUN-ONCE
		<GAIN-LIFE 2>
	)>>

<CONSTANT TEXT042 "There is a whoof as a thick cloud of smoke explodes around you. You grope your way through the smoke towards the Jade Warriors. One of them looms towards you, the light gleaming dully now off its facets and its sword is working mechanically. You recoil in fright but it lumbers past you making elaborate passes in the air, as if engaged in a display of an ancient style of swordplay. The others are also lurching about at random. The smoke seems to have scrambled their senses. Each is cutting and thrusting at the air around it but they seem oblivious of you.">

<ROOM STORY042
	(DESC "042")
	(STORY TEXT042)
	(PRECHOICE STORY042-PRECHOICE)
	(CONTINUE STORY133)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY042-PRECHOICE ()
	<SKILL-JUMP ,SKILL-FOLKLORE ,STORY119>>

<CONSTANT TEXT043 "Skakshi slams the door as he goes and the other drinkers follow without so much as a glance in your direction. They do not dare to share the drinking hall of the Inn of the Inner Temple with you. You have made no friends here and you won't get a meeting with Melmelo now. He will hear everything that has happened here and he is not an easy man to find and get to talk to.||The landlord stoops to pick up the spiked club which still has congealed blood sticking to it from the last time it was used and puts it back behind the bar.">

<ROOM STORY043
	(DESC "043")
	(STORY TEXT043)
	(CONTINUE STORY214)
	(CODEWORD CODEWORD-COOL)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT044 "Your steady run keeps you out of their clutches but you are already in sight of the city of Godorno once more. They seem intent on chasing you back as far as the city walls. Perhaps they mean to sneak into the city to rob the cityfolk, but they will not find it easy to pass through the city gates.">
<CONSTANT CHOICES044 <LTABLE "change your mind about fleeing and offer to .throw your lot in with them" "keep running and hide in the city once more">>

<ROOM STORY044
	(DESC "044")
	(STORY TEXT044)
	(CHOICES CHOICES044)
	(DESTINATIONS <LTABLE STORY064 STORY044-AGILITY>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROOM STORY044-AGILITY
	(DESC "044")
	(EVENTS STORY044-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY044-EVENTS ()
	<COND(<CHECK-SKILL ,SKILL-AGILITY>
		<RETURN ,STORY188>
	)(ELSE
		<RETURN ,STORY076>
	)>>

<CONSTANT TEXT045 "You also manage to free two hundred of the grateful guards who cannot believe their luck. They wipe themselves off along the walls. Most of them look as if they are in shock. They shouldn't give you too much trouble. You are more likely to face trouble from the Judain you have set free. They can see their tormenters among them and they want to take their revenge. \"Now die, dogs, die slowly and in pain!\" they cry. \"Let us see how you like to be put to the torture. Kill them! Heat the irons and warm their vitals.\" The Judain are near hysterical and they begin to slaughter the guards out of hand, while others try to drag some of them back to the torture chambers. The guards are petrified.||In the heat of the moment there is no time for finesse, and your people are behaving no better than savage beasts who have lost all control.">
<CONSTANT CHOICES045 <LTABLE "stop the slaughter by killing one of your fellow Judain" "let your people take their natural revenge">>

<ROOM STORY045
	(DESC "045")
	(STORY TEXT045)
	(CHOICES CHOICES045)
	(DESTINATIONS <LTABLE STORY269 STORY348>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT046 "You tap on the door, then kneel and place your ear to the planking to hear what goes on beneath. You can hear men whispering. They must fear you are one of the Overlord's men. You call out quietly your name, and that you are Judain. At last you persuade them to open the trap door. Down in the cellar are three families hiding from the Overlord's butchers. There is a big man whom you recognize as Caiaphas, the rabbi at the synagogue before it was torn down. He carries a rusty old spear which he casts aside as soon as he sees you.||\"Caiaphas, old friend,\" you say in greeting. \"What has come to pass here? Why do all our people cower below ground like rats?\"||Caiaphas looks sombre and one of the women starts to cry as he tells the story in a rumbling basso voice which would be most impressive were he not cowering in a damp cellar.">

<ROOM STORY046
	(DESC "046")
	(STORY TEXT046)
	(CONTINUE STORY071)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT047 "You never retire for the night without first casting a charm to watch over you while you sleep, keeping you safe from thieves and nocturnal predators. In the small hours, a high ringing chime resounds through your dreams, bringing you instantly awake. You look around. You can see nothing in the darkness. Eventually the feeling of danger passes and you drift off back to sleep.">

<ROOM STORY047
	(DESC "047")
	(STORY TEXT047)
	(CONTINUE STORY330)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT048 "The youth is not content to leave it there. He means to draw blood. He closes stealthily and is about to stab you. His shadow falls across you before the blow is struck.">
<CONSTANT CHOICES048 <LTABLE "use" "use" "there is no time to draw a sword or use sorcery; you run for it">>

<ROOM STORY048
	(DESC "048")
	(STORY TEXT048)
	(CHOICES CHOICES048)
	(DESTINATIONS <LTABLE STORY099 STORY092 STORY130>)
	(REQUIREMENTS <LTABLE SKILL-STREETWISE SKILL-UNARMED-COMBAT NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT049 "You find the librarian outside the building, staring at a glimmering pile of ashes. As you go closer, you see that someone has piled up the books of the library and torched them. The librarian falls to his knees, overcome with distress. \"They burned my books!\" he groans, tears running into his beard.||\"Who did? And why?\" you ask.||\"The Overlord's men. They said that knowledge was the enemy of law and order. They claimed that lies had been written in the books by Judain authors. Oh, such a waste ...!\"||There is no chance now of finding more about Hate from the writings of ancient scholars; you may not visit the library again should you be given the option. You wonder if the Overlord has truly gone mad.">

<ROOM STORY049
	(DESC "049")
	(STORY TEXT049)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT050 "Walking is better than crawling. On a difficult climb you should keep three holds, using your hands and feet, on what you are climbing at all times. If you do this you will succeed in all but the most difficult of climbs. The wind is whipping around you, however, and the baleful wails of the gargoyles seem destined to make you falter and tumble to your death.||It is slow going and you have to force yourself not to look down, but step by step you edge around to the corner. But what if there is something round there waiting to attack you?">
<CONSTANT CHOICES050 <LTABLE "return to the ground: you cannot manage the tower" "press on">>

<ROOM STORY050
	(DESC "050")
	(STORY TEXT050)
	(CHOICES CHOICES050)
	(DESTINATIONS <LTABLE STORY172 STORY304>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT051 "Tarkamandor tells you he has decided to quit the city. \"Matters have gone too far\" he says. \"Each day I fear the guards will come to drag me off to Grond.\"||\"Why should you fear?\" you say with a trace of bitterness. \"You are not Judain.\"||He gives a snort of ironic laughter. \"Do you think that what has been going on is a simple matter of persecution? It goes deeper than that. The Overlord started his attacks on your people to distract attention from his disastrous policies, reasoning that once the populace had a scapegoat to blame they would be easier to control.\"||\"That strategy has worked well, then.\"||\"Now it is out of control! Hate is rife in the city. It extends its influence like a cancer. Today it is you Judain who are marched off to the prison. Tomorrow it may he the aged, or the infirm, or those who dare to speak out against the Overlord. That's why I'm leaving.\" He takes a few more steps, the wheels of his cart sloshing through the rut ofmire in the middle of the street, then pauses and looks back. \"As long as I'm going, I suppose I ought to sell some of my stock. Are you interested?\"||He has a healing salve which can be used once at any time except when in combat; it will restore all lost , Life Points. Another item on the cart is a pair ofelfin boots which grant their wearer one use of the AGILITY skill and must then be discarded. Tarkamandor also offers you a censer offragrant incense which he swears is blessed by the temple, a sword, a set of throwing knives, and a magic wand.">
<CONSTANT TEXT051-CONTINUED "Bidding Tarkamandor farewell, you set off to the meeting">

<ROOM STORY051
	(DESC "051")
	(STORY TEXT051)
	(PRECHOICE STORY051-PRECHOICE)
	(CONTINUE STORY094)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY051-PRECHOICE ()
	<MERCHANT <LTABLE HEALING-SALVE ELFIN-BOOTS CENSER-OF-FRAGRANT-INCENSE SWORD KNIFE MAGIC-WAND> <LTABLE 80 100 100 10 15 60>>
	<IF-ALIVE ,TEXT051-CONTINUED>>

<CONSTANT TEXT052 "You advance quickly on Skakshi, getting in close to match your sword against his club. As you lunge forward, the haft of the club catches you a painful blow on the shoulder and you feel the spikes tear your jerkin and bite into the flesh beneath.">
<CONSTANT TEXT052-CONTINUED "You send the pommel of your sword crashing into Skakshi's jaw with stunning force. He gives a surprised grunt as his knees fold under him. Before he can rise and continue the battle, you have the point of your sword at his throat. \"Take me to Melmelo,\" you say to him as you get your breath back.||He looks at your sword uneasily as he slowly gets to his feet. \"I'll take you,\" he says sullenly.">

<ROOM STORY052
	(DESC "052")
	(STORY TEXT052)
	(PRECHOICE STORY052-PRECHOICE)
	(CONTINUE STORY181)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY052-PRECHOICE ()
	<TEST-MORTALITY 3 ,DIED-FROM-INJURIES ,STORY052>
	<IF-ALIVE ,TEXT052-CONTINUED>>

<CONSTANT TEXT053 "You walk quickly along towards the main gate, hiding your face from strangers. After a time you realize you are being followed by a gang of young street urchins. You turn off the main thoroughfare and duck and dive down back alleys but these orphans seem to know this quarter of the city by heart. They must have explored every inch in their quest to stay alive.||Deciding to ignore them you return to the main street and toward the twin arches of the main gates. As you approach the campanile, its bell sounds a steady doleful ringing. There is a creak as the gate guards push the heavy gate back. There is no way out here for anyone. You will have to try to slip out of the city another way.||The walls are high and well patrolled.">
<CONSTANT CHOICES053 <LTABLE "explore the river quay to see if you may escape upriver by stowing away on a barge" "try to bribe the guards">>

<ROOM STORY053
	(DESC "053")
	(STORY TEXT053)
	(CHOICES CHOICES053)
	(DESTINATIONS <LTABLE STORY070 STORY398>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT054 "You back away out of Hate's reach to recover your breath. The monster strains at the links binding it, but cannot break them. If you have a magical salve with which to heal your wounds, now is the time to use it.">
<CONSTANT CHOICES054 <LTABLE "return to the fray" "use the">>

<ROOM STORY054
	(DESC "054")
	(STORY TEXT054)
	(CHOICES CHOICES054)
	(DESTINATIONS <LTABLE STORY005 STORY349>)
	(REQUIREMENTS <LTABLE NONE JEWEL-OF-SUNSET-FIRE>)
	(TYPES <LTABLE R-NONE R-ITEM>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT055 "You walk on, unconcerned, until you see the people ahead of you leaving their work in the fields and returning hurriedly to their farmhouses. Looking back down the road you see the dust cloud is caused by a large group of horsemen clad in the Overlord's livery of purple and black. They have seen you and are calling to you to stop.">
<CONSTANT CHOICES055 <LTABLE "do as they say" "try to hide in one of the farmhouses">>

<ROOM STORY055
	(DESC "055")
	(STORY TEXT055)
	(CHOICES CHOICES055)
	(DESTINATIONS <LTABLE STORY101 STORY125>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT056 "Your sword rasps from its sheath. The youth starts to retreat, throwing his knife away and yelling at the top of his voice: \"Help, murder! A Judain tried to kill me! Help me!\"||Before you can sheathe your sword the shutters in the houses overlooking the street are flung open and the cry is taken up. A group of cobblers come advancing on you wielding their little hammers. Pots and pans rain down on your head from the windows above. A steaming hot sago pudding lands on your head and oozes down underneath your jerkin as you jump nimbly aside to avoid the contents of a chamber pot. You have no choice but to flee before the mob overwhelms you.">

<ROOM STORY056
	(DESC "056")
	(STORY TEXT056)
	(CONTINUE STORY225)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT057 "The dog buries its jaws in your calf and clamps hard like a blacksmith's vice. The pain is terrible and if you struggle the dog may take a chunk out of your leg. There is no time to think of a way out, the blood is soaking your boots. You are calling out your surrender to the dog-handler when he inserts a sharp dagger into your spine and you know no more. Who would have thought a hero such as you could be caught by a dog? There is no one left to save the Judain now.">

<ROOM STORY057
	(DESC "057")
	(STORY TEXT057)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT058 "You duck and the blade buries itselfin the wooden panel behind you, making a sound like a woodpecker as it vibrates there. You follow up quickly, as Skakshi bends to pull a knife from his other boot. You are too quick for him and wrestle him to the ground before he can pull the knife.||\"I will do what you want, Judain sc--\" He chokes back the insult. \"What is it you want of me?\"||\"Take me to Melmelo's hideout; take me to the guildmaster of thieves. I have a proposition to put to him, for his ears only.\"||\"I can do that easily enough. Follow me.\"">

<ROOM STORY058
	(DESC "058")
	(STORY TEXT058)
	(CONTINUE STORY181)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT059 "You are thoroughly versed in the criminal haunts and goings-on of the city. You make your way along twisting alleys until you stand before an ornamental villa with a hot bubbling fountain in front of it. The grandeur of the house is at odds with the ramshackle district in which it is located. This is the home of Melmelo, head of what is jocularly known as the Thieves' Guild -- a loose alliance of crooks and shady merchants who between them have most crime in the city sewn up.| You pause before knocking at the door. You have always resisted getting drawn into Melmelo's organization, and he has let it be known that he is not pleased by your disdain .for his activities. On the other hand, he is a man who adheres to his own code of honour. You cannot imagine him stooping so low as handing you to the authorities for a reward.">
<CONSTANT CHOICES059 <LTABLE "knock at the door" "retrace your steps, abandoning your plan to consult Melmelo">>

<ROOM STORY059
	(DESC "059")
	(STORY TEXT059)
	(CHOICES CHOICES059)
	(DESTINATIONS <LTABLE STORY012 STORY214>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT060 "You sprint for it, little caring that you will crush the poor snakes you tread on. They writhe underfoot and hiss balefully. You are halfway across the room when you slip as one of the serpents rolls under the ball of your foot. You fall face down in a sea of serpentine coils and the envenomed fangs of the snakes are soon piercing your soft flesh and injecting the deadly venom. The poison of the garter snake is virulent indeed and you are soon dead. There is no one left to save the Judain now.">

<ROOM STORY060
	(DESC "060")
	(STORY TEXT060)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT061 "You fling up the door and jump down into the cellar to find yourself surrounded by several men, one of whom jabs you with a rusty old spear before you can regain your balance.">
<CONSTANT TEXT061-CONTINUED "\"Wait! A fellow Judain!\" realizes one of them. You recognize the tall imposing figure of Caiaphas, rabbi at the synagogue before it was torn down by the mob.||\"I am,\" you reply with a nod. \"As, I see, are all of you.\"||There are three Judain families hiding down here from the Overlord's butchers. The rusty old spear is thrown aside as they welcome you with open arms.">

<ROOM STORY061
	(DESC "061")
	(STORY TEXT061)
	(PRECHOICE STORY061-PRECHOICE)
	(CONTINUE STORY071)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY061-PRECHOICE ()
	<TEST-MORTALITY 3 ,DIED-FROM-INJURIES ,STORY061>
	<IF-ALIVE ,TEXT061-CONTINUED>>

<CONSTANT TEXT062 "Your sixth sense has not failed you. Your instinct for danger leads you to look up into the canopy of the Overlord's four-poster bed, even as the filigree begins to tighten painfully around your ankle. Above you, what looks like a black blanket floats eerily down from beneath the canopy to engulf you.">
<CONSTANT CHOICES062 <LTABLE "use" "use" "cry for help">>

<ROOM STORY062
	(DESC "062")
	(STORY TEXT062)
	(CHOICES CHOICES062)
	(DESTINATIONS <LTABLE STORY118 STORY084 STORY109>)
	(REQUIREMENTS <LTABLE SKILL-AGILITY SKILL-SWORDPLAY NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT063 "The Inn of the Inner Temple has fake columns along its front and amusing and irreverent cartoons of many gods and goddesses painted above its lintel. Inside it is no more than a low seedy hall divided into cubicles. The drinkers all have their backs to you. There is a board near the door to which several notices have been stuck. Some are reward posters, offering money in return for help arresting some of the inn's regulars. They have been defaced and scrawled on. One of the posters offers a reward of ten gleenars for any Judain, dead or alive. You tear it down as you walk past, dropping the crumpled paper into the spittoon beside the bar.||Most of those drinking in the cubicles would happily kill you for even a miserable sum like ten gleenars.">
<CONSTANT CHOICES063 <LTABLE "talk to the people in the nearest cubicle" "leave the inn">>

<ROOM STORY063
	(DESC "063")
	(STORY TEXT063)
	(CHOICES CHOICES063)
	(DESTINATIONS <LTABLE STORY197 STORY214>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT064 "The brigands accept you into their band and though the life is hard you flourish. Within the year you lead your own band, preying on the rich and overlooking the psychopathic excesses of your men. You are a successful brigand leader, but the Judain perish in Godorno.||The next time you see the city it has sunk into the sea leaving only the tops of the fortresses and towers piercing the waves to show where the city that was once the jewel of the east now lies.">

<ROOM STORY064
	(DESC "064")
	(STORY TEXT064)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY065
	(DESC "065")
	(EVENTS STORY065-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY065-EVENTS ()
	<COND(<CHECK-CODEWORD ,CODEWORD-VENEFIX>
		<RETURN ,STORY335>
	)(ELSE
		<RETURN ,STORY091>
	)>>

<CONSTANT TEXT066 "You summon up all your concentration and cast the puissant spell as the Jade Warriors lurch menacingly towards you. They are mere cyphers. There is no will within them to conquer. In vain you struggle to tamper with the circuits that set them in motion but it is quite beyond you. You are powerless as the Jade Warriors surround you and their razor-sharp swords slice into your vitals. You are slain and there is no one left to save the poor doomed Judain. Hate will conquer all.">

<ROOM STORY066
	(DESC "066")
	(STORY TEXT066)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT067 "\"There's a price on your head, Skakshi, my friend. Melmelo wants you dead and he's hired Hammer, the assassin, to take care of you.\"||\"It isn't true!\" he scoffs. \"Why should Melmelo want me dead?\"||\"He is afraid. He fears you seek to supplant him as guildmaster of thieves. He has grown fat and worried on the juicy sinecures of the guild.\"||\"I'm going to find Melmelo and have it out with him once and for all,\" Skakshi snarls at this. He stalks out of the inn. In his high dudgeon he fails to notice you follow him, slinking stealthily through the shadows. Shadowing men is something you have done many times before -- there isn't an urchin of the streets who could lose you in the byways and catacombs of Godorno.||Soon you are following Skakshi up the steps towards Melmelo's town stronghold. He walks past an ornamental steam bath that bubbles away in the garden. Melmelo's villa is built on the site of a thermal spring.">

<ROOM STORY067
	(DESC "067")
	(STORY TEXT067)
	(CONTINUE STORY356)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT068 "A dog, however, is no match for a man with a sword -- all you have to do is prod it with the weapon and it goes yelping back to its master with its tail between its legs.||You look around for Lucie. She is heading towards the Old Quarter, probably to the Silver Eel tavern which is one of her haunts. You know it as a dubious drinking-house whose customers have a dangerous reputation.">
<CONSTANT CHOICES068 <LTABLE "follow Lucie now" "return to Bumble Row for the time being and seek her out this afternoon">>

<ROOM STORY068
	(DESC "068")
	(STORY TEXT068)
	(CHOICES CHOICES068)
	(DESTINATIONS <LTABLE STORY261 STORY371>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT069 "You leave the road and walk across melon beds past a farmhouse safely out of sight of the riders, where a young woman greets you and offers you mash beer, while her father looks on warily. You accept their hospitality. They seem simple honest people. They ask who you are and where you come from. \"You are Judain, are you not? Tell me why are the Judain so proud? And are you all as rich as they say?\"||\"We are proud because we are the chosen ones,\" you explain. \"We have remained together, never marrying outside our kind through the difficulties of our troubled history. I wish we were all rich, but I, I must confess, am almost beggared.\"||\"Why did you leave the road?\" asks the girl.||\"The riders. They carry word to Bagoe that we Judain are outcast. They will put a price upon our heads.\"||\"We will hide you and smuggle you past the town by the back paths.\"||Although you are dogged by the Overlord's riders for more than a week, the farmers are as good as their word. They keep you well fed, allowing you to build up your strength for the day you must flee.">

<ROOM STORY069
	(DESC "069")
	(STORY TEXT069)
	(PRECHOICE STORY069-PRECHOICE)
	(CONTINUE STORY142)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY069-PRECHOICE ()
	<COND(,RUN-ONCE <GAIN-LIFE 3>)>>

<CONSTANT TEXT070 "You creep along side streets, hiding your face from strangers, as you head towards the riverfront. You are plagued by midges but that is the least of your troubles. You can hear shrieks and the cries of hysterical mobs behind you as they rampage back and forth across the city. Making your way carefully to the quay you can see a row of three river barges, two laden with goods and one which has just finished unloading.">

<ROOM STORY070
	(DESC "070")
	(STORY TEXT070)
	(PRECHOICE STORY070-PRECHOICE)
	(CONTINUE STORY134)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY070-PRECHOICE ()
	<SKILL-JUMP ,SKILL-SEAFARING ,STORY120>>

<CONSTANT TEXT071 "Caiaphas's story of what has been the fate of their many friends is chilling. As soon as you fled the city, the Overlord's guards -- along with foreign mercenaries who marched out of beyond -- started to round up all the Judain they could find. The executions have been carried out all day every day since then. A few, like you, escaped from the city; several thousand have gone to ground; but most of your folk have already perished. You vow then and there to avenge your fellow Judain.||\"It is worse even than I have said,\" continues Caiaphas. \"Some have reported seeing a loathsome monster dragging its bulk through the streets at night. None knows where it comes from, but by daybreak there are always fewer people in the city.\"||\"What is it?\" you ask, aghast.||\"Hate itself The embodiment of cruelty. It has been awakened and given living form by the Over lord's excesses. Now it stalks the streets beyond even his power to control, and it will not rest until our city has become a desolate ruin.\"||You hear his words with horror.">

<ROOM STORY071
	(DESC "071")
	(STORY TEXT071)
	(CONTINUE STORY081)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT072 "The cloying smell of crushed roses and honeysuckle makes your senses swim again. The reek of Hate is all about you. You hear a deep voice, cursing bitterly, and the grunts and gasps of a strong man trying to lift a heavy boulder. The noises are coming from just around the next corner. You can't resist seeing who it is.||The strong form of a mulatto beckons you imploringly. He is stuck fast in the coils of Hate. Its gelid form has oozed around his body. He is covered from knees to armpits and will soon succumb. As you get closer you recognize him as your friend Mameluke. You must do something to save him.">
<CONSTANT CHOICES072 <LTABLE "attack Hate" "pummel Hate with punches and kicks" "use a spell of Rulership" "Miasma" "Thunderflash">>

<ROOM STORY072
	(DESC "072")
	(STORY TEXT072)
	(CHOICES CHOICES072)
	(DESTINATIONS <LTABLE STORY083 STORY093 STORY122 STORY136 STORY167>)
	(REQUIREMENTS <LTABLE SKILL-SWORDPLAY NONE SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-SKILL R-NONE R-SKILL R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT073 "There is a great crash which echoes around the room and seems to shake the whole tower, followed by an explosion of spurting red flame which bathes the black spider in its punishing light. You feel giddy as the tower rocks, and the spider recoils before gathering itself to leap once more. It is badly hurt, but not yet incapacitated, though you have gained time to cast another spell. You cannot cast the same spell twice in a row.">
<CONSTANT CHOICES073 <LTABLE "cast Miasma" "cast Images to give yourself more time">>

<ROOM STORY073
	(DESC "073")
	(STORY TEXT073)
	(CHOICES CHOICES073)
	(DESTINATIONS <LTABLE STORY079 STORY208>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT074 "The middle platform is a trap. The wood gives way as you land and you fall through, impaling yourself on metal spikes which stick into the soles of your feet.">
<CONSTANT TEXT074-CONTINUED "You extricate yourself and balance on the outside of the box. The pain is excruciating and it affects your ability to balance but you can't go back now. The heads of the garter snakes are starting to mesmerize you as they sway, as if silently willing you to fall among them. You nerve yourself to go on, you will never give up, and leap for the next rope.||You grab the rope and swing above the snakes, looking down to see their jaws opening wide and venom dribbling from the jaws. You can only hope they do not spit venom like some of the hooded cobras you have heard about that live in the fens around Bagoe. You swing slowly across the room to alight on the last box, which stays firm beneath your feet and from whe!e you can jump down and open the door beyond.">

<ROOM STORY074
	(DESC "074")
	(STORY TEXT074)
	(PRECHOICE STORY074-PRECHOICE)
	(CONTINUE STORY180)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY074-PRECHOICE ()
	<TEST-MORTALITY 2 ,DIED-FROM-INJURIES ,STORY074>
	<IF-ALIVE ,TEXT074-CONTINUED>>

<CONSTANT TEXT075 "Lucie didn't need your help, she is already halfway to the dubious sanctuary of the Silver Eel tavern. You have lost the chance of picking up another sword. The dog-handler has retrieved it and he pulls his dog roughly behind him as he sets out home again">
<CONSTANT CHOICES075 <LTABLE "follow Lucie to the Silver Eel right now" "bide your time and seek her out later today">>

<ROOM STORY075
	(DESC "075")
	(STORY TEXT075)
	(CHOICES CHOICES075)
	(DESTINATIONS <LTABLE STORY261 STORY371>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT076 "You can't flee for ever. They are slowly running you down, urging their mounts to greater efforts with the cracks of bullhide whips. At last you are forced to stand your ground, fighting for breath. You are so exhausted you can hardly collect your wits.||\"This one's a Judain!\" one of the brigands shouts. \"Didn't old Samfgash say there was a price on 'em in Godorno? Let's take the Judain to the main gate and claim the blood money.\"||The brigand leader agrees it would be sensible to turn you in for money as you have led them so close to the city in the chase. You try to escape but they will collect their money for your dead body just as they would if they turned you in alive. They cut you down like a hunted doe.">

<ROOM STORY076
	(DESC "076")
	(STORY TEXT076)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT077 "Hate has been grievously wounded fighting the Jade Warrior tomb guards of the Megiddo dynasty burial vaults. It cannot tear itself free from the chains and caltrops which bind and gall it.||Hate thrashes wildly and a tidal wave erupts from the canal, smashing against the Bargello keep, but it is the monster's death throes. Just as the sun sinks beneath the horizon the jewel glows white hot and the ruby light becomes a coruscating fan of many coloured motes that disintegrate the soft purple flesh. The monster falls and makes its own grave as the catacombs open up beneath its bulk to welcome it to its final rest. The sun sets and the city is quiet.">

<ROOM STORY077
	(DESC "077")
	(STORY TEXT077)
	(CONTINUE STORY416)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT078 "\"I have been giving that matter much thought. It's not good for business with Hate disrupting the life of the city.\" Melmelo had the larceny side of business in the city nicely sewn up until the monster emerged from the catacombs. \"I can only think of one thing which might be the key to the city's salvation.\"||\"What is that?\" you ask, avidly.||\"The Jewel of Sunset Fire.\"||\"Where is this jewel?\"||Melmelo seems certain that it lies at the top of the Tower of the Sentinel at the east end of Fortuny Street. \"I have coveted it all my life. It is said to give wondrous powers to its wielder. But though many of us have tried to scale the tower -- both within, using stealth and cunning, and without, clinging like flies to the stones -- none of us survived.\"||\"I will survive,\" you say determinedly. You can be reasonably sure Melmelo is telling you the truth for he wants to see Hate vanquished as much as any man does. He is already on top of the pile, here in Godorno.">

<ROOM STORY078
	(DESC "078")
	(STORY TEXT078)
	(CONTINUE STORY160)
	(CODEWORD CODEWORD-SUNSET)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT079 "With a dramatic gesture and a clap of your hands you bring forth a cloud of noxious vapours that fills the top room of the Tower of the Sentinel, obscuring the jewel from view. The gigantic spider falters momentarily then leaps towards you, seemingly unaffected by the poison gas. You haven't time to cast another spell.">
<CONSTANT CHOICES079 <LTABLE "run for it back down the stairs" "make a dash for the Jewel of Sunset Fire">>

<ROOM STORY079
	(DESC "079")
	(STORY TEXT079)
	(CHOICES CHOICES079)
	(DESTINATIONS <LTABLE STORY146 STORY164>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT080 "Conjuring a magical silver shield from thin air is the work of only a moment and you scoop a writhing interlocked mass of snakes aside, slowly and painstakingly clearing the way across the floor. The serpents hiss balefully, as if outraged to have been disturbed so unceremoniously. As soon as you sweep them aside, so they wriggle back towards you and it is a miracle that you reach the door at the other side of the room without being bitten.">

<ROOM STORY080
	(DESC "080")
	(STORY TEXT080)
	(CONTINUE STORY180)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT081 "\"But, Caiaphas, did no one fight back? Did all our people just surrender themselves to be led away meekly to the slaughter, like sheep? We must fight?\" Caiaphas, a tall man with a black beard and rumbling basso voice replies. \"You are a fine one to criticize us! Where were you? We could not fight. We have no swords nor heavy suits of mail to protect us. There are too few of us.\"||\"Surely there is someone among us who will strike back, someone prepared to stand up to the evil of the accursed Overlord?\"||Caiaphas has not heard of any such resistance group, though he can get messages through to the large number of Judain who are in hiding throughout the city.||\"Who is our leader now?\" you ask. \"Are the elders all dead or gone?\"||Annas, a small man with a quavering, flute-like voice tells you, \"They were taken together, as they met in the synagogue to discuss the Overlord's edict.\"||\"And did all the folk of the city just stand by?\"||\"Yes, they did, or denounced us to the guards.\" There are sounds from the street above. An iron-tyred cart is being pulled past the smashed door to the hovel. You wait for it to pass before lowering your voice to say, \"How safe are we down here?\"||\"As safe as anywhere,\" is Caiaphas's opinion.||\"But do you plan to stay here for the rest of your lives?\" He just shrugs helplessly. \"What do you do for food?\" you go on.||\"We have enough food and water for another two weeks,\" puts in Annas.||\"And what then?\" Again they shrug. \"We must do something. Organize ourselves. Band together for our own protection.\"||\"It would accomplish nothing,\" Caiaphas replies despondently.">
<CONSTANT CHOICES081 <LTABLE "immediately organize a resistance movement among the Judain" "remain in hiding in the cellar while formulating a plan">>

<ROOM STORY081
	(DESC "081")
	(STORY TEXT081)
	(CHOICES CHOICES081)
	(DESTINATIONS <LTABLE STORY111 STORY121>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT082 " You choose a place where the road winds beneath copses of trees and wait. The horsemen are wearing the purple and black livery of the Overlord of Godomo and it seems they are tracking you. To attack them would be dangerous, there are too many of them you reluctantly decide, so you let them pass and double back making haste to put distance between yourself and your pursuers before they realize they have been thrown off the scent.">

<ROOM STORY082
	(DESC "082")
	(STORY TEXT082)
	(CONTINUE STORY171)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT083 "You hack wildly at the purple flesh of Hate to free Mameluke, who strains against the suffocating flesh. Your sword rips dark maroon welts in the flesh of Hate which puckers and drools a pale pink viscous mucus. After three minutes of wild work with the sword your arms are aching, but Mameluke is able to pull himself free with one last effort. Pausing to wipe some of the pink mucus off your face, you clasp the Tartar's hand and tell him you are taking him home for a bath. Hate's coil is twitching and still bleeding the pink mucus. Your skin crawls where the sticky secretions landed on your bare face.">

<ROOM STORY083
	(DESC "083")
	(STORY TEXT083)
	(CONTINUE STORY185)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT084 "The underside of the monster is lined with wicked barbs oozing amber fluid. They must be poisoned.">
<CONSTANT CHOICES084 <LTABLE "couch beneath your upheld sword so that the monster impales itself on your blade" "hack at it as it descends to envelop you">>

<ROOM STORY084
	(DESC "084")
	(STORY TEXT084)
	(CHOICES CHOICES084)
	(DESTINATIONS <LTABLE STORY127 STORY145>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT085 "Your journey back to the city takes no longer than your outward trek. By midday of the third day you are before the battlemented towers and guarded walls of the great city. Carrion crows wheel in great flocks above the city and the wind carries the dismal cries of the poor unfortunates being tortured in the prison fortress of Grond to your unwilling ears. You approach the gates with trepidation.">

<ROOM STORY085
	(DESC "085")
	(STORY TEXT085)
	(CONTINUE STORY188)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT086 "The inside of the Silver Eel is much as you expected. Sawdust covers curdled puddles of vomit or blood on the creaking floor. There are rough trestles for seats, a few with initials carved deep into the dark old wood -- it is amazing that most of these lowlifes even know how to write their initials. The thick green bottle-glass in the lanterns gives the whole of the interior a strange unreal look. A dozen pairs of eyes swivel, assessing you at a glance before returning to drinks or companions.||The tall blond man has walked to the bar and ordered firewater for himself and lemon bitters for Lucie. He is dressed in a suit of the most outlandish leather and mail armour you have ever seen. It is a patchwork quilt of jagged bosses and scales, which altogether make a very striking and rather chilling outfit to look upon.||The landlord, an ex-captain at the duelling school with scars and the tip of an ear missing as testament to the many fights he has been in with unruly customers, is quick to serve this towering figure of a young man. Lucie is quite at ease with him as if she knows him well.||The tall blond man darts a glance at you and looks quizzical. He is very pale of skin and his cheekbones are dusted with freckles. Lucie puts her arm around his waist and whispers something. He replies and you hear the word 'Judain', after which he hawks a gobbet of phlegm into the sawdust. He puts his hand on Lucie's bottom but she smacks it away and takes her drink to a table in a nook at the back of the tavern, followed by the tall stranger. There is a group of four men drinking small beer who could be either artisans or thieves. Two women wearing lace and silks and not much of either laugh scurrilously in the alcove beyond, and a single dark figure lurks at the far end of the bar smoking a pipe.">
<CONSTANT CHOICES086 <LTABLE "order a drink from the bar" "ask the gang of four where you can find Melmelo the master thief" "join Lucie and the tall stranger">>

<ROOM STORY086
	(DESC "086")
	(STORY TEXT086)
	(CHOICES CHOICES086)
	(DESTINATIONS <LTABLE STORY113 STORY132 STORY227>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT087 "You tried to leap too far. You fall with a thump among the writhing garter snakes. The snakes intertwine around your legs and arms, their forked tongues questing for bare flesh. They sink their venomed fangs into your flesh and your body is soon hot with poison. Unconsciousness comes as a blessed release. You are just another would-be thief. There is no one left alive to save the Judain now.">

<ROOM STORY087
	(DESC "087")
	(STORY TEXT087)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT088 "It might have been better to disappear in a puff of smoke first. A young Judain turning suddenly, by the use of magic, into an aged bent old crone fools no one. The guard close in around you and cut you down while the townsfolk howl with glee. There is no one left to save the Judain now.">

<ROOM STORY088
	(DESC "088")
	(STORY TEXT088)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT089 "You draw Hate's attention by waving your arms as you retreat to the back of the plaza. Two tentacles sweep towards you, but you evade them by ducking into the pillared portico of a church. As the tentacles snake around on either side of the pillar, feeling for you, you slip the chains around the slimy purple flesh and lock them into place.||Hate gives a roar of rage as you stand safely back to survey your handiwork. You have tethered Hate to the portico of the church. If only the chains hold, you may be able to destroy your enemy once and for all.">
<CONSTANT CHOICES089 <LTABLE "use the" "use the" "you have neither of those items">>

<ROOM STORY089
	(DESC "089")
	(STORY TEXT089)
	(CHOICES CHOICES089)
	(DESTINATIONS <LTABLE STORY230 STORY349 STORY187>)
	(REQUIREMENTS <LTABLE JADE-WARRIORS-SWORD JEWEL-OF-SUNSET-FIRE NONE>)
	(TYPES <LTABLE R-ITEM R-ITEM R-NONE>)
	(CODEWORD CODEWORD-GORDIAN)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT090 "You pass a restful night. As the sun slants in through the broken cellar roof, you get ready to set out for your rendezvous with Lucie.">

<ROOM STORY090
	(DESC "090")
	(STORY TEXT090)
	(CONTINUE STORY007)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT091 "By dint of desperate effort, you succeed in freeing yourself from the body of Hate. Mameluke has by now been completely engulfed. Mourning the loss of your brave Tartar friend, you return to your hideout on Bumble Row.">

<ROOM STORY091
	(DESC "091")
	(STORY TEXT091)
	(CONTINUE STORY159)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT092 "Your stiffened fingers lash out as fast as a striking cobra, jabbing into the cluster of nerves at the base of his palm. His fingers immediately go limp and he drops the knife without even feeling any pain. You snatch it up from the cobblestones before he can take stock of what has happened.||A moment later, he gives a sob of frustrated rage and launches a kick at your midriff. You easily catch his foot and draw it up, pulling him off-balance as you step closer to look him straight in the eye.||\"I wonder if you're also the sort who kicks dogs?\" you say softly, but with a hard look in your eye. \"Beware, if so. You'll find that we Judain are like wolfhounds. We bite back.\"||So saying, you give his leg a twist so that he is thrown over onto his back in the street. Pocketing his knife so that it cannot be used against another of your people, you saunter off in the direction of Greenbark Plaza.">

<ROOM STORY092
	(DESC "092")
	(STORY TEXT092)
	(CONTINUE STORY201)
	(ITEM KNIFE)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT093 "Your blow is so forceful that your arm sinks into the soft purple flesh of Hate up to the elbow. When you try to withdraw it to strike again the flesh ripples and shudders, pulling you in. Try as you might you can't get free.">
<CONSTANT CHOICES093 <LTABLE "brace yourself with your foot against the monster's purple flesh" "keep trying to free yourself without touching Hate with any other part of you">>

<ROOM STORY093
	(DESC "093")
	(STORY TEXT093)
	(CHOICES CHOICES093)
	(DESTINATIONS <LTABLE STORY151 STORY065>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT094 "The heads of each cell have risked coming together at the granary warehouse behind the old army stables on Slipshod Row. There are some two hundred people here, waiting for you to address them. Now that they are standing up to the Overlord, they are regaining their self respect. They report the number of their people dragged off to the Grand by the Overlord's guards is much diminished. Resistance fighters have assassinated over thirty key figures in the bureaucracy. If they continue to act with such success the Overlord will soon have to meet your demands.||\"There is bound to be a backlash,\" you caution.||\"Beware of anyone who is not of our people. They are jealous of us. At the end of this meeting, I am going to give you all new assignments and new safe houses in which to lie low. If we keep moving like this the Overlord's men can never find us all, even if they catch one of us for torture.\"||Your people are cheered to find you have thought about the situation and they look to you increasingly for leadership.">

<ROOM STORY094
	(DESC "094")
	(STORY TEXT094)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT095 "Tormil's sword seems to stick fast in the body of the purple mass. The weapon is pulled from his grasp and then the whole bloated purple mass rolls over, crushing Tormil beneath it. His flattened body is already being absorbed. Terror draws bile into your throat and you cannot help giving a small cry of horror. Averting your face, you leave the grisly scene behind. You are ashamed to think you could have led any foe into such a trap, even a cur like Tormil.">

<ROOM STORY095
	(DESC "095")
	(STORY TEXT095)
	(PRECHOICE STORY095-PRECHOICE)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY095-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-SATORI>
		<DELETE-CODEWORD ,CODEWORD-SATORI>
	)>>

<CONSTANT TEXT096 "Bafflement is a powerful spell to use against a single dire opponent. But even if you succeeded in confusing one of the Jade Warriors, the others would still cut you down.||As it is they have no mind as we understand it. They are automata, immune to your spell. The Jade Warriors whirr and click menacingly as they advance to surround you with swords aloft. There is no time to cast another spell: Their sharp blades lance your vitals and rob you of life. The burial vaults of the Megiddo dynasty remain inviolate. Your last thought is that, now you are slain, there is no one who can save the Judain and Hate will conquer all.||Vanity of vanities ...">

<ROOM STORY096
	(DESC "096")
	(STORY TEXT096)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT097 "You cast a Bafflement spell on Tormil, hoping to be able to lead him away from the grisly scene of his daughter's living entombment. The spell works and Tormil seems to forget everything but his daughter. He tries to embrace her and stares nonplussed at the cloying purple flesh which will not let him go. There is nothing you can do to save him as he is drawn into the body of Hate. He is already another lost soul.">

<ROOM STORY097
	(DESC "097")
	(STORY TEXT097)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT098 "It is a difficult leap but you just make it, launching yourself high in the air from a short run up. You land beside the girl and the bodies on the bed rock as the bedsprings bounce. The Overlord twitches again but does not awaken, while the girl lies inert, her back still towards you. You carry the concubine off for questioning.">

<ROOM STORY098
	(DESC "098")
	(STORY TEXT098)
	(CONTINUE STORY231)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT099 "Your confident look unnerves him. He expected fear or anger but you treat him as if he were a harmless stranger asking the way. You guess from the red dye which stains his wrists that he is a tanner's son. Judging by the state of his clothing his father is poor, probably in debt to a Judain, else why would the youth show such malice towards you? You decide to bluff him.||\"Be careful, young one,\" you say, \"you know what happens if we Judain withdraw a loan -- debtors' prison or debt slavery if you can't pay up. You have a strong resemblance to one of my clients, a tanner down on his luck. Your father, perhaps?\"||You are lucky, your hunch was right. His father must be in debt. The youth won't risk harming you in case of losing the roof over his head. He slinks away.">

<ROOM STORY099
	(DESC "099")
	(STORY TEXT099)
	(CONTINUE STORY201)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT100 "What do you want to do next?">
<CONSTANT CHOICES100 <LTABLE "seek out Melmelo, the master of the Guild of Thieves" "visit the library to look for more information about Hate" "organize the defence of the city" "go to confront Hate itself">>

<ROOM STORY100
	(DESC "100")
	(STORY TEXT100)
	(CHOICES CHOICES100)
	(DESTINATIONS <LTABLE STORY100-MELMELO STORY100-LIBRARY STORY174 STORY272>)
	(TYPES FOUR-NONES)
	(FLAGS LIGHTBIT)>

<ROOM STORY100-MELMELO
	(DESC "100")
	(EVENTS STORY100-MELMELO-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY100-MELMELO-EVENTS ()
	<COND(<CHECK-CODEWORD ,CODEWORD-SUNSET>
		<RETURN ,STORY117>
	)(<CHECK-CODEWORD ,CODEWORD-IMPASSE>
		<RETURN ,STORY026>
	)(<CHECK-CODEWORD ,CODEWORD-COOL>
		<RETURN ,STORY334>
	)(ELSE
		<RETURN ,STORY153>
	)>>

<ROOM STORY100-LIBRARY
	(DESC "100")
	(EVENTS STORY100-LIBRARY-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY100-LIBRARY-EVENTS ()
	<COND(<CHECK-CODEWORD ,CODEWORD-CODEX>
		<RETURN ,STORY049>
	)(ELSE
		<RETURN ,STORY110>
	)>>

<CONSTANT TEXT101 "\"Your money or your life,\" comes the age-old cry from the leader. The horsemen are brigands, disguised as the Overlord\'s men!">
<CONSTANT CHOICES101 <LTABLE "surrender everything you have to them" "ask to join their merry band and live the next chapter of your life as a brigand">>

<ROOM STORY101
	(DESC "101")
	(STORY TEXT101)
	(CHOICES CHOICES101)
	(DESTINATIONS <LTABLE STORY008 STORY064>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT102 "You speak the word of power and disappear, but the Jade Warriors must be sensing you by some other means than sight. Skulking in the shadows will not avail you here. They lurch menacingly towards you. You have no time to cast a spell and are powerless as the Jade Warriors surround you and slice into your vitals with their razor-sharp swords. You are slain. There is no one left now to save the Judain. Hate will subdue all.">

<ROOM STORY102
	(DESC "102")
	(STORY TEXT102)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT103 "You try to duck the tentacle but it crashes down, smashing you like an avalanche crushing you into the midst of a mound of rubble that was once the Bargello, the strongest building in the city. The monster carries all before it. Soon you are all partners in the eternal orgy of despair. The city crumbles and is lost for ever beneath the waves. Hate has completed its work.">

<ROOM STORY103
	(DESC "103")
	(STORY TEXT103)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT104 "You conjure a cloud of smoke which engulfs you and all those nearby. The crowd and the soldiers fall back. The smoke makes them cough and their eyes smart, but it doesn't affect you. You then cast a spell of Disguise and those who can still see pay no attention to a bent old woman coughing and rubbing her eyes, who staggers out of the smoke and shuffies away from the plaza. Still looking like an old woman you run nimbly away from the plaza, ducking under a milk cart as you feel the spell start to wear off. Then, looking like yourself again, you go on. You hide your face from strangers as far as possible but the people of Godorno are mad for the blood of the Judain and you soon attract suspicion once more.">

<ROOM STORY104
	(DESC "104")
	(STORY TEXT104)
	(CONTINUE STORY038)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT105 "It looks like there is no back exit from this building, but you recall seeing a trap door in the alley running behind it. Dragging the frightened Ruth behind you, you descend to the cellar. Sure enough, there is a ramp for delivery of wine barrels. You make your escape, emerging in the alley at the back of the house while the soldiers are bursting in the front way.||Ruth cannot thank you enough. \"My baby will be born, thanks to you,\" she sobs as you lead her back to Copper Street.||\"I hope to save many others,\" you tell her. \"All our people, in fact.\" Once she is safe with Caiaphas, you return to your own bolthole.">

<ROOM STORY105
	(DESC "105")
	(STORY TEXT105)
	(CONTINUE STORY414)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT106 "The Overlord's men are tipped off by a mysterious informer. You are ambushed on your way to the meeting and have to fight to get away. As you run, a crossbow quarrel buries itself in your shoulder.">
<CONSTANT TEXT106-CONTINUED "You return to Copper Street to hear the terrible news. Many other Judain were also captured and are now swinging dead in gibbets beside the Avenue of Skulls. \"There is no trust in the hellpit this city has become,\" groans Caiaphas, himself bleeding from a deep gash across his forehead. He barely escaped from the meeting alive.||\"From now on, secrecy shall be our watchword,\" you agree. You find yourself a hideout on Medallion Street. Only a few handpicked comrades know where to find you. You are determined not to let the Overlord's men set another trap for you.">

<ROOM STORY106
	(DESC "106")
	(STORY TEXT106)
	(PRECHOICE STORY106-PRECHOICE)
	(CONTINUE STORY414)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY106-PRECHOICE ()
	<TEST-MORTALITY 3 ,DIED-FROM-INJURIES ,STORY106>
	<IF-ALIVE ,TEXT106-CONTINUED>>

<CONSTANT TEXT107 "The jewel sparkles in the rays of the setting sun and then kindles into a blinding aura. There is a flaring sound and a beam of ruby light strikes Hate between the eyes like a mace blow. The monster squirms and writhes, desperate to free itself from the chains that have bitten deep and scored its soft purple flesh, but it cannot yet break free. With a last great spasm it starts to rip the chains away from their anchorage in the plaza and prepares to fall upon the parapet and smash you and the Bargello into the water.||The chains are pulling apart. A link snaps with a sound like a pot of Greek fire exploding and plumes of water turn to steam in the ruby beam. The sun is about to slip from the heavens and dusk is upon you. IfHate is not destroyed before nightfall you have no hope.">

<ROOM STORY107
	(DESC "107")
	(STORY TEXT107)
	(PRECHOICE STORY107-PRECHOICE)
	(CONTINUE STORY364)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY107-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-SATORI ,STORY401>
	<CODEWORD-JUMP ,CODEWORD-HECATOMB ,STORY077>>

<CONSTANT TEXT108 "You duck too late. In your last moment you see the dagger arcing through the air, its blade glinting in the light of the lanterns as it flies unerringly towards your neck. You fall to the floor, impaled, and Skakshi gloats.||\"What a shame I can't claim the extra reward for bringing in a live Judain for the torture,\" he chuckles to himself, satisfied his standing amongst his villainous peers is all the higher for having despatched you with contemptuous ease. There is no one left to save the Judain now. Hate will subdue all.">

<ROOM STORY108
	(DESC "108")
	(STORY TEXT108)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT109 "Disturbed by your noise, the Overlord yawns, rubs sleep out of his eyes and looks about him. As he sees you his eyes widen with fear and he reaches furtively beneath his pillow. He pulls out a small blowpipe and puffs out a tiny dart which bites into your neck like a hornet sting. It is tipped with curare, a very painful death. There is no one left now to save the Judain. Hate will subdue all.">

<ROOM STORY109
	(DESC "109")
	(STORY TEXT109)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT110 "You slip into the great yellowstone library of Brunelesci unseen and take down what is a recent invention: the combined dictionary and bestiary. Crouching beneath a reading bench you are soon immersed in the cursive script. \"Hate, hatred, detestation, abhorrence, abomination, malignity,\" and there are quotes from Senecio, one of the great playwrights of the age. \"Do all men kill the thing they do not love? Hates any man the thing he would not kill?\" and \"The monster that turneth man against his daughter and mother against her firstborn son, servitor of Death and handmaid to Destruction, maker of wars and inspiration of man's blackest deeds.\"||According to the scholar who compiled the lexicon and bestiary, \"Hate always shows its true face and so may be bested, \"Unfortunately he does not write how to overcome the monster. There is much written here, it is almost as if he was obsessed, \"In concert with Fear the most terrible of the Trinity of the Dark, Hate feeds on the bodies and souls of those who have given themselves up to the monster's embrace in despair, depravity and degradation.\"||You are still staring in fascination at the illuminated pages of the manuscript when the door opens and a soft-footed scholar librarian comes into the book-lined room. You have read enough and will learn nothing more here, so you creep out and return to Bumble Row, none the wiser but a little more oppressed of spirit.">

<ROOM STORY110
	(DESC "110")
	(STORY TEXT110)
	(CONTINUE STORY160)
	(CODEWORD CODEWORD-CODEX)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT111 "Caiaphas's wife, Ruth, asks, \"Will we have to share our food with this stranger? There is precious little to go round as it is, without our having to feed every down-at-heel ragamuffin who stumbles across our hideout.\"||\"Be quiet, woman. We will feed all of our kind.\" Ruth used to be a generous mild-mannered woman who wouldn't hurt a flea. Adversity has certainly hardened her. \"Well spoken, Caiaphas,\" you say. \"Ruth, did you not know this miserable hovel is my home?\"||\"Haven't you heard? We Judain cannot own property. We cannot even walk the streets. We haven't moved from this miserable place for days.\"||\"What, none of you?\" You look to Caiaphas in surprise. \"Has no one ventured out for food or information?\"||Caiaphas shakes his head and looks at the ground.">
<CONSTANT CHOICES111 <LTABLE "ask him how they pass messages" "quit the safety of the cellar to seek out more information and contacts to help the Judain cause">>

<ROOM STORY111
	(DESC "111")
	(STORY TEXT111)
	(CHOICES CHOICES111)
	(DESTINATIONS <LTABLE STORY131 STORY141>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT112 "Rubbing the green emerald amulet ostentatiously you chant an incantation. A green glow suffuses your face evilly as the amulet lights up magically from within. The youth blenches, he makes a sign invoking the protection of one of the gods of Godorno, Hecasta the patroness of enchanters, and backs away.||\"Judain witch. A plague take you and the pox turn you to dust,\" he mutters.||If that was his best effort at a curse, you have nothing to fear. He daren't challenge someone as powerful as you.">

<ROOM STORY112
	(DESC "112")
	(STORY TEXT112)
	(CONTINUE STORY201)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT113 "The landlord is ignoring you, cleaning glasses that already sparkle in the sombre red light. The pipesmoker gives you a glance, then turns away. You can hear two women gossiping about the fate of some of their Judain acquaintances. \"It wouldn't do to call them friends in these times -- well, would it, darling?\"||At the far end of the tavern the tall stranger is staring morosely at his drink, while Lucie watches him fondly.">
<CONSTANT CHOICES113 <LTABLE "tolerate the landlord's rudeness" "force him to serve you">>

<ROOM STORY113
	(DESC "113")
	(STORY TEXT113)
	(CHOICES CHOICES113)
	(DESTINATIONS <LTABLE STORY158 STORY169>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT114 "Seeking out some of your unsavoury underworld contacts, you manage to get an offer of 900 gleenars for the diamond. You know it is worth much more than that. So does the fence, who says, \"You're lucky I deal with you at all these days. You know the trouble I could get into for talking to a Judain?\"||\"Not as much trouble as if that Judain told the Overlord's men about you handling the Overlord's own diamond,\" you say with an ingenuous smile.||He curses under his breath, but finally agrees to pay you 1,000 gleenars for the diamond.">
<CONSTANT TEXT114-CONTINUED "On your way back to join the others, you pass a narrow shop. You recognize it as the shop of Tarkamandor the Sage, where you have occasionally bought interesting items in the past. A lamp is burning in the window. You creep up and peek through the shutters. Tarkamandor is alone, polishing a carved ebony staff at his work bench">
<CONSTANT CHOICES114 <LTABLE "knock at the door" "get back to Caiaphas and the others">>

<ROOM STORY114
	(DESC "114")
	(STORY TEXT114)
	(PRECHOICE STORY114-PRECHOICE)
	(CHOICES CHOICES114)
	(DESTINATIONS <LTABLE STORY318 STORY190>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY114-PRECHOICE ()
	<COND (<AND <CHECK-ITEM ,DIAMOND> ,RUN-ONCE>
		<TELL CR "Sell him the diamond?">
		<COND (<YES?>
			<GAIN-MONEY 1000>
			<LOSE-ITEM ,DIAMOND>
		)>
	)>
	<TELL ,TEXT114-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT115 "You jump for the rope and clasp it tight, swinging out above the living carpet of serpents. You swing over one of the box platforms and towards another. The serpents' heads sway in time with you, their jaws wide to reveal dripping black venom.">
<CONSTANT CHOICES115 <LTABLE "let the rope go and jump to the far platform" "content yourself with alighting on the middle platform beneath where the rope hangs from the ceiling">>

<ROOM STORY115
	(DESC "115")
	(STORY TEXT115)
	(CHOICES CHOICES115)
	(DESTINATIONS <LTABLE STORY087 STORY074>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT116 "The late afternoon sun slants over the close-packed rooftops and through the open doorway of the hovel where you are hiding. You have an inspiration. Lifting your amulet, you tilt it so that the gem reflects the sunbeam out onto the wall on the opposite side of the street. The guards are standing waiting for the dogs to be brought, but one of them catches the flicker of reflected light out of the corner of his eye. He spins, looking along the street away from where you're hiding, and yells, \"Hey! I saw something dart down that alley over there. Come on, lads!\"||While they race off chasing sunbeams, you help Ruth to the safety of the Copper Street hideaway. Then you slink back to your own bolthole.">

<ROOM STORY116
	(DESC "116")
	(STORY TEXT116)
	(CONTINUE STORY414)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT117 "You find Melmelo packing his belongings into a cart which is watched closely by his burly bodyguards. He himself carries a heavy treasure chest and loads it onto the cart.||\"Leaving town, Melmelo?\" you ask.||He nods. \"Take my advice, Judain. Get out while the going is good.\"||You give a puff of bitter laughter. \"You call this good? My people are the victims of a slaughter!\"||\"It'll get far worse than this,\" says Melmelo. \"I'm off to Mazarkhand before the Overlord sets his sights on my wealth. Don't try to seek me out again, Judain. You'll find my friends remaining in the city will cover my tracks.\"||Agreeing not to come here again, you walk away. It is tempting to think you might leave the city yourself, but your people need you.">

<ROOM STORY117
	(DESC "117")
	(STORY TEXT117)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT118 "Rising quickly on to tiptoe, you slip the noose snare from your ankle and somersault backwards. The black blanket, like a vampire's cloak, falls to the floor with a heavy thump. You have escaped the first of the defences of the ,Overlord's bedchamber. The black monster flops about feebly then falls still.">
<CONSTANT CHOICES118 <LTABLE "stay here to see what new trick or trap will test you next" "retreat back into the catacombs">>

<ROOM STORY118
	(DESC "118")
	(STORY TEXT118)
	(CHOICES CHOICES118)
	(DESTINATIONS <LTABLE STORY139 STORY161>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT119 "From your knowledge of mythology you remember that the Jade Warriors were set to guard the tombs of the Megiddo dynasty. Legend has it that one of the swords is the key to controlling the warriors. If you can get that sword you may be able to command them to do your bidding, perhaps even lead against the Overlord or the monster itself.">
<CONSTANT CHOICES119 <LTABLE "look as closely as you can at the flashing haloed blades" "attempt to grab the nearest one from the grip of the Jade Warrior which hefts it">>

<ROOM STORY119
	(DESC "119")
	(STORY TEXT119)
	(CHOICES CHOICES119)
	(DESTINATIONS <LTABLE STORY157 STORY170>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT120 "You are no expert on the ways of bargees, who are looked down upon by real seamen. You do know, however, that the tide is due to rise strongly this evening and that the bargees like to do the hard work of poling their barges upstream on a rising tide at dusk when it is no longer unbearably hot.||There are three barges at the quay. The first is a big barge which is little more than a wide raft. It has a huge pile of lime for cargo. The second has just been unloaded, an ordinary grain barge; you can see rats scavenging the dropped grains of corn. The third is a smaller barge with a shallow draught which is loaded with barrels under a tarpaulin. These shallower barges are used on the small tributary, the Palayal river, which descends from the great forest to the north. This looks the most likely barge to leave on the tide.">
<CONSTANT CHOICES120 <LTABLE "hide under the tarpaulin on the small barge" "hide in the lime on the raft barge" "join the rats on the grain barge">>

<ROOM STORY120
	(DESC "120")
	(STORY TEXT120)
	(CHOICES CHOICES120)
	(DESTINATIONS <LTABLE STORY183 STORY152 STORY166>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT121 "You grow steadily weaker on the meagre diet of scraps.">
<CONSTANT TEXT121-CONTINUED "Since it is too dangerous to risk lighting a fire, some of the others suggest catching rats and salting strips of their flesh to eat when the rations run out. The thought is as revolting to you as it is to Caiaphas the rabbi.||\"Is it our destiny to spend our last days like ravening beasts?\" he asks. \"No! We are the Chosen People -- let us go forth and die gloriously against the Overlord's men.\"||He snatches up his spear and climbs the steps to the trap door, but then you call out something that stops him in his tracks, and he and the other Judain all turn to look at you in a new light.||\"Die gloriously?\" you say. \"Why do that, when we can win?\"||For the first time in days, there is a look of hope in their eyes. They wait to hear your plan. You must not let them down.">

<ROOM STORY121
	(DESC "121")
	(STORY TEXT121)
	(PRECHOICE STORY121-PRECHOICE)
	(CONTINUE STORY131)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY121-PRECHOICE ()
	<TEST-MORTALITY 2 ,DIED-GREW-WEAKER ,STORY121>
	<IF-ALIVE ,TEXT121-CONTINUED>>

<CONSTANT TEXT122 "The casting of the Rulership spell was most inadvisable. You are attacking the mind of a being that has already overcome and subdued those minds and bodies of millions before you. Do you think they were all feeble-minded dolts eager to share Hate's embrace? Hate's mind is like a god's, incomprehensible and unfathomably powerful. With a great cry of joy you throw wide your arms and plunge into the hot purple softness of Hate, to join the eternal orgy of despair. There is no one left to save the Judain now. Hate will conquer all.">

<ROOM STORY122
	(DESC "122")
	(STORY TEXT122)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT123 "You steal up behind one of the Jade Warriors and throw yourself against its sword arm, wrenching the blade from its grasp.||\"Obey me, Jade Warriors of the Megiddo dynasty!\" you cry on impulse.||Their only response is to whirr and swivel towards you and advance with swords aloft. There seems no escape from their deadly flashing blades, and you cry out in agony as your stolen sword is dashed from your grip and you are cut to the bone.">
<CONSTANT TEXT123-CONTINUED "You flee from the tomb chamber">

<ROOM STORY123
	(DESC "123")
	(STORY TEXT123)
	(PRECHOICE STORY123-PRECHOICE)
	(CONTINUE STORY016)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY123-PRECHOICE ()
	<TEST-MORTALITY 4 ,DIED-IN-COMBAT ,STORY123>
	<IF-ALIVE ,TEXT123-CONTINUED>>

<CONSTANT TEXT124 "You dart across the street and snatch up the sword before the dog-handler can stop you. The dog starts to run forward, but you prod it with the point of the sword and it goes skulking back to its master with its tail between its legs.||You look around for Lucie. She is heading towards the Old Quarter, probably to the Silver Eel tavern which is one of her haunts. You know it as a dubious drinking-house whose customers have a dangerous reputation.">
<CONSTANT CHOICES124 <LTABLE "follow Lucie now" "return to Bumble Row for the time being and seek her out this afternoon">>

<ROOM STORY124
	(DESC "124")
	(STORY TEXT124)
	(CHOICES CHOICES124)
	(DESTINATIONS <LTABLE STORY261 STORY371>)
	(TYPES TWO-NONES)
	(ITEM SWORD)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT125 "You reach the safety of one of the buildings just as the horsemen reach the first farmstead and begin torching it. There are nearly thirty of them, cruel looking men and well armed -- clearly they are brigands who have donned the uniforms of the Overlord's men.||The peasants have fled to the hills; those who were too slow to make off with their most treasured possessions have to plead for their lives.">
<CONSTANT CHOICES125 <LTABLE "rely on your magic and make yourself invisible" "throw in your lot with them, hoping they will let you join their band">>

<ROOM STORY125
	(DESC "125")
	(STORY TEXT125)
	(CHOICES CHOICES125)
	(DESTINATIONS <LTABLE STORY018 STORY064>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS NONE>)
	(TYPES <LTABLE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT126 "You grab Ruth by the shoulder and pull her into the cesspit at the back of the empty house. The smell is revolting, and you nearly throw up when you have to push your face down into the rancid ordure. The guards conduct a search of the vicinity and one of them pokes his head through the open doorway, but it does not occur to him that anyone could bring themselves to take cover where you have done. Indeed, the very art of concealment is to hide where your enemy does not think to look!||When they have gone, you help Ruth out into the street. \"We look like two escaped lunatics,\" she wails, wiping the greasy muck off her face.||\"It's nothing that a few pails of water won't cure,\" you assure her. \"I can't say we'd be as easy to set right after a spell in the prison.\" Bidding her goodday, you return to your hideout.">

<ROOM STORY126
	(DESC "126")
	(STORY TEXT126)
	(CONTINUE STORY414)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT127 "Bracing yourself, you crouch with both hands holding your sword aloft. The monster wraps itself around the sword point, constricts and pierces itself. There is no blood but with one mighty rip you cleave the thing in twain. It flops on the floor, twitching slightly, then falls still. Only sorcery can create a beast without any lifeblood in it.">
<CONSTANT CHOICES127 <LTABLE "stay here to see what new trick or trap will test you next" "retreat back into the catacombs">>

<ROOM STORY127
	(DESC "127")
	(STORY TEXT127)
	(CHOICES CHOICES127)
	(DESTINATIONS <LTABLE STORY139 STORY161>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT128 "You have no difficulty, even in these troubled times, finding a foreign merchant who will give you 600 gleenars for the diamond. You know it is worth much more than that, but the merchant shows you the gold in a sack. \"Others could promise more,\" he points out, \"but you might wait forever to get your hands on the gold. I offer an immediate exchange.\"">
<CONSTANT TEXT128-CONTINUED "You return to your fellow Judain">

<ROOM STORY128
	(DESC "128")
	(STORY TEXT128)
	(PRECHOICE STORY128-PRECHOICE)
	(CONTINUE STORY190)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY128-PRECHOICE ()
	<COND (<AND <CHECK-ITEM ,DIAMOND> ,RUN-ONCE>
		<TELL CR "Sell him the diamond?">
		<COND (<YES?>
			<GAIN-MONEY 600>
			<LOSE-ITEM ,DIAMOND>
		)>
	)>
	<TELL ,TEXT128-CONTINUED>
	<TELL ,PERIOD-CR>>

<CONSTANT TEXT129 "The gold plume sways as the Jade Warrior swivels its head to observe you closely, brandishing its sword as it does so. It clicks and whirrs ominously as it advances to do battle. You steal up behind the Jade Warrior and throw yourself against its sword arm, wrenching the blade from its grasp.||The other warriors close in around you and though you defend yourself ably with the Jade Warrior's sword you are no match for three magical bodyguards of the Megiddo dynasty vaults. You are slain and there is no one left who can save the Judain. Hate will conquer all.">

<ROOM STORY129
	(DESC "129")
	(STORY TEXT129)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT130 "The youth is quick and he moves to stab you in the back as you flee.">
<CONSTANT TEXT130-AGILITY "But you are faster and soon leave him behind">
<CONSTANT TEXT130-INJURED "You feel a sharp cold pain as the blade bites into sinew and muscle and rasps against your shoulderblade as blood stains your clothes dark red">
<CONSTANT TEXT130-ALIVE "You are lucky it was not a killing blow. This guttersnipe is good with his knife.">
<CONSTANT TEXT130-CONTINUED "\"I thought you Judain had black blood,\" he sneers as he lets you go.">

<ROOM STORY130
	(DESC "130")
	(STORY TEXT130)
	(PRECHOICE STORY130-PRECHOICE)
	(CONTINUE STORY201)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY130-PRECHOICE()
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<CRLF>
		<TELL ,TEXT130-AGILITY>
		<TELL ,PERIOD-CR>
		<PREVENT-DEATH ,STORY130>
	)(ELSE
		<CRLF>
		<TELL ,TEXT130-INJURED>
		<TELL ,PERIOD-CR>
		<TEST-MORTALITY 1 ,DIED-FROM-INJURIES ,STORY131>
		<IF-ALIVE ,TEXT130-ALIVE>
	)>
	<IF-ALIVE ,TEXT130-CONTINUED>>

<CONSTANT TEXT131 "The Judain have long had a system for moving gold around the city unseen. They now carry messages in the same way, using dives and back streets, safe houses, and, sometimes, even the catacombs. You can contact all the Judain through them, but their morale is low. So many of their kith and kin have been carried off to Grond.||\"Do not despair. Are we not a proud people?\" you say. \"We have many advantages. First, the Overlord fears us, or why else would he turn his guards against us? Second, we know the secret ways bentath the city and we can already pass messages without fear of interception. Third, we have a leader now: me.\"||Caiaphas protests, \"But what can we do? We are not armed. Each of us has already lost a loved one, swinging in an iron cage. We will all stiffer the same fate if we come out of hiding.\"||\"Then we will stay hidden, strike only at night, always in a different part of the city. Let us strike fear into the hearts of the good burghers of Godorno. Let no one say the Judain are cowards.\"||\"And we have money, stashed in the vaults under the warehouses in The Crescent Canal Avenue.\"||\"How much?\"||\"A talent. The weight of a man in gold.\" This is unlooked-for good news. The cunning Judain can do much with their money. Men can be bought as easily in the godforsaken city of Godorno as anywhere.">
<CONSTANT CHOICES131 <LTABLE "suggest holding a meeting in one of the old warehouses on Crescent Avenue" "give the word to stay hidden but organize into cells of five people each with a different target">>

<ROOM STORY131
	(DESC "131")
	(STORY TEXT131)
	(CHOICES CHOICES131)
	(DESTINATIONS <LTABLE STORY106 STORY175>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT132 "\"You want to ask Skakshi,\" says one of the four men. \"Where is he to be found?\"||They laugh mockingly at this. \"In the Inn of the Inner Temple, of course -- when he's not out jewelling, that is!\"||You will get no more out of them.">
<CONSTANT CHOICES132 <LTABLE "order a drink from the bar now" "join Lucie and the tall stranger" "leave">>

<ROOM STORY132
	(DESC "132")
	(STORY TEXT132)
	(CHOICES CHOICES132)
	(DESTINATIONS <LTABLE STORY113 STORY227 STORY199>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT133 "Each of the Jade Warriors has a vivid plume of feathers adorning his helmet. One is azure, another black, the third is viridian and the fourth old gold. You decide to try to take one of their swords, but which one will you take?">
<CONSTANT CHOICES133 <LTABLE "take from the azure-plumed warrior" "the viridian warrior" "the black-plumed warrior" "the warrior decked in old gold">>

<ROOM STORY133
	(DESC "133")
	(STORY TEXT133)
	(CHOICES CHOICES133)
	(DESTINATIONS <LTABLE STORY182 STORY123 STORY011 STORY129>)
	(TYPES FOUR-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT134 "Which barge will you stow away on? The first is a big barge which is little more than a wide raft. It has a huge pile of lime for cargo. The second has just been unloaded; it is an ordinary grain barge, and you can see rats scavenging the dropped grains of corn. The third is a smaller barge with a shallow draught. It is loaded with barrels under a tarpaulin.">
<CONSTANT CHOICES134 <LTABLE "board the first barge" "the grain barge" "the smaller barge">>

<ROOM STORY134
	(DESC "134")
	(STORY TEXT134)
	(CHOICES CHOICES134)
	(DESTINATIONS <LTABLE STORY152 STORY166 STORY183>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT135 "You grasp the amulet but it burns you. You must be in mortal peril for the stone to burn so fiercely. As it is, your hand is scorched.">
<CONSTANT TEXT135-CONTINUED "The the odour of your own charred flesh is added to the pervading stench of corruption and decay that has settled over the city like a shroud. You have dropped the pendant and it is smouldering on the carpet, melting the filigree. It is too hot to pick up.">
<CONSTANT CHOICES135 <LTABLE "jump onto the bed without stepping on the carpet" "look about to find where the danger lurks">>

<ROOM STORY135
	(DESC "135")
	(STORY TEXT135)
	(PRECHOICE STORY135-PRECHOICE)
	(CHOICES CHOICES135)
	(DESTINATIONS <LTABLE STORY140 STORY062>)
	(TYPES TWO-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY135-PRECHOICE ()
	<TEST-MORTALITY 1 ,DIED-FROM-INJURIES ,STORY135>
	<COND (<IS-ALIVE>
		<CRLF>
		<TELL ,TEXT135-CONTINUED>
		<TELL ,PERIOD-CR>
		<COND (,RUN-ONCE <LOSE-ITEM ,MAGIC-AMULET>)>
		<COND (<CHECK-SKILL ,SKILL-AGILITY>
			<SET-DESTINATION ,STORY135 1 ,STORY098>
		)(ELSE
			<SET-DESTINATION ,STORY135 1 ,STORY140>
		)>
	)>>

<CONSTANT TEXT136 "With a word of power and a clap of your hands you bring forth a great fog of noxious gas. Mameluke succumbs immediately; when the fog clears you can see he has sunk completely under the purple shimmering translucent surface of the monster. Hate doesn't seem to have suffered any ill effects from the spell, though its body convulses as it throws out a purple coil to envelop you. You turn tail and flee back to Bumble Row as quickly as you can, mourning the loss of a brave dear friend.">

<ROOM STORY136
	(DESC "136")
	(STORY TEXT136)
	(CONTINUE STORY159)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT137 "Hate sends another barrage of baneful magic against you, but you walk forth without fear. The sky above turns from indigo to the deep grey of night. The monster looms ahead of you like a great crag in the darkness of the street. You begin to recite to yourself: \"Yea, though I walk in the valley of the shadow of death, I will fear no evil ...\"||A tentacle lashes out with the force of a steel cable, only to recoil in a hissing. Hate gives vent to a bellow of pain. It cannot abide to touch you, for your soul carries none of the taint on which it thrives.||You advance until you are right in front of the monster. Its maw gapes like a great cavern from which the fetid gusts of its breath waft dreadfully.">
<CONSTANT CHOICES137 <LTABLE "step into Hate's maw" "look around for a weapon to use against it">>

<ROOM STORY137
	(DESC "137")
	(STORY TEXT137)
	(CHOICES CHOICES137)
	(DESTINATIONS <LTABLE STORY400 STORY295>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT138 "The knives are perfect for the job. You send them end over end in quick succession into the bloated gasbag of a body which is punctured. Black ichor sprays all over the room and the spider hunches up against the ceiling to die. The knives are now out of reach high in the dead spider's web.||You step up to the frame and hold the jewel aloft in both hands. The room is suffused with a glow of power. At last you have a weapon with which to combat Hate. Now all you have to do is bring it safely down from the tower.">

<ROOM STORY138
	(DESC "138")
	(STORY TEXT138)
	(PRECHOICE STORY138-PRECHOICE)
	(CONTINUE STORY308)
	(ITEM JEWEL-OF-SUNSET-FIRE)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY138-PRECHOICE ()
	<COND (,RUN-ONCE <LOSE-ITEM ,KNIFE>)>>

<CONSTANT TEXT139 "It is no trick or trap which faces you now but the tramping feet of the Overlord's personal bodyguard which alert you to danger. It sounds as if a troop of twenty men or so is approaching down one of the corridors. You can hear barked orders, they know there is an intruder.">
<CONSTANT CHOICES139 <LTABLE "stand your ground" "retreat into the catacombs">>

<ROOM STORY139
	(DESC "139")
	(STORY TEXT139)
	(PRECHOICE STORY139)
	(CHOICES CHOICES139)
	(DESTINATIONS <LTABLE STORY350 STORY161>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT140 "The leap was further than you thought. As you take off, after a short run up, your foot slips and you sprawl forward onto the carpet. The silver and gold filigree springs out of the weave and binds itself around your limbs, tightening and cutting into your flesh. You are held fast.||Above you a black shape detaches itself from the underside of the canopy of the Overlord's four-poster bed and settles heavily over you. Its skin sports rows of barbed spines that inject a poison into your bloodstream. Try as you might, you can't break free. The poison turns your blood to cloying syrup and your heart stops beating. You have died with revenge for the Judain almost within your grasp. Hate will subdue all.">

<ROOM STORY140
	(DESC "140")
	(STORY TEXT140)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT141 "It is not hard to make contact with others of your kind. The Judain are well known for their sharpness and cunning. Word has been passed round among the Judain that all is not well with the other inhabitants of the city. Hundreds of people have mysteriously disappeared without trace. Something or somebody is carrying off the people of Godorno as they sleep.||There is a rumble outside as a town house crashes to the ground, killing its occupants. The very foundations of Godorno are rotten to the core.||A madman totters down the street shouting in a hoarse croak, \"We have brought it all upon ourselves. Too much evil, bad living, we are miserable sinners suffering the retribution of divine punishment ...\" He totters on, lapsing into a babble as he is pelted with mud by women washing clothes in a water butt.">

<ROOM STORY141
	(DESC "141")
	(STORY TEXT141)
	(CONTINUE STORY212)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT142 "On your way past Bagoe you pass a series of shrines to various deities and demigods, including one sacred to the Judain. The farmer and his daughter say goodbye to you here, leaving a large watermelon and advice as to how to find the road ahead. Then they are gone. You may never meet such kind and gentle people again.||The shrine is a circle within a circle of white marble arches hung with creeper, set up on a hillside. Inside the shrine, which hasn't been visited for some time, you find the holy book of teachings, The Songs of Suleiman, which tells of the Judain's flight from captivity and their search for the Promised Land. It is full of the most marvellous stories of heroism in the face of stark adversity. The stories of your great people lift up your heart and give you the strength to dare to be a hero and the saviour of your people. You decide to return to the god-forsaken city of Godorno. The understanding you gain here in this shrine means you will never nurture hatred in your heart.">

<ROOM STORY142
	(DESC "142")
	(STORY TEXT142)
	(CONTINUE STORY171)
	(CODEWORD CODEWORD-SATORI)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT143 "There are four guards, tall heavy-looking men with cold hard eyes. Each has a sword in his right hand and a dirk with a spike for catching blows in the left. You launch yourself into them with a ferocious cry which makes them hesitate. You cannon into the nearest, jabbing him hard in the midriff, and he doubles up in pain. Then another of the guards recovers his wits and lashes out at you. You have to fight your way past them.">
<CONSTANT TEXT143-CONTINUED "Deciding that you cannot fight them all, you lead the guards off along the street. They cannot keep up with you in their heavy armour and you soon lose them. Doubling back, you meet up with Ruth and escort her back to Copper Street. She promises to tell Caiaphas you have saved her life. You bid her goodbye and return to your hideout.">

<ROOM STORY143
	(DESC "143")
	(STORY TEXT143)
	(PRECHOICE STORY143-PRECHOICE)
	(CONTINUE STORY414)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY143-PRECHOICE ("AUX" (DAMAGE 3))
	<COND(,RUN-ONCE
		<COND(<OR <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-SKILL ,SKILL-UNARMED-COMBAT> <CHECK-SKILL ,SKILL-AGILITY>>
			<SET DAMAGE 1>
		)>
		<TEST-MORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY143>
		<IF-ALIVE ,TEXT143-CONTINUED>
		<COND(<IS-ALIVE>
			<COND(<CHECK-CODEWORD ,CODEWORD-VENEFIX>
				<DELETE-CODEWORD ,CODEWORD-VENEFIX>
			)(ELSE
				<GAIN-CODEWORD ,CODEWORD-SATORI>
			)>
		)>
	)>>

<CONSTANT TEXT144 "Standing beneath the Tower of the Sentinel, which looms three hundred feet above you against the glowering dusk sky, you feel very small and alone. If the greatest thieves of Godorno have tried to climb this tower and failed what hope is there for this poor Judain?||At the top of the Sentinel's tower, the jewel of Sunset Fire shines like a shooting star. The jewel of Sunset Fire is a so-called eye of power that can vanquish evil. The sheer-sided tower is chequered grey and red mosaic tiles, overlain with the black grime of centuries. It has stood on this spot since before the coming of the corsairs who ravaged the Old Empire. It was the lighthouse for Godorno before the sea level dropped in the great cataclysm. Looking up at the gaunt forbidding tower as it juts against the grey sky you are reminded of the frontispiece of a book you saw once -- The Tale of Nuth, Prince of Thieves -- which tells of the vain attempt to steal the jewel by the greatest thief of the Old Empire.||The black gate is reached under a trellis which is woven thickly with purple kiss-flowers, that smell unpleasantly like honeysuckle. To your surprise it opens at your touch and you walk into the atrium where small trees are growing in tubs. There is a curving marble staircase that leads up into the tower itself and you begin your long and dangerous climb.">

<ROOM STORY144
	(DESC "144")
	(STORY TEXT144)
	(CONTINUE STORY029)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT145 "You flourish your sword and swipe at the black monster. It wraps itself around the blade and starts to entwine itself around your arm.">
<CONSTANT CHOICES145 <LTABLE "throw down the sword" "try to prize your arm free without relinquishing your beloved weapon">>

<ROOM STORY145
	(DESC "145")
	(STORY TEXT145)
	(CHOICES CHOICES145)
	(DESTINATIONS <LTABLE STORY163 STORY178>)
	(REQUIREMENTS <LTABLE SWORD NONE>)
	(TYPES <LTABLE R-LOSE-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT146 "Somehow you survive the outside staircase and the other perils of the tower and live to see another day. You are the first to survive the Tower of the Sentinel in a very long time. Disconsolately you return to Bumble Row to hatch another plot.||You cannot return to the Tower of the Sentinel as you dare not face that hideous spider again.">

<ROOM STORY146
	(DESC "146")
	(STORY TEXT146)
	(CONTINUE STORY160)
	(CODEWORD CODEWORD-TOWER)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT147 "You cleave the great tentacle in two, missing Lucie as though by a miracle. You have done it. Leaping to the top of the parapet of the Bargello, you grab the Jewel of Sunset Fire from inside your jerkin and climb up into the last rays of daylight. As you do so you see the world's most terrifying sight. Rising slowly out of the hole that was once the old quarter of the city is the head of Hate itself. Two baleful green eyes twice the height of a man glare at you as the slow bulk of Hate starts to ooze towards the parapet. The eyes are ringed by the faces of the most depraved lost souls, all beckoning you to join them.||They still live on, crushed side by side and looking out to see what Hate sees. They have quite lost their minds.">

<ROOM STORY147
	(DESC "147")
	(STORY TEXT147)
	(PRECHOICE STORY147-PRECHOICE)
	(CONTINUE STORY375)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY147-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-GORDIAN ,STORY107>>

<CONSTANT TEXT148 "What a noble deed you have just done. They let Mameluke go and grasp you instead. They have no regard for the Judain and beat you to a pulp in the street, where they leave you to die. You will perish here and there is no one left to save the Judain.">

<ROOM STORY148
	(DESC "148")
	(STORY TEXT148)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT149 "With a clap of your hands you cast a Thunderflash spell. There is a blinding light and a whipcrack, then the smell of seared flesh. The living carpet is a writhing, boiling sea of serpentine coils. You have certainly distracted the snakes. You run in boldly. The living carpet writhes beneath the soles of your feet and there is a baleful hissing.||One of the snakes sinks its fangs into the soft flesh of your calf but you make it to the other side and slam the door shut behind you. The venom of the garter snake is virulent indeed and your blood burns while you fight for breath.">
<CONSTANT TEXT149-CONTINUED "You find yourself looking up another spiral staircase. Once outside the door the snake coils loosen and it glides to the floor and out of sight.">

<ROOM STORY149
	(DESC "149")
	(STORY TEXT149)
	(PRECHOICE STORY149-PRECHOICE)
	(CONTINUE STORY180)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY149-PRECHOICE ()
	<TEST-MORTALITY ,DIED-GREW-WEAKER ,STORY149>
	<IF-ALIVE TEXT149-CONTINUED>>

<CONSTANT TEXT150 "The ceiling of the room is clear crystal. The dome of crystal that tops the tower is supported by huge iron struts from a black boss directly above the jewel. You look up as you start to cross the floor to the casket, just as a flash of lightning illuminates everythin in stark outline. The angled struts are in fact the legs of a giant spider whose eyes seem to follow your every move as you inch slowly beneath the arches of its legs.||The keening of the gargoyles reaches a new frenzied high and the crystal that protects you from the tower-spinning spider explodes into shards and dust. The wind falls away, the keening drops to a low moan and now you hear for the first time the wheezing susurratioins of the spider's breath. You can see its thorax opening and closing like a bellows.">
<CONSTANT CHOICES150 <LTABLE "dash beneath it to seize the jewel and casket" "attack it from the doorway">>

<ROOM STORY150
	(DESC "150")
	(STORY TEXT150)
	(CHOICES CHOICES150)
	(DESTINATIONS <LTABLE STORY164 STORY186>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT151 "As soon as you place your heel against the soft flesh of Hate it disappears from sight and the flesh turns to liquid, engulfing you up to the waist.">

<ROOM STORY151
	(DESC "151")
	(STORY TEXT151)
	(PRECHOICE STORY151-PRECHOICE)
	(CONTINUE STORY335)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY151-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-SATORI ,STORY091>>

<CONSTANT TEXT152 "There is nowhere to hide but inside the lime. There is lime dust everywhere, and wherever you go you leave a trail of chalky footsteps. You try to rub the footsteps away and burrow into the lime, leaving a small hole next to your nose to breathe through. As you lie there in the lime you daren't move in case someone sees you. But what if a small part of you is uncovered? Your dark clothes will be spotted against the white lime.||Your uncomfortable wait is ended when someone pokes a boathook into your side. The bargees clear the lime away from your head under the eyes of a group of the Overlord's soldiers.||\"It's a Judain,\" says one of the soldiers. Their captain orders them to knock you out and throw you in the river. Stuck inside the heavy mound of lime you are helpless as they cosh you over the head. You are food for the fishes.">

<ROOM STORY152
	(DESC "152")
	(STORY TEXT152)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT153 "Caiaphas looks very long-faced at your question. \"If it's the keys to the secret ways beneath the city you want then talk to Melmelo, the Master Thief. But beware. Nameless horrors lurk in the ever-nighted labyrinths... things best left undisturbed.\"||The only way you know of contacting Melmelo is by asking a thief. The only place you can be sure to find a thief when you want one is The Inner Temple, an inn in the middle of the oldest part of the city.||The streets are being patrolled by the Overlord's men.">
<CONSTANT CHOICES153 <LTABLE "use" "risk the streets" "try to stow away inside a slaver's cart and pass unseen">>

<ROOM STORY153
	(DESC "153")
	(STORY TEXT153)
	(CHOICES CHOICES153)
	(DESTINATIONS <LTABLE STORY059 STORY307 STORY031>)
	(REQUIREMENTS <LTABLE SKILL-STREETWISE NONE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT154 "With a word of power you unleash the Baffiement spell. It has no discernible effect on the monster but one of the guards goes glassy-eyed and his head lolls back into the pillow of Hate's body, to be submerged for ever in the orgy of despair. The monster convulses suddenly, throwing a coil out towards you. You decide it is time to flee back to your hidey-hole on Bumble Row.">

<ROOM STORY154
	(DESC "154")
	(STORY TEXT154)
	(CONTINUE STORY159)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT155 "Your journey to Bagoe on the Palayal river is charmed. You find food dropped in a sack by the side of the path and are treated to a beer at an inn. At Bagoe you are welcomed aboard a barge and the bargees promise to hide you when you near Godorno. They say you will easily be able to slip ashore, unseen in the dead of night.||They are as good as their word and one fine dawn you find yourself back in Godorno, with the wharfs and warehouses behind you and the city before you. The revetments of the buildings lend the city an unmistakable air of patrician hauteur. This is the hub of the civilized world.">

<ROOM STORY155
	(DESC "155")
	(STORY TEXT155)
	(CONTINUE STORY300)
	(FLAGS LIGHTBIT)>

<ROOM STORY156
	(DESC "156")
	(EVENTS STORY156-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY156-EVENTS ()
	<COND(<CHECK-SKILL ,SKILL-CHARMS>
		<RETURN ,STORY047>
	)(<CHECK-SKILL ,SKILL-ROGUERY>
		<RETURN ,STORY028>
	)(ELSE
		<RETURN ,STORY019>
	)>>

<CONSTANT TEXT157 "One of the swords has a halo which shines brighter than the others. You steal up behind the Jade Warrior and throw yourself against its sword arm, wrenching the blade from its grasp.||\"Obey me, Jade Warriors,\" you cry out on impulse. To your reliefand amazement they line up before you and stand to attention. The warrior from whom you took the sword picks up another from behind an awning. The warriors are ready to do your bidding. They whirr and click as they follow you dutifully to the edge of the precincts of the burial chambers, and there they grind to a halt. There is nothing you can do to move them further. Although you cannot command the Jade Warriors to go forth and attack Hate, you tell them that they must attack Hate if it should loop its coils into the burial chambers of the Megiddo dynasty. You leave all doors and traps wide open in the hope that Hate will blunder in and get carved up.||Sure enough, when you return the next day the place shows the signs of an epic battle. Great gouts of translucent flesh hang from lintel and corners. There is a fine green powder in the air, like pulverized glass. The Jade Warriors have been ground to dust by Hate but, judging by the quantity of purple ichor smeared over the walls, they must have given the monster acute indigestion.">

<ROOM STORY157
	(DESC "157")
	(STORY TEXT175)
	(PRECHOICE STORY157-PRECHOICE)
	(CONTINUE STORY160)
	(ITEM JADE-WARRIORS-SWORD)
	(CODEWORD CODEWORD-HECATOMB)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY157-PRECHOICE ()
	<COND (<NOT <CHECK-ITEM ,PLUMED-HELMET>>
		<TELL CR "Take a plumed helmet?">
		<COND (<YES?>
			<TAKE-ITEM ,PLUMED-HELMET>
		)>
	)>>

<CONSTANT TEXT158 "As a Judain in Godorno you have become used to being treated with disdain. You didn't want to drink anyway. The two women favour you with glances dripping with disdain, as if you were something someone had scraped off the heels of their boots. Try as you can to keep calm, this kind of prejudice is really upsetting. They are street sluts, no better, perhaps worse than slaves, yet here they are treating you like a worm. Still if you are to be tolerant then you must apply that understanding to members of their ancient profession just as you would wish them to extend it to all Judain.||Determined to find out what Lucie is up to you walk over to the couple, who are watching you intently. Lucie smiles as she did when you met her in the Garden of Statues.">

<ROOM STORY158
	(DESC "158")
	(STORY TEXT158)
	(CONTINUE STORY227)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT159 "You have the word passed round to all the cells to lie low. Until further orders your people will cease their campaign of terror against the Overlord's men. A pity -- they had almost won control of the streets. They are dying, though: day by day, Hate takes off more of your fellow Judain to the orgy of eternal despair, where they are joined by hundreds more of the Overlord's men and thousands of the ordinary folk of the city. You will have to vanquish Hate.">

<ROOM STORY159
	(DESC "159")
	(STORY TEXT159)
	(CONTINUE STORY006)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT160 "You must decide your next bold stroke to free the city from the grip of hatred and unreason.">

<ROOM STORY160
	(DESC "160")
	(STORY TEXT160)
	(PRECHOICE STORY160-PRECHOICE)
	(CONTINUE STORY100)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY160-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-SUNSET ,STORY337>>

<CONSTANT TEXT161 "You slink back into the catacombs, dousing your lantern so you will not be discovered. You are soon under the stables. It is cold and damp down here, but there is a strong breeze, almost a gale. The air should be still here under the city, like the nighted airs of the pyramids of the ancients. Hate has undermined it so much that part of the catacombs have come to light, you guess. That means the monsters that have lurked here since the city was built will be wandering out onto the streets to add to the woes of the poor cityfolk. Since the storm drains prove to be blocked, you enter the burial crypts of the Megiddo dynasty.">

<ROOM STORY161
	(DESC "161")
	(STORY TEXT161)
	(CONTINUE STORY365)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT162 "At the top of the last set of eight steps is a landing. The inside wall is covered by a tapestry and there is a single arrow slit in the outside wall. As you walk beside the tapestry gazing for a moment at its depiction of the labours of Coronus, the floor spins and you are shot backward through the tapestry into another room.||You are standing on a wooden platform. There are four other platforms in the room, the furthest in front of the only door. There is nothing to show how you came through the wall behind you and no way of return.||The floor of the room is submerged under a living carpet of orange and black garter snakes. It is too far to jump to the nearest platform above the snakes, but there is a rope hanging from the ceiling halfway between you and it.">
<CONSTANT CHOICES162 <LTABLE "jump for the rope and hope to swing onto the next platform" "make a dash for it through the mass of snake" "use" "cast Silver Shield to push the snakes aside" "cast Thunderflash to stun them" "cast Miasma to poison them">>

<ROOM STORY162
	(DESC "162")
	(STORY TEXT162)
	(CHOICES CHOICES162)
	(DESTINATIONS <LTABLE STORY115 STORY060 STORY168 STORY080 STORY149 STORY010>)
	(REQUIREMENTS <LTABLE NONE NONE SKILL-CHARMS SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-NONE R-NONE R-SKILL R-SKILL R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT163 "You throw down the sword just in time as the monster tries to lap its black wings over you. The Overlord begins to wake up and the monster floats up again to attack you. You decide discretion is the better part of valour and retreat, leaving the concubine to her fate. By the look of her she will be one of Hate's many guests before the night is out.">

<ROOM STORY163
	(DESC "163")
	(STORY TEXT163)
	(CONTINUE TEXT161)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT164 "As you make a dash for the jewel the spider drops to flatten you. Its heavy bloated black sack of an abdomen engulfs you and you are borne to the floor, where you begin to suffocate. Terror lends you the strength of seven men but even as you try to fight your way clear so the spider's venom does its deadly work. The likeness of you at the top of the stairs did indeed tell the story of your grisly and hopeless fate. The Jewel of Sunset Fire cannot so easily be stolen from the tower. There is no one left to save the Judain now. Hate will subdue all.">

<ROOM STORY164
	(DESC "164")
	(STORY TEXT164)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT165 "The Thunderflash spell was the right choice for such circumstances. The bang makes the walls of the prison reverberate with echoes. There is a flare of spurting red fire which sears and burns the cloying purple softness of the monster, which convulses and expels some of the guards. The purple flesh is cauterized and it recedes, allowing a few more of the guards to break free as the coil twitches and recoils. Those still caught implore their comrades to stay and free them but not one of those you have freed waits to help a friend. They bolt for it, but then they are either terrified or in shock.">

<ROOM STORY165
	(DESC "165")
	(STORY TEXT165)
	(CONTINUE STORY034)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT166 "To your dismay, the rats, instead of fleeing, set up an angry chittering as if protesting at your trespass. They are sleek with grain and their yellow teeth look needle sharp. Some are more than a foot long and evil looking. A bargee hears them and rouses a couple of his mates. They start to amble in your direction. You must hurriedly hide.">
<CONSTANT CHOICES166 <LTABLE "hide in the barge laden with lime" "under the tarpaulin on the smallest of the barges">>

<ROOM STORY166
	(DESC "166")
	(STORY TEXT166)
	(CHOICES CHOICES166)
	(DESTINATIONS <LTABLE STORY152 STORY183>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT167 "The casting of a Thunderflash spell makes the walls of the neighbouring houses reverberate with echoes. There is a flare of spurting red fire which sears and bums the cloying purple softness of the monster. It convulses and expels Mameluke, who rolls onto the floor, then struggling to his feet, wiping the strands of gelid purple slime from his body with the backs of his hands.||He thanks you and would embrace you as a friend, but you step back, anxious to avoid contamination by the putrescent slime of Hate.">
<CONSTANT CHOICES167 <LTABLE "take him back with you to your hidey-hole on Bumble Row" "lose him in the byways of the city">>

<ROOM STORY167
	(DESC "167")
	(STORY TEXT167)
	(CHOICES CHOICES167)
	(DESTINATIONS <LTABLE STORY177 STORY239>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT168 "You start to swing your amulet like a pendulum and begin to hum softly. The heads of the snakes sway gently in time, like wheat in the summer breeze. Still humming the charm, you step onto the living carpet which writhes beneath your sole, while baleful hisses warn you not to linger. Garter snakes coil around your thighs but they are nestling there and do not bury their venom-tipped fangs in your soft flesh.||You step trancelike across the living carpet of snakes and through the far door, where you face another spiral staircase. Once outside the door the snake coils loosen and they glide to the floor out of sight.">

<ROOM STORY168
	(DESC "168")
	(STORY TEXT168)
	(CONTINUE STORY180)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT169 "How will you make the landlord pay attention to you?">
<CONSTANT CHOICES169 <LTABLE "hurdle the bar and brawl with him" "try-bribing him to tell you about Lucie and her foreign friend" "use magic" "approach Lucie and her ominous friend" "leave the tavern">>

<ROOM STORY169
	(DESC "169")
	(STORY TEXT169)
	(CHOICES CHOICES169)
	(DESTINATIONS <LTABLE STORY179 STORY189 STORY219 STORY227 STORY199>)
	(REQUIREMENTS <LTABLE SKILL-UNARMED-COMBAT 3 SKILL-SPELLS NONE NONE>)
	(TYPES <LTABLE R-SKILL R-MONEY R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT170 "You steal up behind one of the Jade Warriors and throw yourself against its sword arm, wrenching the blade from its jade grasp.||\"Obey me, Jade Warriors of the Megiddo dynasty!\" you cry on impulse.||Their only response is to swivel towards you and advance with swords aloft. There seems no escape from their deadly flashing blades, and you cry out in agony as your stolen sword is dashed from your grip and you are cut to the bone.">
<CONSTANT TEXT170-CONTINUED "You flee the tomb chamber.">

<ROOM STORY170
	(DESC "170")
	(STORY TEXT170)
	(PRECHOICE STORY170-PRECHOICE)
	(CONTINUE STORY016)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY170-PRECHOICE ()
	<TEST-MORTALITY ,DIED-FROM-INJURIES ,STORY170>
	<IF-ALIVE TEXT170-CONTINUED>>

<CONSTANT TEXT171 "The return journey takes no longer than the outward trek and you are soon faced with the battlemented towers and guarded walls of Godorno, city of the Forsaken. Carrion crows, habitually solitary scavengers, wheel in great flocks above the city and the wind carries the dismal cries of the unfortunates being tortured in the prison fortress of Grond to your unwilling ears.">
<CONSTANT CHOICES171 <LTABLE "try to stow away aboard a barge on the Palayal river and re-enter the city that way" "present yourself at the gate and bluff your way through">>

<ROOM STORY171
	(DESC "171")
	(STORY TEXT171)
	(CHOICES CHOICES171)
	(DESTINATIONS <LTABLE STORY155 STORY188>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT172 "At least this way you live to fight another day. You reach the bottom of the tower again safely and as you walk back out onto the path to the street the great bronze doors swing shut with a sound like the knell of doom. You try the gates but they are sealed shut. You needn't worry -- Melmelo, the guildmaster of thieves, probablyjust wanted to get his own hands on the jewel. He can go to the trouble of finding it for himself. You slink back to Bumble Row.">

<ROOM STORY172
	(DESC "172")
	(STORY TEXT172)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT173 "With a word of power and a clap of your hands you bring forth a great cloud of noxious vapours, the Miasma. Several of the guards succumb immediately, sinking beneath the glassy purple surface for the last time. The spell doesn't seem to have affected the monster but it convulses suddenly, throwing a dripping purple coil out at you. You decide it is time to flee back to your lair on Bumble Row.">

<ROOM STORY173
	(DESC "173")
	(STORY TEXT173)
	(CONTINUE STORY159)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT174 "Exploiting the rekindled morale of the Judain resistance and the other townsfolk who are rallying to your banner, you make your plans for the defence of the city. If you construct barricades in certain sectors of the city you can challenge the Overlord's authority. If his men cannot capture the barricades all will know that the writing is on the wall; it will only be a matter of time before you are storming the palace.||The barricade is composed of flagstones and carts, doors stripped from nearby deserted houses, and even pews from the nearest temple. The carts have been laden with mud. Even an elephant could not break through. The blockage is ten feet high and in places a parapet has been built on the defender's side from which potshots can be taken at the Overlord's city guards as they advance. You have archers in the windows and on the roofs of the houses on either side of the barricade. Morale is high; the stories of your exploits have placed you high in the esteem of your people.||But you have not chosen the sites for your barricades well. The Overlord's guards are quick to exploit your mistake. They pour a rain of crossbow quarrels from the roof into the brave defenders, slaughtering many, before charging the barricade. The ensuing battle is a slaughter. The guards have roused themselves to one'last great effort to reclaim the streets of the city and they are putting the brave defenders to the sword. You decide discretion is the better part of valour and retreat to Bumble Row.">

<ROOM STORY174
	(DESC "174")
	(STORY TEXT174)
	(CONTINUE STORY041)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT175 "You muse on the good fortune of finding your fellows so well provided for. \"A talent, more than I could have hoped for in my wildest dreams. With a talent of gold we can buy all the help we need.\"||\"Ah, but taking gold from Judain is a capital offence, punishable by impalement.\"||\"Even talking to a Judain is a capital offence, unless you are interrogating one.\"||\"Are we not the Judain? Have we not the merchant's silver tongue? We have never wanted for those to do our bidding in the past.\"||\"In the past the people were not in the grip of fear. Where once they thought of lining their pockets they now count themselves lucky if they can line their stomachs and stay out of trouble.\"">

<ROOM STORY175
	(DESC "175")
	(STORY TEXT175)
	(CONTINUE STORY190)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT176 "You must silence the soldier quickly, before his cries bring the neighbours. But even as you race up the stairs towards him, your thoughts are awhirl with the mystery ofwhat went wrong. There was no fault in your magic. However, the plan relied on everyone in the house being asleep at the instant you cast the charm. Evidently this one soldier was awake guarding the diamond, so the charm failed to affect him. You can well imagine his fright and confusion when he heard you moving around downstairs and then discovered that everyone else in the house was in a deathly deep sleep from which he could not rouse them.||The first sweep of his sword is clumsy. You dodge in under his guaidt anxious to end the fight as quickly as possible. You have fought much tougher opponents in your time.">
<CONSTANT TEXT176-CONTINUED "You conduct a quick search of the upper rooms and leave as soon as you have the diamond.">

<ROOM STORY176
	(DESC "176")
	(STORY TEXT176)
	(PRECHOICE STORY176-PRECHOICE)
	(CONTINUE STORY358)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY176-PRECHOICE ("AUX" (DAMAGE 2))
	<COND(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
		<SET DAMAGE 1>
	)(<CHECK-SKILL ,SKILL-SWORDPLAY>
		<SET DAMAGE 0>
	)>
	<TEST-MORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY176>
	<IF-ALIVE ,TEXT176-CONTINUED>>

<CONSTANT TEXT177 "Mameluke is glad to accompany you back to your little hidey-hole on Bumble Row. \"I see the toymakers and panderers have shut up shop some time since,\" he remarks. \"It used to be such a gay place, Bumble Row.\"||\"Nothing but a dive for dogs like us in these cursed times,\" you say wryly.||\"Don't be hard on yourself! You saved my life. How can I repay you?\"||\"Forget it. I am happy just to see you free and breathing.\"||\"I will help you in any way I can,\" he tells you. \"Remember, you just have to call on me and I'll be there.\"||\"Thanks, Mameluke. It's good to have at least one true friend when all around are turning to hatred. For a start you can help me plan what to do next.\"||\"I suppose we could flee the city?\"||\"No. My place is here. I want to save my people -- not just my people; all the citizens.\"||\"And you are the one to save all, a youngster like you?\" he asks with affectionate mockery.||\"Who else is there?\" You explain to Mameluke how you have organized the Judain resistance and Mameluke is amazed at what you have done. The word from the palace is that the Overlord's soldiers are deserting in droves rather than patrol the city streets, which they have come to see as a fate worse than death. So your tactics are working.||\"But it's not the Overlord who is our real enemy; it's the monster, Hate.\"||He gives you a frightened look. \"But what can we do against Hate itself?\"||\"We need to find out everything we can about it. I will contact those with an ear inside the palace. Perhaps the Overlord has entered into some God-forsaken compact with the monster.\"||You wish Mameluke farewell and ponder how you can confront your inimical foe.">

<ROOM STORY177
	(DESC "177")
	(STORY TEXT177)
	(CONTINUE STORY006)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT178 "The underside of the black monster is lined with barbed thorns which inject poison into your bloodstream. Try as you might, you can't break free. The poison turns your blood to cloying syrup and your heart stops beating. You have died when revenge for the Judain was almost within your grasp. Hate will subdue all.">

<ROOM STORY178
	(DESC "178")
	(STORY TEXT178)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT179 "He is a tough-looking burly man and obviously used to dealing with rowdies like yourself. He snatches up a bottle ready to smash it against your skull. He had not reckoned with your skill at unarmed combat, however. You wrestle with him, throwing him against the bar repeatedly and then seizing his right arm and twisting it up behind his back. Your skill and speed are too much for his brute strength -- and your mental attitude has been hardened by adversity as you have watched the rape of your people.||He is in pain now and submits, becoming totally still. You make him pour you a drink of ale and ask him about Lucie and her friend.">

<ROOM STORY179
	(DESC "179")
	(STORY TEXT179)
	(CONTINUE STORY209)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT180 "Various cabbalistic signs like ancient cave paintings have been daubed on the outside of the topmost door in terracotta and charcoal. If your hopes are not disappointed the Jewel of Sunset Fire lies inside this topmost room||At the top of the staircase is a series of frescoes showing the tower and depicting the grisly fates that befall those who rashly try to climb it. To your absolute horror and consternation the final fresco is a picture of you, squashed flat beneath a gigantic bloated black spider. Above the spider you can see the orb shining brightly in its frame.||You walk on up a narrower spiral of stairs that lines the outer wall and at last pause before the final door. Gingerly you push it open, wincing at the creak of its rusty hinges. There is a brooding presence of evil here. Your heart hammers in your chest as you step forward.">

<ROOM STORY180
	(DESC "180")
	(STORY TEXT180)
	(CONTINUE STORY150)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT181 "You think to relieve Skakshi of any weapons lest he attempt to double-cross you. Although he protests he has no more, a quick frisk of his clothing reveals a set of throwing knives. You look grimly at him, but he gives a weak smile, and says: \"I like to keep something up my sleeve for contingencies -- you'd do the same.\"">

<ROOM STORY181
	(DESC "181")
	(STORY TEXT181)
	(PRECHOICE STORY181-PRECHOICE)
	(CONTINUE STORY291)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY181-PRECHOICE ()
	<COND(,RUN-ONCE
		<KEEP-ITEM ,KNIFE>
	)>>

<CONSTANT TEXT182 "You steal up behind the Jade Warrior and throw yourself against its sword arm, wrenching the blade from its armoured grasp.||\"Obey me, Jade Warriors of the Megiddo dynasty!\" you cry on impulse, but their only response is to advance on you with swords aloft. There seems no escape from their deadly flashing blades, and you cry out in agony as your stolen sword is dashed from your grip and you are cut to the bone.">
<CONSTANT TEXT182-CONTINUED "You flee from the tomb chamber.">

<ROOM STORY182
	(DESC "182")
	(STORY TEXT182)
	(PRECHOICE STORY182-PRECHOICE)
	(CONTINUE STORY016)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY182-PRECHOICE ()
	<TEST-MORTALITY 4 ,DIED-FROM-INJURIES ,STORY182>
	<IF-ALIVE ,TEXT182-CONTINUED>>

<CONSTANT TEXT183 "An hour before dusk the members of the crew return from whichever wine cellar they have been squandering their money in and prepare to cast off. They look over their cargo briefly but do not notice you huddled under a pile of ropes. They sing as they pole the barge, a sombre song with a pounding beat about how a man may toil his whole life away and at the end have nothing to show for it but the clothes he will die in.||You guess from the movements of the barge it has turned up the Palayal river. You are being borne towards the Great Forest. You guess they are making for the town of Bagoe twenty miles upriver. You lie still, listening to the lapping of water at the bows and feeling the rhythmic surge as the crew drives the barge on, poling in time. After three hours of dirges the crew tie up for the rest of the night against the deserted riverbank. While they snore you leap from barge to shore and walk inland to the Bagoe road.">

<ROOM STORY183
	(DESC "183")
	(STORY TEXT183)
	(CONTINUE STORY222)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT184 "You fight a pitched battle face to face with Hate, your blade hacking great quivering chunks out of its loathsome warty mass. The people of the city peer timidly from the cracked facades of their houses, astonished to see such bravery from a single lone Judain. Hate screams and lashes out at you, raining rubble down on your head in its frenzy to stop the punishing blows you are inflicting.">
<CONSTANT TEXT184-CONTINUED "The reek of camphor and honeysuckle makes your head reel. Staggering under Hate's onslaught, you look up to see the largest of its tentacles smashing down towards you. ">

<ROOM STORY184
	(DESC "184")
	(STORY TEXT184)
	(PRECHOICE STORY184-PRECHOICE)
	(CONTINUE STORY103)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY184-PRECHOICE ("AUX" (DAMAGE 8))
	<COND (<CHECK-SKILL ,SKILL-CHARMS>
		<SET DAMAGE 5>
	)>
	<TEST-MORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY184>
	<IF-ALIVE ,TEXT184-CONTINUED>
	<COND (<IS-ALIVE>
		<CODEWORD-JUMP ,CODEWORD-GORDIAN ,STORY054>
	)>>

<CONSTANT TEXT185 "You are turning the corner into Hanging Gardens-- once one of the wonders of the world, now a tumbledown jungle of rubble and festooned plants rioting over the houses -- when your face starts to itch unpleasantly. You are only half-way to Mameluke's garret and the broad-shouldered black man is striding on ahead, confidently. The pink mucus of Hate is infesting you. Mameluke looks at you with concern as your eyes become vacant and you are assailed by numbing dreams in which you walk open-armed into the embrace of Hate, to join in the orgy of despair. Mameluke is tugging at your arm and pulling you along the road towards Chink Street where his poor garret perches atop a building like a landlocked lighthouse. The cry of the city guard nearby urges Mameluke to greater efforts as the doleful dirge of \"Bring out your dead, bring out your dead,\" tolls mournfully from the nearby Courtyard of Idle Fancies.">
<CONSTANT CHOICES185 <LTABLE "send Mameluke on alone" "try to keep up with him as the guards approach">>

<ROOM STORY185
	(DESC "185")
	(STORY TEXT185)
	(CHOICES CHOICES185)
	(DESTINATIONS <LTABLE STORY211 STORY221>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT186 "How will you attack the giant spider that lurks so menacingly above? The fresco outside the door warned you only too clearly of your fate should you falter or fail.">
<CONSTANT CHOICES186 <LTABLE "conjure a gas cloud" "a flash of stunning force" "multiple illusory images to confuse your foe" "use" "throw the" "make a dash into the room, beneath the gigantic spider, and make a grab for the jewel">>

<ROOM STORY186
	(DESC "186")
	(STORY TEXT186)
	(CHOICES CHOICES186)
	(DESTINATIONS <LTABLE STORY079 STORY073 STORY208 STORY138 STORY234 STORY164>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS KNIFE JADE-WARRIORS-SWORD NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-ITEM R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT187 "You are forced to confront Hate without a weapon or strategy. You have only your own qualities as a hero to help you in this battle.">

<ROOM STORY187
	(DESC "187")
	(STORY TEXT187)
	(PRECHOICE STORY187-PRECHOICE)
	(CONTINUE STORY295)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY187-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-SATORI ,STORY137>>

<CONSTANT TEXT188 "The gate is manned by grim-looking sentries in the uniform of the Overlord's city watch. There are four of them, sitting two and two on benches set into the wall of the gatehouse that spans the road between the two gates. The outer gate opens outward into the countryside and the inner gate opens inwards into the city. Each man has a sword and a crossbow, though their bows look a little rusty with lack of use.||They are slovenly soldiers, doubtless very corrupt.">
<CONSTANT CHOICES188 <LTABLE "go invisible" "control their minds with magic" "bluff your way through" "try bribing them">>

<ROOM STORY188
	(DESC "188")
	(STORY TEXT188)
	(CHOICES CHOICES188)
	(DESTINATIONS <LTABLE STORY207 STORY218 STORY229 STORY191>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-SPELLS SKILL-STREETWISE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT189 "Placing a money pouch on the bar, you ask, \"Tell me about Lucie. Does she frequent the Silver Eel often? And who is her companion?\"||The landlord pockets the money pouch after first weighing it carefully in his hand. He glances nervously at the gang of four and says, \"Yes, she haunts this place often. She's never alone. I see some of them again and again but she has a lot of friends, does little Lucie. She's a ornery girl that one. Knows her own mind and no mistake. Forever taking up with the most disreputable mountebanks and desperadoes. Always twists 'em round her little finger, mind.\"||\"And what about her friend?\"||\"That's Tyutchev, a foreigner. See how pale he is? Doesn't it make you feel ill just to look at him? He usually comes in with his doxy, Cassandra -- or is it he is her pretty boy? She's a terrible proud and beautiful woman, wearing gear like a Fury from the Abyss. At any rate, they had a terrible fight in here last week. I never saw a woman wield a sword with such skill and venom. It glowed cold blue, and where it struck the bar I found crystals of ice.\"||\"Who won the fight?\" you ask, incredulous.||\"They were both bleeding badly. It was a terrible battle. But they went out together. I do declare I've never had the misfortune to serve two less pleasant and outright perilous characters.\"||\"What do they all want with Lucie?\" you wonder aloud.||He cracks a rancid-toothed smile. \"What does any man want with Lucie?\"||You thank the landlord for his information and, leaving the alepot on the bar, walk over to the couple, who are watching you intently. Lucie smiles as she did when you met her in the street.">

<ROOM STORY189
	(DESC "189")
	(STORY TEXT189)
	(CONTINUE STORY227)
	(COST 3)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT190 "Your allies suggest various places for you to make a hideout and you choose a damp cellar on Medallion Street -- it seems the best option.||You are on your way there when there is a commotion ahead of you. Seeing a group of city guards approaching, you duck into the ruin of an abandoned building. To your dismay, they stop in the street outside and you hear one of them say, \"A Judain went in here, I think. Fetch the dogs -- they'll soon sniff the wretch out!\"||There is a frightened whimper in the darkness behind you. You whirl to see Caiaphas's wife, Ruth -- the one who was reluctant to share the food with you. You remember hearing from Caiaphas that she is with child. She is hidden, trembling, behind a pillar at the back of the hall. You know that the guards will not return to barracks until they have caught their quota of Judain.">
<CONSTANT CHOICES190 <LTABLE "use" "use magic" "use" "dash out into the street and fight the guards to buy Ruth time to escape" "push her out into the street to save yourself -- surely they will not harm a pregnant woman">>

<ROOM STORY190
	(DESC "190")
	(STORY TEXT190)
	(CHOICES CHOICES190)
	(DESTINATIONS <LTABLE STORY126 STORY116 STORY105 STORY143 STORY240>)
	(REQUIREMENTS <LTABLE SKILL-ROGUERY SKILL-CHARMS SKILL-STREETWISE NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT191 "As you step through the outer gate one of the ill-favoured guards closes the inner one against you with a loud thud, while another pushes shut the outer gate, to trap you, not minding the protestations of an old woman coming into the city to sell eggs, who is now barred. If they realize you are Judain they could turn you in. There is little doubt that they would, these men are more known for their greed than their scruples.||There is a placard on the inside gate proclaiming that the reward for turning in a Judain has been increased to thirty gleenars. You guess the Judain are encouraged to try to bribe their way to freedom and so the pogrom is making the Overlord rich as the prisoners are tricked out of their worldly wealth yet still left to rot in Grond.||The reward, however, is more money than the gold you carry on you, which is all you have.">

<ROOM STORY191
	(DESC "191")
	(STORY TEXT191)
	(PRECHOICE STORY191-PRECHOICE)
	(CONTINUE STORY260)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY191-PRECHOICE ()
	<COND(<CHECK-SKILL ,SKILL-ROGUERY>
		<STORY-JUMP ,STORY232>
	)(<CHECK-SKILL ,SKILL-CUNNING>
		<STORY-JUMP ,STORY250>
	)>>

<CONSTANT TEXT192 "You hack wildly at the cloying purple flesh of Hate, opening up great gashes in its side which pour out vile yellow pus. As fast as you cut so the tentacle twitches, spasms and convulses, sucking the wretched guards into its soft embrace. You are not making any progress, you are just burying the guards deeper in the morass of despair.">
<CONSTANT CHOICES192 <LTABLE "try using the flat of your sword instead" "torch the purple flesh of Hate" "ask some of the trapped guards what to do" "conjure a poisonous fog" "blast of energy" "spell of Baffiement" "spell of Rulership">>

<ROOM STORY192
	(DESC "192")
	(STORY TEXT192)
	(CHOICES CHOICES192)
	(DESTINATIONS <LTABLE STORY370 STORY228 STORY215 STORY173 STORY165 STORY154 STORY122>)
	(REQUIREMENTS <LTABLE SKILL-SWORDPLAY SKILL-SWORDPLAY NONE SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE R-SKILL R-SKILL R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT193 "If you escape, the guards will slaughter Mameluke. He calls out for you to run and save yourself. \"It's not worth losing your life over me. You have much to do. I could almost imagine you were a Tartar, such is your courage.\"||Mameluke hasn't lost his loquacity even in the moment of his downfall.">
<CONSTANT CHOICES193 <LTABLE "use" "use" "use" "you have none of those skills">>

<ROOM STORY193
	(DESC "193")
	(STORY TEXT193)
	(CHOICES CHOICES193)
	(DESTINATIONS <LTABLE STORY244 STORY264 STORY264 STORY278>)
	(REQUIREMENTS <LTABLE SKILL-CHARMS SKILL-CUNNING SKILL-STREETWISE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT194 "The lepers would follow you to the ends of the earth. As the pinnacles and battlements of Grand come into view they murmur unhappily but still shuffie hopefully along in your wake. They tell you they have been chained to the walls of their sanatorium from the time they contracted the disease. It is hard to imagine what fierce spark of life drives these people on, but there they are shuffiing in your wake. Two are travelling on tea trays with wheels attached, shifting lumps of iron forwards and backwards, to make their makeshift carts move over-the rough cobbles. It is enough to break your heart to look at, but then you have seen much, much worse.||Turning into Last Rites Street you are faced by the looming vastness of Grond. The grey stone matches the pallid skin of your pathetic band. The guard shut and barricade the gates against your motley crew before you can demand the release of the prisoners.">
<CONSTANT CHOICES194 <LTABLE "offer some of the Judain's gold to the captain of the guard, in exchange for access to the prison fortress" "try ensorcelling your way in" "threaten to infect the guards with the slow rotting death of leprosy to see if that will loosen the gates">>

<ROOM STORY194
	(DESC "194")
	(STORY TEXT194)
	(CHOICES CHOICES194)
	(DESTINATIONS <LTABLE STORY206 STORY268 STORY259>)
	(REQUIREMENTS <LTABLE NONE SKILL-SPELLS NONE>)
	(TYPES <LTABLE R-NONE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT195 "The apprehension in your people is almost palpable as they face their sternest test by far -- pitched battle with the Overlord's guard. You buoy their spirits by promising them a fine banquet in the Overlord's palace by nightfall. Your enthusiasm is infectious and they are ready to follow you now. You decide to accompany one of the detachments led by your fellow Judain, who have no military training but enjoy the respect of their people. You go with Caiaphas to the barricade facing the Grand Canal.">

<ROOM STORY195
	(DESC "195")
	(STORY TEXT195)
	(CONTINUE STORY353)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT196 "Lucie's eyes sparkle with malice. \"This is the Judain who slew your captain, Overlord. This guilty wretch deserves to die.\"||\"And die the poor wretch will, undoubtedly, after interrogation.\" Lucie's smile of triumph is dripping with hatred. Something must have happened to her mind, else why would she lie and betray you. She is not the same girl you met standing in the rain near the Palazzo del Megiddo. She isn't behaving as she would with the riff-raff she usually disports herself with. Hate has got to her, just as it is taking over the minds of all the wretches of Godorno.||None the less you are fated to die in the prison fortress of Grond. By tomorrow your body will be hanging in an iron cage outside the Overlord's palace as a warning to the Judain to give up their futile struggle. There is no one left to save them now. Hate will conquer all.">

<ROOM STORY196
	(DESC "196")
	(STORY TEXT196)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT197 "You recognize some of those present as senior members of the Thieves' Guild, grown rich on the juicy pickings of the latterday well-to-do of Godorno. They are well dressed, urbane looking men.||\"Skakshi, I see you lurking there. I have a proposition to put to Melmelo -- just the thing for Godorno's master thief.\" You know Skakshi likes to think of himself as the master thief of Godorno. He is no friend to Melmelo the Guildmaster.||\"I can take you to Melmelo for the price I would be given if I turned you over to the city guard: ten gleenars. Do you have ten gleenars, Judain scum?\"||There are chuckles from the other customers at Skakshi's insolence.">
<CONSTANT CHOICES197 <LTABLE "decide to teach him a lesson in how to talk to his betters" "agree to this bargain" "tell Skakshi you will never pay his blood money">>

<ROOM STORY197
	(DESC "197")
	(STORY TEXT197)
	(CHOICES CHOICES197)
	(DESTINATIONS <LTABLE STORY281 STORY291 STORY043>)
	(REQUIREMENTS <LTABLE NONE 10 NONE>)
	(TYPES <LTABLE R-NONE R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT198 "Tyutchev has led you into a trap. As a net is dropped from an archway above, entangling you, Tyutchev spins on his heel and slices yout head from your shoulders with a single blow of his sword. You took one chance too many. No one is left to save your people now.">

<ROOM STORY198
	(DESC "198")
	(STORY TEXT198)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT199 "As you hurry away from the inn, you remember you have to attend the meeting of the heads of the resistance cells. As you make your way quickly through the desolate streets, you pass an old man pushing a cart filled with curios. He is Tarkamandor, a collector and trader who deals in enchanted items.">
<CONSTANT CHOICES199 <LTABLE "stop to talk to him" "press on to the meeting without delay">>

<ROOM STORY199
	(DESC "199")
	(STORY TEXT199)
	(CHOICES CHOICES199)
	(DESTINATIONS <LTABLE STORY051 STORY094>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT200 "You take your usual care in the alleys and backways of the old city but this time your sixth sense has failed you. An assassin has you in the sights of his crossbow. A poisoned bolt catches you in the shoulder, spinning you round so that you fall in an ungainly heap on the cobblestones. Someone had marked you out, for what reason, you will never know. There is no one left to save the Judain now. Hate will conquer all.">

<ROOM STORY200
	(DESC "200")
	(STORY TEXT200)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT201 "This street winds down towards the riverfront and the centre of the city. It is crossed by large avenues lined with tall straight cedars that lead up to the citadel. You hear the ringing of the town crier's bell. At the end of the street is Greenbark Plaza. Here a large walled flowerbed encircles a rare sight. It is a greenbark tree, eighty feet tall. The smooth bark is striped lime green and grey-green and the heart-shaped leaves are golden yellow. There is a shrine here to the tree spirit with a few offerings of potash and wine.||Next to the shrine is the town crier dressed in his traditional black and gold tabard. He unfurls a scroll and begins to declaim to the gathered crowd. He is flanked by a bodyguard of the Overlord's men armoured in black leather. You push forward to hear better.">

<ROOM STORY201
	(DESC "201")
	(STORY TEXT201)
	(CONTINUE STORY254)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT202 "Being among friends has its advantages. An old moneylender, Sekritt the Blind, has just such a pendant as you might use as a magical amulet. It was pawned to him by an itinerant sorcerer many years ago. You are lucky. He was about to sell it to a young sorceress who had decided to risk trying to escape from the city down the catacombs -- an unwise move ifever there was one.">

<ROOM STORY202
	(DESC "202")
	(STORY TEXT202)
	(CONTINUE STORY160)
	(ITEM MAGIC-AMULET)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT203 "As you go to step on a piece of mosaic majolica, your foot feels no resistance. You have stepped off the side of the tower and with a dreadful heave of the stomach you realize you are falling two hundred feet to be smashed on the rocks of what was once the entrance to Old Godorno harbour. Who will save your people now? Not you, a shattered body at the base of the Tower of the Sentinel.">

<ROOM STORY203
	(DESC "203")
	(STORY TEXT203)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT204 "You quickly ignite the incense, and smoke billows forth from the censer. The Jade Warriors are soon swathed in the roiling white clouds, and you grope your way through the smoke towards them. One of the warriors looms towards you, the light gleaming dully now off its facets and its sword is working mechanically. You recoil in fright but it lumbers past making elaborate passes in the air, as if engaged in a display of an ancient style of swordplay. The others are also lurching about at random. The smoke seems to have scrambled their senses. Each is cutting and thrusting at the air around it -but they seem oblivious of you.">

<ROOM STORY204
	(DESC "204")
	(STORY TEXT204)
	(PRECHOICE STORY204-PRECHOICE)
	(CONTINUE STORY133)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY204-PRECHOICE ()
	<SKILL-JUMP ,SKILL-FOLKLORE ,STORY119>>

<CONSTANT TEXT205 "You pole the boat as fast as you can to the nearest bank. Behind you there is a splash and a snort as an ugly but harmless sea cow breaks the surface of the water. You are exhausted from your attempt at flight, however, and step from the boat to rest at the edge of the murky canal, sitting on the road and basking in the midday sun.||Soon you have the uneasy feeling of being watched.">

<ROOM STORY205
	(DESC "205")
	(STORY TEXT205)
	(CONTINUE STORY374)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT206 "'How much gold are you offering me?' From his tone of voice you can tell the guard does not believe you.||\"The weight of a man's forearm in real red gold. You'll be rich beyond your wildest dreams.\"||He snorts. \"There is not so much wealth in the whole city, outside the Overlord's palace!\"||\"The Overlord has indeed sucked the city dry in his greed. But what of the usurers, the bankers? They have kept their stash of gold safe underground in these troubled times.\"||He fixes you with a suspicious glare. \"Bring me the gold and I'll hand over the keys. I'll not be responsible for the mayhem which follows. I won't be your scapegoat, Judain.\"||\"If you are wise,\" you tell him, \"you'll quit the city at the first opportunity, never to return.\"||You need 500 gleenars to cover the bribe you have offered him. It is unlikely that the other Judain would willingly part with most of the resistance fund for such a risky venture.">
<CONSTANT CHOICES206 <LTABLE "bribe him" "try selling some of your possessions" "use magic to make them accept any specious argument you come up with">>

<ROOM STORY206
	(DESC "206")
	(STORY TEXT206)
	(CHOICES CHOICES206)
	(DESTINATIONS <LTABLE STORY415 STORY235 STORY288>)
	(REQUIREMENTS <LTABLE 500 NONE SKILL-SPELLS>)
	(TYPES <LTABLE R-MONEY R-NONE R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT207 "Your spell ofInvisibility works as neatly as it always does. You congratulate yourself and make a mental note you could earn good money as a teacher of spellcasting at a sorcerer's academy. You walk to the gate unseen, just in front of an old woman who has come to the city to sell eggs. As you step through the outer gate one of the guards closes the inner one against you, while another pushes shut the outer gate, not minding the protestations of the old woman, who is now trapped beside you.||\"My wife could do with a dozen eggs for pancakes,\" he says to her. \"Haven't you heard about the Overlord's new tax, old woman? The egg tax!\"||\"Leave my eggs alone. It was all I could do to glean enough grains of wheat to feed my poor little chicks. You wouldn't take an old woman's livelihood would you? Not an old woman who's never done you any harm, nor wouldn't want to?\"||The guards decide to have a little fun at the woman's expense. Their captain is lounging bored on a seat beside the wall. Your invisibility will wear off soon.">
<CONSTANT CHOICES207 <LTABLE "cast Miasma" "Visceral Pang" "Rulership">>

<ROOM STORY207
	(DESC "207")
	(STORY TEXT207)
	(CHOICES CHOICES207)
	(DESTINATIONS <LTABLE STORY362 STORY372 STORY382>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT208 "The gigantic spider rocks back and forth, seemingly transfixed by the apparitions of you which have appeared on either hand. You have indeed won more time. It seems the spider cannot make a choice between three absolutely identical targets. It is not clever enough to begin a process of elimination.">
<CONSTANT CHOICES208 <LTABLE "attack it with an energy spell" "create a cloud of poisonous smoke">>

<ROOM STORY208
	(DESC "208")
	(STORY TEXT208)
	(CHOICES CHOICES208)
	(DESTINATIONS <LTABLE STORY290 STORY079>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT209 "\"I need some information. Perhaps you can help me?\" You wait for the landlord's reply, knowing that if you can get him to say yes he will probably end up telling you what you want to know.||\"Maybe I can,\" he concedes gruffly.||\"Tell me about Lucie. Does she frequent the Silver Eel often? And who is her companion?\"||\"She might, then again she might not. What's it to you?\"||\"If she's the girl I think she is, she has come into an inheritance. I'm trying to find out whether she is in fact the girl in question. I am sure she will be very appreciative of any help you can give.\"||His eyes light up with the thought of a reward. \"Yes, she haunts this place often. She's never alone. I see some of them again and again -- but she has a lot of friends, does little Lucie. She's a ornery girl that one. Knows her own mind and no mistake. Forever taking up with the most disreputable mountebanks and desperadoes. Always twists 'em round her little finger, mind.\"||\"And what about her friend?\"||\"That's Tyutchev, a foreigner. See how pale he is? Doesn't it make you feel ill just to look at him? He usually comes in with his doxy, Cassandra -- or is it he is her pretty boy? She's a terrible proud and beautiful woman, wearing gear like a Fury from the Abyss. At any rate, they had a terrible fight in here last week. I never saw a woman wield a sword with such skill and venom. It glowed cold blue, and where it struck the bar I found crystals of ice.\"||\"Who won the fight?\" you ask, incredulous.||\"They were both bleeding badly. It was a terrible battle. But they went out together. I do declare I've never had the misfortune to serve two less pleasant and outright perilous characters.\"||\"What do they all want with Lucie?\" you wonder aloud.||He cracks a rancid-toothed smile. \"What does any man want with Lucie?\"||You thank the landlord for his information and, leaving the alepot on the bar, walk over to the couple, who are watching you intently. Lucie smiles as she did when you met her in the street.">

<ROOM STORY209
	(DESC "209")
	(STORY TEXT209)
	(CONTINUE STORY227)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT210 "You reach the scene of the disaster by late afternoon. There is no sign of Lucie. The shack where she was hiding has been levelled to the ground. A great pit has opened up beneath it and looking down into it you smell the galling purulent stench of corruption that comes from the coils of Hate.||Is Lucie now just another lost soul, forced to live a half-life of torment within the corrupt flesh of Hate itself? You can't ask anyone if they have seen her, for they would not tell you if they had, out of fear of the Overlord's men.">
<CONSTANT CHOICES210 <LTABLE "attempt to search for her down the hole" "abandon her to her grisly fate">>

<ROOM STORY210
	(DESC "210")
	(STORY TEXT210)
	(CHOICES CHOICES210)
	(DESTINATIONS <LTABLE STORY360 STORY252>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT211 "Mameluke doesn't realize how sick you are. His cheerfulness is wearing until he goes on ahead to light the fire and warm his rooms up for you. As soon as his broad back bobs out of sight round the corner you sink, exhausted, to the cobbled ground. The city watchmen are clip-clopping over the cobbles towards you on horseback.">
<CONSTANT CHOICES211 <LTABLE "use" "use" "use" "you have none of these skills">>

<ROOM STORY211
	(DESC "211")
	(STORY TEXT211)
	(CHOICES CHOICES211)
	(DESTINATIONS <LTABLE STORY244 STORY264 STORY264 STORY278>)
	(REQUIREMENTS <LTABLE SKILL-CHARMS SKILL-CUNNING SKILL-STREETWISE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT212 "As you walk warily along Last Rites Street you see a captain of the guard, whom you remember is called Tormil, agreeing to help a citizen flee the city in return for most of his worldly weath. Only a rat like Tormil would take advantage of people's helplessness so callously. You stand in front of him and revile him for taking advantage of the oppressed.||\"If I were not due to take over my guard duties at the palace I would slay you on the instant, Judain scum. But I swear I will bring you before the Overlord in chains.\" With that he sets out for the palace.||His victim waits nearby until Tormil has rounded a corner and is safely out of sight before plucking up courage to talk to you.||\"As it is some time before Tormil can fulfil his pledge to help me leave, might I return your kindness?\" he asks.||He barely gives you time to nod your acceptance before continuing in his nasal tones: \"I am, or was until recently, a jeweller's assistant in Mire Street. Alas my own honesty has put me out of a job, and left me in fear of my life. I must leave the city.\"||\"Yet perhaps I may be revenged on my employer, and you may strike a blow for the Judain against the Overlord. A diamond owned by a Judain shopkeeper I once knew, is now at my master's shop being fashioned into a mighty sceptre for the Overlord. Finding out my connection with the previous owner, however, my master went to call the Overlord's guards so that I might be taken away and thrown into Grand to languish there with my Judain friend. It is clear to see my master favours not the Judain, nor those who would be their friends.\"||\"I beg you to reacquire the diamond, if not for my friend, then for the Judain cause. Here is the address.\"||He gives clear directions to the jeweller's shop in Mire Street before making his farewells. He parts company saying, \"Not all are against the Judain. Goodbye.\"">
<CONSTANT CHOICES212 <LTABLE "your mind to acquiring the diamond to order to finance the resistance effort" "search for a hideout">>

<ROOM STORY212
	(DESC "212")
	(STORY TEXT212)
	(CHOICES CHOICES212)
	(DESTINATIONS <LTABLE STORY241 STORY190>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT213 "Your search for another amulet is interrupted by the venomed blade of Skakshi the master thief. He has crept up on you unseen and unheard as only a master rogue can. He turns the knife in your vitals and you die at his hands. If only you hadn't lost your charm amulet it might have warned you of the danger. There is no one left to save the Judain now. Hate will subdue all.">

<ROOM STORY213
	(DESC "213")
	(STORY TEXT213)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT214 "It is time to spy out the lay of the land. Only by prowling around the streets yourself will you know what is really happening. As you pass towards the foreigners' quarter you are greeted silently by many of your people from their lookout and alarm posts. They melt away at the first sign of soldiers, so you are far from safe on the streets.||Turning a corner you come upon a most distressing sight. A virulent throbbing mass of purple slime presses up through a fissure into the sewers of the city. On a pile of rubble, many figures are caught in the sticky slime like flies on a piece of honey-smeared paper.||You recognize one of the faces staring out mutely, barely submerged under a violet sheen of skin. It is the daughter of Tormil, the captain of the palace guard who has sworn to deliver you to the Overlord in chains. Tormil's own daughter has fallen into the embrace of Hate. She is just another lost soul now. You decide to show her to Tormil; then you can ask him to join you in the resistance or try to trick him into joining his daughter, enmeshed in the coils of Hate.||You find Tormil on his journey home from the sword practice halls. You call to him from a dark alleyway and he stops and peers at you. \"Come with me, Captain Tormil. I have something to show you.\"||\"What do you want with me?\"||\"I have found your missing daughter. I want nothing but to bring you to her.\"||\"Lead on. I will follow -- at a distance. No tricks.\" He follows you warily to the fallen wall. You scramble to the top of the pile of rubble and point. He stands beside you and gazes into the dull glassy eyes of his daughter, who tries to reach out a hand towards him, but cannot.||Tormil breaks into tears, then flourishing his sword, he runs down the rubble slope to hack at the bloated form of Hate.">
<CONSTANT CHOICES214 <LTABLE "let him die, glad to see him meet his doom in Hate's coils" "try to save him">>

<ROOM STORY214
	(DESC "214")
	(STORY TEXT214)
	(CHOICES CHOICES214)
	(DESTINATIONS <LTABLE STORY095 STORY265>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT215 "The guards crane their heads towards you, desperate for you to save them. They goggle at you comically, as if they have never seen a person free to walk about on the earth before. ||\"Here, grab my hand,\" implores one of the guards, who is standing in Hate up to his knees. He tries to smile at you but it is the smile of a traitor.">
<CONSTANT CHOICES215 <LTABLE "grab his proferred hand and drag him out" "ignore him and pass on down the line">>

<ROOM STORY215
	(DESC "215")
	(STORY TEXT215)
	(CHOICES CHOICES215)
	(DESTINATIONS <LTABLE STORY025 STORY013>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT216 "The water of the pool is cloudy and you cannot be sure how deep it is. Touching it cautiously reveals it is cold but not deathly cold and to the taste it is as pure as spring water.">
<CONSTANT CHOICES216 <LTABLE "step in" "kirt round to the side of the pool">>

<ROOM STORY216
	(DESC "216")
	(STORY TEXT216)
	(CHOICES CHOICES216)
	(DESTINATIONS <LTABLE STORY245 STORY203>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT217 "Hardly daring even to breathe, you insert a bent pin into the lock and twist it with consummate precision. No surgeon ever operated so carefully upon a patient, no swain ever gave such loving entreaties to his paramour, no artist ever wielded his brush with such fine skill, as you work now upon that tiny lock.||Your diligence is rewarded; the lock abandons its duties with a soft tut. The lid of the coffer yields to your eager touch, and you allow yourself a smile as you lift out the gemstone you came for. Placing it in your mouth for safekeeping -- the sweetest lozenge you ever saw -- you skulk back noiselessly across the room and descend the stairs to emerge moments later into the night air.">

<ROOM STORY217
	(DESC "217")
	(STORY TEXT217)
	(CONTINUE STORY358)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT218 "Touching your wand, you speak a cantrip which confuses the guards' minds so that they see you as a long-lost friend. They slap you on the back, offer you beer and wish you well in the city. The old woman, who sells eggs in the city, follows you through the city gate. She is mumbling to herself through toothless gums. She obviously can't afford a set of false teeth, which are a recent invention in Godorno and one of the wonders of modern medicine.">

<ROOM STORY218
	(DESC "218")
	(STORY TEXT218)
	(CONTINUE STORY380)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT219 "The potent spell of Visceral Pang should suffice to bring the landlord to his knees and force him to do your bidding. You mouth the arcane words and twirl your fingers in the patterns that bring magic to life. The spell catches and the landlord's face grows pale, then very flushed. He makes a rush for the latrines but the pain pulls him up short and he doubles over m agony.||\"You will serve a Judain, my good man, and be quick about it,\" you say, looking around to gauge the reaction of the other drinkers.||The two women are looking at you in a new light. The pipesmoker is tapping out his pipe. Lucie looks shocked. The eyes of the tall stranger transfix you with a piercing stare. The gang of four are all fingering hidden weapons and checking their escape routes.||\"A pot of your finest ale, landlord,\" you say, letting the spell go. The landlord straightens slowly, holding his stomach, and reaches for an alepot.">
<CONSTANT CHOICES219 <LTABLE "ask him about Lucie and the tall stranger" "asks if he knows who or what is carrying off the good burghers of Godorno and leaving their hearts bobbing in the Crescent Canal">>

<ROOM STORY219
	(DESC "219")
	(STORY TEXT219)
	(CHOICES CHOICES219)
	(DESTINATIONS <LTABLE STORY236 STORY240>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT220 "You throw yourselfdown on your bed in the row of crooked houses down Bumble Row and try to sleep. A taint in the air stops your slumber and there is a sound like wet kippers being thrown onto a marble slab. It is getting louder. You roll off your bed in time to see a purple veil close over the door. Hate has sealed you in. Its skin starts to swell into a great blister which slowly expands until it covers the whole room. You are caught up in the coils of Hate and have joined the eternal orgy of despair. You cannot even save yourself now, much less your oppressed people.">

<ROOM STORY220
	(DESC "220")
	(STORY TEXT220)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT221 "Mameluke comes back for you when he sees you are struggling to keep up. You rest one arm over his shoulder and stagger on, supported by his strong frame. The Overlord's guard trot round the corner ahead and you pull up, scanning their faces for signs of pity. There are none.||\"Get out of our way,\" says Mameluke. \"I'm taking this poor citizen home -- got mistaken for a Judain and given a pretty savage beating. Known to me for years, I'll vouch for ...\"||\"Get away from the wretched Judain.\"||The captain of the guard means to take you in for questioning.">
<CONSTANT CHOICES221 <LTABLE "give yourself up and try to save Mameluke" "try to escape">>

<ROOM STORY221
	(DESC "221")
	(STORY TEXT221)
	(CHOICES CHOICES221)
	(DESTINATIONS <LTABLE STORY148 STORY193>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT222 "You make good progress along the rutted road by the light of the moon. Most goods are carried to Bagoe by river so there are no brigands on this road. As the sun rises you pass farms growing fruit and olives, vines and tomatoes and the great purple hubloe fruit which is so popular in Godomo. Every now and then the sweep of the Palayal river comes into view where road and river run side by side. You press on, hoping to reach Bagoe before the bargees from Godomo.">

<ROOM STORY222
	(DESC "222")
	(STORY TEXT222)
	(CONTINUE STORY247)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT223 "You draw your sword with a flourish and advance steadily on Skakshi. The landlord throws him a spiked club with which to defend himself. You can see by the way he hefts it he knows how to use it to pulp .brains. Your sword gives you the advantage over his rude weapon but you have never trained against a man wielding a spiked club.||How will you fight this battle?">
<CONSTANT CHOICES223 <LTABLE "move in close so that the smooth edge of the club shaft will fall on you if you are hit" "keep your distance and use looping cutting blows rather than fierce lunges">>

<ROOM STORY223
	(DESC "223")
	(STORY TEXT223)
	(CHOICES CHOICES223)
	(DESTINATIONS <LTABLE STORY052 STORY032>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT224 "You lure the monster to attack, then clamp the shackles of your chains around its tentacles. As you do, another tentacle swipes away the cornice of a building above and you are struck by a shower of falling masonry.">
<CONSTANT TEXT224-AGILITY "You dodge aside from the brunt of the rubble.">
<CONSTANT TEXT224-CONTINUED "You survey your handiwork. You have tethered Hate to the columns of the cathedral. Ifonly the chains hold, you may be able to destroy it once and for all.">
<CONSTANT CHOICES224 <LTABLE "use the Jade Warrior's sword" "use the Jewel of Sunset Fire" "you have none of those items">>

<ROOM STORY224
	(DESC "224")
	(STORY TEXT224)
	(PRECHOICE STORY224-PRECHOICE)
	(CHOICES CHOICES224)
	(DESTINATIONS <LTABLE STORY230 STORY349 STORY187>)
	(REQUIREMENTS <LTABLE JADE-WARRIORS-SWORD JEWEL-OF-SUNSET-FIRE NONE>)
	(TYPES <LTABLE R-ITEM R-ITEM R-NONE>)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY224-PRECHOICE ("AUX" DAMAGE)
	<COND(,RUN-ONCE
		<COND(<CHECK-SKILL ,SKILL-AGILITY>
			<SET DAMAGE 1>
		)>
		<TEST-MORTALITY .DAMAGE ,DIED-FROM-INJURIES ,STORY224>
		<COND(<IS-ALIVE>
			<COND(<CHECK-SKILL ,SKILL-AGILITY>
				<IF-ALIVE ,TEXT224-AGILITY>
			)>
			<IF-ALIVE ,TEXT224-CONTINUED>
			<COND(<NOT <CHECK-CODEWORD ,CODEWORD-GORDIAN>>
				<GAIN-CODEWORD ,CODEWORD-GORDIAN>
			)>
		)>
	)>>

<CONSTANT TEXT225 "This street winds down towards the riverfront and the centre of the city. It is crossed by large avenues that lead up to the citadel, lined with tall straight cedars. You hear the ringing of the town crier's bell. At the end of the street is Greenbark Plaza. The mob is still chasing you, growing hysterical in its desire for your blood. Ifyou are caught you will surely be stoned to death.">
<CONSTANT CHOICES225 <LTABLE "use" "run on into Greenbark Plaza" "duck down one of the smaller side streets">>

<ROOM STORY225
	(DESC "225")
	(STORY TEXT225)
	(CHOICES CHOICES225)
	(DESTINATIONS <LTABLE STORY369 STORY002 STORY385>)
	(REQUIREMENTS <LTABLE SKILL-ROGUERY NONE NONE>)
	(TYPES <LTABLE R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT226 "You know a little bit about horses and can ride tolerably well. Looking at the horse you see it is flinching from its own shadow. Taking its bridle you turn it till it is facing into the sun so it can no longer see its shadow. Mounting safely, you give the horse free rein: it surges into a gallop and you hang on grimly. Luckily for you the road to the main gate is straight. Within a few minutes you can see the wooden arches of the double gate ahead. People jump aside at the last moment from the path of your frothing mount.||The horse is still galloping wildly as you approach the gate and the gate guards tumble out of their guardhouse to stop you. One tries to grab the bridle but misses and falls over. Another is winding his crossbow. As you gallop past he lets fly and the bolt catches you in the side.">
<CONSTANT TEXT226-CONTINUED "You hang on grimly as the twang of crossbows echoes from behind. Bolts zip past your ears. The horse gallops on, leaving pursuit behind. The towers and minarets ofGodomo are lost to view by the time the horse runs itself out. You dismount and carry on up the trade road on foot.">

<ROOM STORY226
	(DESC "226")
	(STORY TEXT226)
	(PRECHOICE STORY226-PRECHOICE)
	(CONTINUE STORY302)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY226-PRECHOICE ()
	<TEST-MORTALITY 3 ,DIED-FROM-INJURIES ,STORY226>
	<IF-ALIVE ,TEXT226-CONTINUED>>

<CONSTANT TEXT227 "Tyutchev looks at you insolently. His direct stare makes you feel very uncomfortable. He has challenged many a poor fellow with a look like this, and most of them didn't live to tell the tale. Now he says, \"So a Judain comes ready for the slaughter! It's hardly worth the bother of collecting the ten gleenars' reward, but then there is the pleasure of killing you.\"||He speaks as though you were a slimebeast that had crawled out from under a stone. He draws his sword, a great one-and-a-half-hander, which he wields with negligent ease and power, as if it were a toothpick. It thrums through the air as he prepares to slaughter you. With a surprisingly quick movement for so large a man he manages to put himself between you and the only door. It doesn't look as if the latrine here backs onto the outside world so there is no escape that way. Perhaps that is why so many thieves drink here -- they are never bothered by the city guard. You have no choice but to fight.">

<ROOM STORY227
	(DESC "227")
	(STORY TEXT227)
	(CONTINUE STORY297)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT228 "You pour oil from your lantern onto the soft cloying purple flesh of Hate but it will not kindle. Hate is inflammable. The bloated purple mass heaves as it breathes and you can make out the tracks of the lost ones' tears, deep inside the translucent body. You will have to try something else.">
<CONSTANT CHOICES228 <LTABLE "ask some of the trapped guards what to do" "use" "cast Miasma" "Thunderflash" "Bafflement" "Rulership">>

<ROOM STORY228
	(DESC "228")
	(STORY TEXT228)
	(CHOICES CHOICES228)
	(DESTINATIONS <LTABLE STORY215 STORY192 STORY173 STORY165 STORY154 STORY122>)
	(REQUIREMENTS <LTABLE NONE SKILL-SWORDPLAY SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-NONE R-SKILL R-SKILL R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT229 "\"What do you think of the disguise?\" you say before the gate guards can challenge you. \"Eh? What do you think? What do I look like?\"||You seem utterly confident and they all look at you and smile. \"Reckon you're a spitting image of a Judain,\" says one.||\"Ain't I just? And I'm going to make a lot of friends among the Judain scum of the city and turn them over to the Overlord's men, for the reward. I reckon I'll make a fortune.\"||\"You want to watch out. They're powerful deep people, the Judain. They stick together like... like ...\"||\"Like rats and grain sacks!\" another puts in.||You and the old seller of eggs are allowed to proceed into the city. To your annoyance the old woman has the look of a tittle tattle. She mumbles constantly through toothless gums. \"I heard what you said in there. It ain't right. What have the Judain done to hurt you? Just raising their children as decent and honest as other folk, I'll warrant.\"">
<CONSTANT CHOICES229 <LTABLE "tell the old woman that you really are Judain" "try and lose her in the streets and hope she does you no harm">>

<ROOM STORY229
	(DESC "229")
	(STORY TEXT229)
	(CHOICES CHOICES229)
	(DESTINATIONS <LTABLE STORY275 STORY286>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROOM STORY230
	(DESC "230")
	(EVENTS STORY230-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY230-EVENTS ()
	<COND(<AND <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-CODEWORD ,CODEWORD-SATORI>>
		<RETURN ,STORY184>
	)(ELSE
		<RETURN ,STORY396>
	)>>

<CONSTANT TEXT231 "You gather the girl into your arms; she is as light as a feather pillow and quite limp. Her face is untouched by the blemishes which mar her body and she is quite beautiful, as you would expect of the Overlord's concubine.||Now how are you going to get both her and yourself across the carpet without stepping on it?">
<CONSTANT CHOICES231 <LTABLE "wrap her in the silk bedspread and drag her from the bed, after leaping clear" "carry her over your shoulder in a fireman's lift and walk quickly across the carpet">>

<ROOM STORY231
	(DESC "231")
	(STORY TEXT231)
	(CHOICES CHOICES231)
	(DESTINATIONS <LTABLE STORY319 STORY285>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT232 "Picking the pocket of one of the guards while you hand him your gold with the other hand is child's play to someone of your accomplishments. You palm his gold to your other hand and let the coins drop one by one into his greedily outstretched palm.||\"Where's my share?\" demands another of the gate guards, holding out his palm, while his other hand rests menacingly on the pommel of his rapier. You clap him on the back and empty his money pouch as you do so, also relieving him of a fine gold chain that hangs at his neck in the process. All four guards are soon happy with their own money newly shared out among them and at last you and the old seller of eggs are allowed to proceed into the city.">

<ROOM STORY232
	(DESC "232")
	(STORY TEXT232)
	(PRECHOICE STORY232-PRECHOICE)
	(CONTINUE STORY380)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY232-PRECHOICE ()
	<COND(,RUN-ONCE
		<GAIN-MONEY 15>
	)>>

<CONSTANT TEXT233 "How will you lift the hearts of the men and women on the barricade? They are quailing before the presence of Hate. Some start to wail as they recognize loved ones sunk in the cloying purple embrace of the monster.">
<CONSTANT CHOICES233 <LTABLE "tell them they have nothing to fear for they are of pure heart" "tell them that death on the barricade will lead to eternal salvation">>

<ROOM STORY233
	(DESC "233")
	(STORY TEXT233)
	(CHOICES CHOICES233)
	(DESTINATIONS <LTABLE STORY408 STORY379>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT234 "The sword leaves your hand like an arrow and buries itself into the bloated gasbag of a body, which is instantly ruptured. Black ichor sprays all over the room and the spider hunches up against the ceiling to die.">
<CONSTANT TEXT234-CONTINUED "The Jade Warrior's sword is now out of reach high in the dead spider's web.||You step up to the frame and hold the jewel aloft in both hands. Now all you have to do is bring it safely down from the tower">

<ROOM STORY234
	(DESC "234")
	(STORY TEXT234)
	(PRECHOICE STORY234-PRECHOICE)
	(CONTINUE STORY308)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY234-PRECHOICE ()
	<COND(<AND ,RUN-ONCE <CHECK-ITEM ,JADE-WARRIORS-SWORD>>
		<LOSE-ITEM ,JADE-WARRIORS-SWORD>
		<CRLF>
		<TELL ,TEXT234-CONTINUED>
		<TELL ,PERIOD-CR>
	)>>

<CONSTANT TEXT235 "You find several buyers among the captains of the sailing ships moored along Tartars' Quay. Most are keen to return to their homelands before the wave of hatred and persecution engulfs them as it has your own people. No friends of the Overlord who has wrecked their livelihoods, they receive you warmly and consider your wares.||After some deliberation, they announce the price they will pay for each item.">
<CONSTANT CHOICES235 <LTABLE "bribe the guard at the prison" "otherwise">>

<ROOM STORY235
	(DESC "235")
	(STORY TEXT235)
	(PRECHOICE STORY235-PRECHOICE)
	(CHOICES CHOICES235)
	(DESTINATIONS <LTABLE STORY415 STORY006>)
	(REQUIREMENTS <LTABLE 500 NONE>)
	(TYPES <LTABLE R-MONEY R-NONE>)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY235-PRECHOICE ()
	<COND(,RUN-ONCE
		<MERCHANT <LTABLE JADE-WARRIORS-SWORD JEWEL-OF-SUNSET-FIRE PLUMED-HELMET MAGIC-WAND MAGIC-AMULET HEALING-SALVE KNIFE> <LTABLE 500 1500 50 100 60 100 40> ,PLAYER T>
	)>>

<CONSTANT TEXT236 "\"She's a ornery girl that one,\" he mutters after casting a look in her direction. \"Knows her own mind and no mistake. Forever taking up with the most disreputable mountebanks and desperadoes. Always twists 'em round her little finger, mind.\"||\"And what about her friend?\"||\"That's Tyutchev, a foreigner. See how pale he is? Doesn't it make you feel ill just to look at hjm? He usually comes in with his doxy, Cassandra -- or is it he is her pretty boy? She's a terrible proud and beautiful woman, wearing gear like a Fury from the Abyss. At any rate, they had a terrible fight in here last week. I never saw a woman wield a sword with such skill and venom. It glowed cold blue, and where it struck the bar I found crystals of ice.\"||\"Who won the fight?\" you ask, although you would hardly expect the loser of a swordfight to be sitting drinking ale a week later.||\"They were both bleeding badly. It was a terrible battle. But they went out together. I do declare I've never had the misfortune to serve two less pleasant and outright perilous characters.\"||\"What do they all want with Lucie?\" you wonder aloud.||He cracks a rancid-toothed smile. \"What does any man want with Lucie?\"||You thank the landlord for his information and, leaving the alepot on the bar, walk over to the couple, who are watching you intently. Lucie smiles as she did when you met her in the street.">

<ROOM STORY236
	(DESC "236")
	(STORY TEXT236)
	(CONTINUE STORY227)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT237 "The horse looks skittish. Its chestnut flanks are darkened by sweat and its eyes dart about nervously while fr snorts and fidgets. It seems to be afraid of something.">

<ROOM STORY237
	(DESC "237")
	(STORY TEXT237)
	(PRECHOICE STORY237-PRECHOICE)
	(CONTINUE STORY289)
	(ITEM NONE)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY237-PRECHOICE ()
	<COND(<CHECK-SKILL ,SKILL-AGILITY>
		<STORY-JUMP ,STORY271>
	)(<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<STORY-JUMP ,STORY226>
	)>>

<CONSTANT TEXT238 "You are soon trussed up, helpless, and frogmarched into the prison fortress of Grond to join hundreds more of your people. You will never see the light of day again. There is no one left to save your people now. They will all perish and be wiped from the face of the earth.">

<ROOM STORY238
	(DESC "238")
	(STORY TEXT238)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT239 "It is the work of just a few minutes to throw Mameluke off your trail in the old quarter of the city. You hear him calling: \"Where are you, Judain? Let us be friends. I will help you against the Overlord. Come back ...\"||He screams suddenly and the gurgling sound is cut off, as though he were a pig being slaughtered. If you had taken him with you he would not now be dead -- but perhaps you should not blame yourself for the mindless ferocity of the Overlord's guards. No one in Godorno is safe these days.||You double back to your lair on Bumble Row.">

<ROOM STORY239
	(DESC "239")
	(STORY TEXT239)
	(CONTINUE STORY299)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT240 "You grab Ruth and shove her roughly out into the street. The guards laugh as they take her. \"Tryin' to make a run for it, were you, darlin'?\" sneers one as he manhandles her.||She screams out that she is pregnant, but they only sneer, \"Two for the price of one.\" They drag her away and her distraught screaming is a torment you will never forget. It will trouble your conscience and wake you from your dreams till the day you die.">

<ROOM STORY240
	(DESC "240")
	(STORY TEXT240)
	(PRECHOICE STORY240-PRECHOICE)
	(CONTINUE STORY414)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY240-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-SATORI>
		<DELETE-CODEWORD ,CODEWORD-SATORI>
	)>>

<CONSTANT TEXT241 "Returning to the cellar, you tell your cronies what you've learned while gathering rumours: \"The talk is of a certain jeweller on Mire Street. Recently he took delivery of a large diamond, which the Overlord himselfis paying to have worked into a sceptre. The diamond in question was seized from a Judain shopkeeper when he was hauled off to Grand.\"||Annas blows out his cheeks. \"Stealing the Overlord's own diamond, eh? You've never been one to do things by halves, I'll say that.\"||\"Still,\" adds Caiaphas, rubbing the long prow of his jaw, \"I'll admit we could use the money. Much of our operations rely on bribes -- and the traders from overseas demand high prices for weapons they're selling us these days.\"||You take a casual stroll down Mire Street to inspect the premises. The jeweller's house comprises an elegant shop with oak-framed bottle glass windows, above which live the jeweller and his family. Seeing a patrol of the city militia ahead, you dodge into cover down a side alley and wait for them to pass. You will return here tonight.">
<CONSTANT CHOICES241 <LTABLE "use" "rely on" "resort to" "proceed with the attempt" "give up">>

<ROOM STORY241
	(DESC "241")
	(STORY TEXT241)
	(CHOICES CHOICES241)
	(DESTINATIONS <LTABLE STORY306 STORY327 STORY355 STORY386 STORY190>)
	(REQUIREMENTS <LTABLE SKILL-ROGUERY SKILL-CHARMS SKILL-CUNNING NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT242 "It takes too long for you to concentrate your mind on the Rulership spell. You need to marshal every atom of your strength of will for this spell and your preparations are rudely and painfully interrupted by Skakshi's second stiletto dagger which buries its tip in your heart. You fall dead and there is no one left to save the wretched Judain from being wiped out for ever.">

<ROOM STORY242
	(DESC "242")
	(STORY TEXT242)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT243 "You seek out a foreign trader named Sardis, finally tracking him down in a tavern off Tartars' Quay. He always has a few odd trinkets to sell, brought from distant lands. When you explain your requirements, he gives a wink and pulls something from his pocket. It is an amulet on a silver chain. You recognize the aura at once, and reach to inspect it.||Sardis closes his fingers around it and smiles. \"First, let us discuss the price,\" he says. \"I have braved many dangers to traverse the seas with my wares. First there were the pirates of Far Cathay, then the sirens in the Straits of Nullity. I hardly care even to remember the frightening mist phantoms that beset the ship as we lay becalmed off Hengist Head ...\"||You sigh. \"Enough, Sardis. Spare me this tiresome routine. For once, will you break with the habit of a lifetime and just state the price!\"||\"For this amulet? A mere nine gleenars! And see, here I also have a fine sword of best Moorish steel, for which I ask only six gleenars.\"">

<ROOM STORY243
	(DESC "243")
	(STORY TEXT243)
	(PRECHOICE STORY243-PRECHOICE)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY243-PRECHOICE ()
	<MERCHANT <LTABLE MAGIC-AMULET SWORD> <LTABLE 9 6>>>

<CONSTANT TEXT244 "This time you pick the charm of Infernal Apparition, which causes you to resemble a nighted fiend from the pits of hell. You walk stiff-legged down the street towards them, screaming in the tongue of the fierce cannibals of the Isles of the Gaels. The troops pass you in two streams on either side of the cobbled street, making the sign of protection of the one god tolerated in Godorno, though you notice one or two fingering charms sacred to their old gods, behind their backs. It is tempting to cause trouble by denouncing them as heretics but you haven't the energy. The guards walk slowly past and out of sight.||Summoning all your strength you skulk through the shadows to the lighthouse garret, where Mameluke is warming some broth.">

<ROOM STORY244
	(DESC "244")
	(STORY TEXT244)
	(CONTINUE STORY316)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT245 "To your relief the pool is only three feet deep and you step out wet but unharmed on the far side. The moaning of the gargoyles dies away and it is only now it has ceased you realize how oppressive the doleful sound was.">
<CONSTANT CHOICES245 <LTABLE "explore the sides of this odd-shaped room, around the edges of the pool" "waste no time and open the door ahead">>

<ROOM STORY245
	(DESC "245")
	(STORY TEXT245)
	(CHOICES CHOICES245)
	(DESTINATIONS <LTABLE STORY203 STORY162>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT246 "\"It's the old beast from the catacombs. The ancient wicked heart of the city, claiming the people for its own.\" He hands you the pot of ale, which smells strongly of malt, barley and honey.||\"What is the old beast?\"||\"Some say it is the spirit of the Harakadnezzar, the Great Tyrant. It is said that when robbers desecrated his tombs he became absorbed into the bones of the world, gaining strength in the dark places far from the light. Now he has come forth to avenge himself. Others say it is the many-limbed beast, Hate. It attacks the wicked and decadent, carrying people off who have hate in their hearts. One thing I do know, it isn't good for trade.\"">
<CONSTANT CHOICES246 <LTABLE "use" "use" "quaff the ale he has given" "leave it untouched">>

<ROOM STORY246
	(DESC "246")
	(STORY TEXT246)
	(CHOICES CHOICES246)
	(DESTINATIONS <LTABLE STORY256 STORY287 STORY267 STORY276>)
	(REQUIREMENTS <LTABLE SKILL-FOLKLORE SKILL-CHARMS NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT247 "You are still miies from Bagoe and your spirits are lifting as you find the farmers much more friendly than the cityfolk, though you dare not stop to chat. The workers in the fields wave solemn greetings as you pass. You wave back to one and notice he is looking from you back down the road. Turning back you see a cloud of dust or smoke. Perhaps one of the farmers is burning off some old tomato plants.">

<ROOM STORY247
	(DESC "247")
	(STORY TEXT247)
	(PRECHOICE STORY247-PRECHOICE)
	(CONTINUE STORY055)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY247-PRECHOICE ()
	<SKILL-JUMP ,SKILL-WILDERNESS-LORE ,STORY037>>

<CONSTANT TEXT248 "Where will you enter the catacombs? There is a new fissure opened up in the sea wall at the old dock. There is also a way into the catacombs beneath the Overlord's stables.">
<CONSTANT CHOICES248 <LTABLE "go to the sea wall" "the Overlord's stables">>

<ROOM STORY248
	(DESC "248")
	(STORY TEXT248)
	(CHOICES CHOICES248)
	(DESTINATIONS <LTABLE STORY352 STORY262>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT249 "How will you try to free the guards?">
<CONSTANT CHOICES249 <LTABLE "try to torch the purple flesh of Hate" "ask some of the trapped guards what to do" "attack Hate using Miasma" "Thunderflash" "Bafflement" "Rulership" "use">>

<ROOM STORY249
	(DESC "249")
	(STORY TEXT249)
	(CHOICES CHOICES249)
	(DESTINATIONS <LTABLE STORY228 STORY215 STORY173 STORY165 STORY154 STORY122 STORY192>)
	(REQUIREMENTS <LTABLE NONE NONE SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS SKILL-SWORDPLAY>)
	(TYPES <LTABLE R-NONE R-NONE R-SKILL R-SKILL R-SKILL R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT250 "The guards here on the city gate look bored. You find a piece of straw in the road and walk up chewing this like a milch cow. In your best country yokel accent you ask them if you can try your hand at their job to see if you would like to join the city guard. They are taken in by your country bumpkin act and one of them is only too glad to give up his place on the gate to you so that he can begin the evening's drinking early.||You stay with the guards at the gate and learn much of what has passed since you fled the city. The Judain are hanging dead in iron cages by the hundred. A few managed to flee the city but most have gone to ground in what the guards call 'their lairs and slum pits'. Things have been very bad for your people. The Overlord is trying to wipe you Judain from the face of the earth -- with a large measure of success, by the sound of it. After three hours on the gate you manage to slink unseen into the city while the others are in the gatehouse, brewing a pot of tea.">

<ROOM STORY250
	(DESC "250")
	(STORY TEXT250)
	(CONTINUE STORY300)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT251 "You keep poling steadily along. The cresting wave smashes against the gondola and you are bumped by a large sea cow. It veers off and you pick yourself up from where you had fallen among the cushions and poll the boat further out. You call aloud but Hate has no ears with which to hear the pleas of the lost souls. Swanning around in a gondola is all very well but you haven't attracted the attentions of Hate. You pole back to the bank and return to your lair on Bumble Row.">

<ROOM STORY251
	(DESC "251")
	(STORY TEXT251)
	(CONTINUE STORY020)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT252 "Two of the stanchions holding up the mound of rubble are cracked and buckling. It would be suicide to venture down there. If Lucie is buried down that hole she must be long since dead. There is nothing you can do to help her, only hope she spent the night in the arms of a lover and not in her own miserable little hovel. You return to your people to prepare them to face Hate.">

<ROOM STORY252
	(DESC "252")
	(STORY TEXT252)
	(CONTINUE STORY195)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT253 "Your fears were well founded. Put slightly off-balance because of the burden of the chest, you tread too heavily on a loose floorboard. There is an ominous creak. For a single ghastly moment your over-florid imagination likens it to the groan of scaffold timbers when a man is hanged. But the rope is not around your neck just yet -- even though the guards are already whirling, pulling the swords from their scabbards.||\"A thief!\" they cry. \"Right under our very noses! Stop there, thief!\"">
<CONSTANT CHOICES253 <LTABLE "use" "fight your way out">>

<ROOM STORY253
	(DESC "253")
	(STORY TEXT253)
	(CHOICES CHOICES253)
	(DESTINATIONS <LTABLE STORY406 STORY283>)
	(REQUIREMENTS <LTABLE SKILL-AGILITY NONE>)
	(TYPES <LTABLE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<ROOM STORY254
	(DESC "254")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT255 "You duck down the steps into the drinking house and find to your horror that it is a haunt of off-duty gate guards and the Overlord's mercenaries. They sit around tables, drinking. Many still wear the purple and black livery of the Overlord. You walk quickly across the room looking for a second way out but there is none. You hear your pursuers rein in outside. There are too many enemies to fight.">
<CONSTANT CHOICES255 <LTABLE "hide in the privy" "surrender">>

<ROOM STORY255
	(DESC "255")
	(STORY TEXT255)
	(CHOICES CHOICES255)
	(DESTINATIONS <LTABLE STORY329 STORY342>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT256 "Your own opinion is that the myth of the return of Harakadnezzar is only a story invented to deter would-be grave-robbers from rifling the more recently consecrated tombs. The story of Hate, however, is well known to all folklorists. Hate rises up in the foundations of ancient decadent cities, swallowing the proud, wicked and greedy into its ravening maw. This manifestation of the force of Hate was last heard of in the Old Empire city of Kush, a thousand years ago. There is nothing left of Kush now. The greatest and most powerful city the world has ever seen has become a giant dustbowl in the grasslands.">
<CONSTANT CHOICES256 <LTABLE "enjoy your ale" "spurn it">>

<ROOM STORY256
	(DESC "256")
	(STORY TEXT256)
	(PRECHOICE STORY256-PRECHOICE)
	(CHOICES CHOICES256)
	(DESTINATIONS <LTABLE STORY267 STORY276>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY256-PRECHOICE ()
	<COND(<AND ,RUN-ONCE <CHECK-SKILL ,SKILL-CHARMS>>
		<STORY-JUMP ,STORY287>
	)>>

<CONSTANT TEXT257 "You soon find Lucie, who is sprawled flat on her back in the road. She looks at you as though you have betrayed her and to your dismay you see she is going to cry. \"I only wanted to touch it, just for a moment,\" she cries, already in floods of tears.||\"It is magically attuned to me. Only I can use it,\" you say hurriedly. You retrieve your amulet from the dust, but as you reach out to help Lucie up she shrugs you away, evading your grasp.">

<ROOM STORY257
	(DESC "257")
	(STORY TEXT257)
	(CONTINUE STORY261)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT258 "Starting up suddenly from your chair you attempt to kill the Guildmaster of Thieves, but Melmelo is not one to be caught at a disadvantage. You encounter an invisible wall that stops you dead. It is coated in a transparent sticky slime and you are held fast. Defenceless, there is nothing you can do as Melmelo goes to work with his favourite knife. He takes no pleasure in killing you, he merely has the satisfaction that a dangerous enemy has been eliminated. There is no one left to save the Judain now. Hate will destroy everything.">

<ROOM STORY258
	(DESC "258")
	(STORY TEXT258)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT259 "They have only one reply to such a hideous threat. Even as you are calling the lepers forward, the guards shoot you with their crossbows from the arrow slits on either side and above the gates. You are peppered like a pincushion. As you die there is a low heartless cheer when the guards realize they have slaughtered yet another Judain. There is no one left now to save the Judain. Hate will subdue all.">

<ROOM STORY259
	(DESC "259")
	(STORY TEXT259)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT260 "The guards decided that the price the Overlord has put on every Judain's head makes it worth their while to kill you, steal your money, and claim the reward. Perhaps another hero will arise to save your people, but you cannot even save yourself.">
<CONSTANT TEXT260-CITY "You handed over 10 gleenars and entered the city">

<ROOM STORY260
	(DESC "260")
	(STORY TEXT260)
	(EVENTS STORY260-EVENTS)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY260-EVENTS ()
	<COND(<CHECK-MONEY 10>
		<CHARGE-MONEY 10 T>
		<PAUSE-MESSAGE ,TEXT260-CITY>
		<CRLF>
		<RETURN ,STORY300>
	)(ELSE
		<RETURN ,STORY260>
	)>>

<CONSTANT TEXT261 "Lucie's light little feet carry her to the door of the notorious Silver Eel tavern. A long, low, dark grey building without a single window facing out onto the street, it is a notorious haunt of thieves and cutthroats. On the steps Lucie is greeted by a huge man dressed in black quilted leather armour, who has a bush of corn yellow hair in corkscrew spirals.">
<CONSTANT CHOICES261 <LTABLE "follow onto her turf, inside the Silver Eel" "slink back to your hidey-hole on Bumble Row">>

<ROOM STORY261
	(DESC "261")
	(STORY TEXT216)
	(CHOICES CHOICES261)
	(DESTINATIONS <LTABLE STORY086 STORY199>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT262 "Your times spent skulking unseen while casing the houses of the well-to-do will stand you in good stead now. One of the things you have learned is to make sure you always know of two possible escape routes. One is the storm drain that feeds into the Imperial Basin, where the Crescent Canal and Grand Canal meet. The other is the secret tunnel that leads underground to the burial crypts of the Megiddo dynasty, a family of kings who made great conquests in Godorno's golden age and brought prosperity to the city they ruled.">

<ROOM STORY262
	(DESC "262")
	(STORY TEXT262)
	(PRECHOICE STORY262-PRECHOICE)
	(CONTINUE STORY339)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY262-PRECHOICE ()
	<SKILL-JUMP ,SKILL-FOLKLORE ,STORY294>>

<CONSTANT TEXT263 "You speak the word of power and disappear. But Skakshi is not dismayed. He reaches for a pouch at his belt and flings a sparkling dust from it into the air in your general direction. The dust clings to you and sparkles in the ruddy light, limning your outline brightly for all to see, Skakshi sends the knife hurtling across the room at your breast, which it grazes.">
<CONSTANT TEXT263-CONTINUED "He reaches for another stiletto immediately. What will you do?">
<CONSTANT CHOICES263 <LTABLE "flee from the inn and bolt for home" "cast the potent spell of the Visceral Pang" "the puissant spell known as Miasma" "humiliate him by seizing his mind using Rulership">>

<ROOM STORY263
	(DESC "263")
	(STORY TEXT263)
	(PRECHOICE STORY263-PRECHOICE)
	(CHOICES CHOICES263)
	(DESTINATIONS <LTABLE STORY200 STORY312 STORY390 STORY242>)
	(REQUIREMENTS <LTABLE NONE SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-NONE R-SKILL R-SKILL R-SKILL>)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY263-PRECHOICE ()
	<COND(,RUN-ONCE
		<TEST-MORTALITY 1 ,DIED-FROM-INJURIES ,STORY263>
		<IF-ALIVE ,TEXT263-CONTINUED>
	)>>

<CONSTANT TEXT264 " You skulk in the shadows, then roll into the gutter where you play dead. This is an old thief's trick to avoid a hue and cry. The watchguards walk slowly past not giving yet another corpse in the plague-ridden city another glance and soon pass out of sight. Summoning all your strength you skulk through the shadows to the lighthouse-like garret, where Mameluke is warming some broth.">

<ROOM STORY264
	(DESC "264")
	(STORY TEXT264)
	(CONTINUE STORY316)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT265 "How will you try to save him? You shout a warning but he is heedless of the danger, desperate to save his daughter who is already beyond salvation.">
<CONSTANT CHOICES265 <LTABLE "use magic: it has a chance of saving him" "grab one of the fishermen's ropes coiled nearby and lasso Tormil with it">>

<ROOM STORY265
	(DESC "265")
	(STORY TEXT265)
	(CHOICES CHOICES265)
	(DESTINATIONS <LTABLE STORY097 STORY021>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS NONE>)
	(TYPES <LTABLE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT266 "You drop the concubine and the black cape-like monster wraps itself around her like the coils of a serpent. Her body twitches spasmodically as you leap from the bed, just clearing the edge of the carpet in safety.||The Overlord grunts and turns over; his fat form wobbles loosely as he stirs. He is waking up. You must make a run for it before he summons his bodyguards">

<ROOM STORY266
	(DESC "266")
	(STORY TEXT266)
	(PRECHOICE STORY266-PRECHOICE)
	(CONTINUE STORY161)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY266-PRECHOICE ()
	<COND(<AND ,RUN-ONCE <CHECK-CODEWORD ,CODEWORD-SATORI>>
		<DELETE-CODEWORD ,CODEWORD-SATORI>
	)>>

<CONSTANT TEXT267 "The honeyed ale slips down your gullet, filling your stomach with a heavy warm glow. The amber nectar is thick and almost sticky, yet strangely moreish. You finish the pot with relish, wipe your mouth backhanded and fall suddenly to the floor. The landlord has poisoned you in revenge for the pain you caused with your spell. You will not live to see this day out and there is no one who can save your people from extinction.">

<ROOM STORY267
	(DESC "267")
	(STORY TEXT267)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT268 "Which enchantment will you use on the heartless prison guards and torturers of Grond?">
<CONSTANT CHOICES268 <LTABLE "use a spell to make them feel uninterested in worldly affairs" "make them your friends" "terrify them">>

<ROOM STORY268
	(DESC "268")
	(STORY TEXT268)
	(CHOICES CHOICES268)
	(DESTINATIONS <LTABLE STORY378 STORY361 STORY341>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT269 "Luckily it is enough that the Judain can see by the look in your eyes you would kill them to protect the wretched guards. They fall back.||\"Have mercy on these poor dogs,\" you say. \"Do not fall to the depths of their depravity. Is this not the fate they have reserved for you? Are we not more noble than they? Let us show them our superiority by sparing them, that their very existence may be a testament to our nobility.\"||Your exhortations have appealed to their sense of vanity. They will spare the guards. You wander through the dark bones of the castle foundations, freeing those who are still alive, before returning to your hideout.">

<ROOM STORY269
	(DESC "269")
	(STORY TEXT269)
	(CONTINUE STORY159)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT270 "The Overlord's soldiers close on you with drawn swords. You fight for your life valiantly, your blade thrumming through the air, but you can't keep them off for ever. There are too many foes and they cut you down, while the townsfolk howl with glee. Your dying thought is, \"How could I have been so foolish to think I could fight my way out of this?\"">

<ROOM STORY270
	(DESC "270")
	(STORY TEXT270)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT271 "You seize the bridle and leap into the saddle. The chestnut horse bucks and then arches its back and makes a series of straight-legged jumps to shake you from the saddle. You decide to give it free rein as you feel the horse's fear, hoping this will stop it bucking. It surges into a gallop and you hang on grimly. Luckily for you the road to the main gate is straight. Within a few minutes you can see the wooden arches of the double gate ahead. People jump aside at the last moment from the path of your frothing mount.||The horse is still galloping wildly as you approach the gate and the gate guards tumble out of their guardhouse to stop you. One tries to grab the bridle but misses and falls over. Another is winding his crossbow. As you gallop past he lets fly and the bolt catches you in the side.">
<CONSTANT TEXT271-CONTINUED "You hang on grimly. The twangs of crossbow strings ring out behind you. Deadly quarrels go shooting past your ears. The horse gal- lops on, leaving pursuit behind. The towers and minarets of Godorno are lost to view by the time the horse runs itself out. It is lame. You dismount and carry on up the trade road on foot.">

<ROOM STORY271
	(DESC "271")
	(STORY TEXT271)
	(PRECHOICE STORY271-PRECHOICE)
	(CONTINUE STORY302)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY271-PRECHOICE ()
	<TEST-MORTALITY 3 ,DIED-FROM-INJURIES ,STORY271>
	<IF-ALIVE ,TEXT271-CONTINUED>>

<CONSTANT TEXT272 "As head of the Judain resistance movement in Godorno you are now one of the most powerful people in the city. With power comes responsibility but you comfort yourself that you are doing your best. You wonder how many more Judain will die carrying out your orders. How many innocent people will suffer. Will the Overlord give in to your demands? Or will you all be taken to the prison fortress of Grand and tortured?||The Overlord is no longer the great enemy. It is Hate you must outwit. In order to do so you must know something about its movements. Where does it sleep? Can it be harmed? How long does it take to ingest lost souls? You need the answers to these questions but where will you seek them?">
<CONSTANT CHOICES272 <LTABLE "take a gondola down Grand Canal and hope Hate comes to you" "explore the catacombs">>

<ROOM STORY272
	(DESC "272")
	(STORY TEXT272)
	(CHOICES CHOICES272)
	(DESTINATIONS <LTABLE STORY292 STORY248>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT273 "You kneel beside her though her eyes implore you not to. She raises her arm to put it round you, then looks at the other. To your horror you see that a patch of wall has broken away to reveal something purple beneath. Lucie's arm has been drawn inside it. You are about to spring back when two tentacles whip out of the purple mass, twining round your windpipe and one wrist. Lucie is indeed a little lost soul, already being absorbed into the body of Hate. There is no escape for her -- and maybe no escape for you, either.">

<ROOM STORY273
	(DESC "273")
	(STORY TEXT273)
	(PRECHOICE STORY273-PRECHOICE)
	(CONTINUE STORY335)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY273-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-SATORI ,STORY343>>

<CONSTANT TEXT274 "Somehow, from the midst of chaos and despair, you must fashion a way that will deliver your people and save the city. But one wrong move will end in disaster.||There are three things you might use against the monster.">
<CONSTANT CHOICES274 <LTABLE "use the" "use the" "use the chains retrieved from the prison gates to shackle Hate" "you have none of those items">>

<ROOM STORY274
	(DESC "274")
	(STORY TEXT274)
	(CHOICES CHOICES274)
	(DESTINATIONS <LTABLE STORY230 STORY349 STORY392 STORY187>)
	(REQUIREMENTS <LTABLE JADE-WARRIORS-SWORD JEWEL-OF-SUNSET-FIRE CHAINS NONE>)
	(TYPES <LTABLE R-ITEM R-ITEM R-ITEM R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT275 "The old woman doesn't betray the least surprise at your revelation. \"Best lie low, these are bad times for Judain and no mistake. Good luck.\"||And with that she is off to find a place on the street to sell her meagre clutch of eggs. You walk on into the once bustling city.">

<ROOM STORY275
	(DESC "275")
	(STORY TEXT275)
	(CONTINUE STORY300)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT276 "You pick up your ale pot, then set it down on the bar again without drinking from it. It would not do to be poisoned when there are so many depending on you for leadership. The landlord's eyes flit from yours to the ale pot and back again. It seems you have guessed aright: the landlord meant to avenge himself by poisoning you.||There is no sense in looking for more trouble here. You give the surly landlord a knowing look and prepare to quit the bar, determined never to darken its doors again.">
<CONSTANT CHOICES276 <LTABLE "leave the Silver Eel" "ask about Lucie and the tall stranger before you go" "go to talk with her and her strange acquaintance">>

<ROOM STORY276
	(DESC "276")
	(STORY TEXT276)
	(CHOICES CHOICES276)
	(DESTINATIONS <LTABLE STORY199 STORY236 STORY227>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT277 "The Jade Warriors' swords are the finest you have ever seen. One in particular seems almost to pulse with energy, catching light like droplets of honey along its sharp edge.||With such a sword you might conquer a kingdom. The lure of avarice is too great. Diving forward, you duck under the swipe of the nearest Jade Warrior and leap nimbly over the attack of the second. Jumping behind the Jade Warrior with the finest blade, you throw yourself against its sword arm, wrenching the blade from its strong grasp.||The others close in, and too late you realize your escape route is cut off. By reflex you raise the sword. \"Get away from me!\" you cry as menacingly as you can as they loom over you to slice your vitals.||To your relief and amazement they obey your command, lining up before you to stand at attention. They whirr and click as they follow you dutifully to the edge of the precincts of the burial chambers, and there they grind to a halt. There is nothing you can do to move them further. Although you cannot command the Jade Warriors to go forth and attack Hate, you tell them that they must attack Hate if it should loop its coils into the burial chambers of the Megiddo dynasty. You leave all doors and traps wide open in the hope that Hate will blunder in and get carved up.||Sure enough, when you return the next day the place shows the signs of an epic battle. Great gouts of translucent flesh hang from lintel and corners. There is a fine green powder in the air, like pulverized glass. The Jade Warriors have been ground to dust by Hate but, judging by the quantity of purple ichor smeared over the walls, they must have given the monster acute indigestion.">

<ROOM STORY277
	(DESC "277")
	(STORY TEXT277)
	(EVENTS NONE)
	(PRECHOICE STORY277-PRECHOICE)
	(CONTINUE STORY174)
	(ITEM JADE-WARRIORS-SWORD)
	(CODEWORD CODEWORD-HECATOMB)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY277-PRECHOICE ()
	<COND (<NOT <CHECK-ITEM ,PLUMED-HELMET>>
		<TELL CR "Take a plumed helmet?">
		<COND (<YES?>
			<TAKE-ITEM ,PLUMED-HELMET>
		)>
	)>>

<CONSTANT TEXT278 "You sit, exhausted, against a ramshackle wall and the city guards rein their horses in around you. You pass out with the sickness, only to come to a moment later as you are roughly hauled to your feet. The guards have dismounted to surround you. You are pushed around between them, then you double up as a knee is driven hard into your solar plexus.||They beat you badly and leave you for dead.">
<CONSTANT TEXT278-CONTINUED "You drag yourself out of the gutter and manage to stagger to Mameluke's garrett.">

<ROOM STORY278
	(DESC "278")
	(STORY TEXT278)
	(PRECHOICE STORY278-PRECHOICE)
	(CONTINUE STORY316)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY278-PRECHOICE ()
	<TEST-MORTALITY 5 ,DIED-FROM-INJURIES ,STORY278>
	<IF-ALIVE ,TEXT278-CONTINUED>>

<CONSTANT TEXT279 "You are taking a terrible risk, stealing into the Overlord's palace. It is a dark night and you fight to control a blackness of heart which impels you to take revenge on the cruel tyrannical Overlord.||Emerging out of the catacombs beneath the palace stables you make your way in by the postern gate and steal along strangely deserted corridors towards where you guess the Overlord's suite must be.||There are few guards here, though you can hear the sounds of a drunken brawl in the guardhouse itself. How can the Overlord's security be so lax? Is he losing his grip?||After only five minutes inside the palace you are outside the Overlord's bedchamber. Holding your breath you push open the door and step through.">

<ROOM STORY279
	(DESC "279")
	(STORY TEXT279)
	(CONTINUE STORY030)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT280 "The walls of the prison are purple, pulsating slowly. They are lined with guards, sucked into the tentacles of Hate which have infested the prison. A score of despairing, pleading looks are turned on you, followed by a chorus of low moans. This has been the work of but a single night for all-devouring Hate. Most of the men have been sucked in only as far as both elbows, or knees, but they are all exhausted by their fruitless struggles to break free. When they get tired and lose concentration they have all touched Hate with their other hand or foot and so become deeper enmeshed. Unable any longer to resist the pull of Hate they are being submerged in the purple morass inch by inch; every time Hate takes a breath its flesh advances over them imperceptibly.||Most of the men are wailing out repentance for the atrocities they have committed on the poor prisoners of Grond.">
<CONSTANT CHOICES280 <LTABLE "try to set them free" "leave them to their harsh but deserved fate and go on to free the Judain">>

<ROOM STORY280
	(DESC "280")
	(STORY TEXT280)
	(CHOICES CHOICES280)
	(DESTINATIONS <LTABLE STORY249 STORY332>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT281 "How will you teach proud Skakshi a lesson? The thief vaults nimbly over the table and draws a stiletto from his boot. It is a balanced knife, good for throwing. You haven't long in which to do something. You can use magic but be warned that it is difficult to work a spell in such a short time, however.">
<CONSTANT CHOICES281 <LTABLE "use magic and try for a quick casting of Visceral Pang" "Miasma" "Vanish" "Rulership" "fight" "rely on your wits" "you have none of these skills">>

<ROOM STORY281
	(DESC "281")
	(STORY TEXT281)
	(CHOICES CHOICES281)
	(DESTINATIONS <LTABLE STORY313 STORY390 STORY263 STORY242 STORY223 STORY067 STORY357>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS SKILL-SWORDPLAY SKILL-CUNNING NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-SKILL R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT282 "The word ofpower you speak does its work and you disappear from view. One ofthe guards has the sense to let his crossbow off and the quarrel buries itself joltingly in your chest. You bite your lip to stop yourself moaning in agony.">
<CONSTANT TEXT282-CONTINUED "You hide in a doorway, satisfied that the guards can't see you yet.">
<CONSTANT CHOICES282 <LTABLE "bandage yourself up before making your escape" "run for it straight away">>

<ROOM STORY282
	(DESC "282")
	(STORY TEXT282)
	(PRECHOICE STORY282-PRECHOICE)
	(CHOICES CHOICES282)
	(DESTINATIONS <LTABLE STORY383 STORY393>)
	(TYPES TWO-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY282-PRECHOICE ()
	<COND(,RUN-ONCE
		<TEST-MORTALITY 6 ,DIED-FROM-INJURIES ,STORY282>
		<IF-ALIVE ,TEXT282-CONTINUED>
	)>>

<CONSTANT TEXT283 "The penalty for fighting with the Overlord's guards is to be hung in chains until the wind dries you out like a raisin. That's if you get caught, of course. But either way -- whether you are killed in this struggle, or arrested and taken to Grond -- it means you are now in a fight to the death. It is a grim battle, fought almost in silence. The only sounds are frantic pants of breath and the scuff of quick footfalls as you manoeuvre back and forth across the room. At least you have one thing in your favour: although outnumbered, you are able to get your back to a comer, making it difficult for the soldiers to press their advantage.">
<CONSTANT TEXT283-CONTINUED "You survive to gain victory. You step over the soldiers' bodies and snatch up the treasure chest, then hurry offinto the night.">

<ROOM STORY283
	(DESC "283")
	(STORY TEXT283)
	(PRECHOICE STORY283-PRECHOICE)
	(CONTINUE STORY358)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY283-PRECHOICE ("AUX" (DAMAGE 5))
	<COND(,RUN-ONCE
		<COND(<CHECK-SKILL ,SKILL-SWORDPLAY>
			<SET DAMAGE 1>
		)(<CHECK-SKILL ,SKILL-UNARMED-COMBAT>
			<SET DAMAGE 3>
		)>
		<TEST-MORTALITY .DAMAGE ,DIED-IN-COMBAT ,STORY283>
		<IF-ALIVE ,TEXT283-CONTINUED>
	)>>

<CONSTANT TEXT284 "The Overlord's soldiers close in on you with drawn swords. You fight for your life valiantly. Your fists and feet are a blur, but you can't keep them off for ever. There are too many foes and they cut you down while the townsfolk howl with glee. Your dying thought is: \"How could I have been so foolish to think I could fight my way out ot this?\"">

<ROOM STORY284
	(DESC "284")
	(STORY TEXT284)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT285 "As you prepare to step off the bed, a black monstrous being emerges noiselessly from the canopy of the Overlord's bed and glides down to settle over the girl. It looks like a manta ray or a vampire's cape. You see that the underside of the creature is covered with barbed spines which ooze a yellow venom.">
<CONSTANT CHOICES285 <LTABLE "drop the girl, who is still limp in your arms, and jump from the bed" "carry her quickly over the carpet before prising the thing off her">>

<ROOM STORY285
	(DESC "285")
	(STORY TEXT285)
	(CHOICES CHOICES285)
	(DESTINATIONS <LTABLE STORY266 STORY322>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT286 "She is surprisingly sprightly for an aged crone. She scuttles along after you cackling to herselfin a witch-like way. You turn towards Greenbark Plaza when two lines of guards block the road at either end of the narrow short street you are in. They are armed with crossbows which they are pointing at your chest.||\"We're taking you to Grand, Judain. The Overlord's torturers can amuse themselves with you.\"">
<CONSTANT CHOICES286 <LTABLE "surrender to them and be tortured" "turn invisible" "fight your way out">>

<ROOM STORY286
	(DESC "286")
	(STORY TEXT286)
	(CHOICES CHOICES286)
	(DESTINATIONS <LTABLE STORY238 STORY282 STORY405>)
	(REQUIREMENTS <LTABLE NONE SKILL-SPELLS NONE>)
	(TYPES <LTABLE R-NONE R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT287 "The amulet gives a flare of violet light in the flickering lamplight of the inn. You know that signal well. It is a warning of poison and deceit, visible only to your own eyes. You look with narrowed eyes at the landlord, then at the alepot on the bar.">

<ROOM STORY287
	(DESC "287")
	(STORY TEXT287)
	(CONTINUE STORY276)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT288 "It is hardly an act of trust to use magic against your own allies, even if the cause is a good one.||Caiaphas pulls a long face at being asked to give up such a large part of the Judain hoard and asks in his rumbling basso voice, \"How many of our fellow Judain remain alive in Grond?\"||\"If there is but one of our kind remaining alive it is worth it,\" you reply glibly.||Caiaphas doesn't look as if he agrees. He turns to little high-voiced Annas, who asks, \"How can we be sure the guard will hand over the keys?\"||\"No keys, no money,\" you say.||\"He might just hand over a set of keys to the Overlord's kitchens!\"||\"There would be no profit in it for him.\"||Annas peers at you, not sure if you understood his objection. \"And why do you suddenly wish to help the prison guards?\" he asks. \"Every day you give us orders to kill the Overlord's men and we obey. Have you lost your mind?\"||\"It is the only course. We must show compassion if we are to avoid being consumed by Hate.\"||Amazingly, Annas looks convinced, but Caiaphas asks, \"What of the murderers, the lunatics, and thieves who will also. be set free?\"||You give a curt wave of your hand. \"What of them? The city cannot fall into any worse state.\" Caiaphas shrugs. You have your gold.">

<ROOM STORY288
	(DESC "288")
	(STORY TEXT288)
	(PRECHOICE STORY288-PRECHOICE)
	(CONTINUE STORY415)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY288-PRECHOICE ()
	<COND (,RUN-ONCE
		<COND(<CHECK-CODEWORD ,CODEWORD-SATORI>
			<DELETE-CODEWORD ,CODEWORD-SATORI>
		)>
		<GAIN-MONEY 500>
	)>>

<CONSTANT TEXT289 "Seizing the bridle you vault into the saddle. The chestnut horse bucks and then, arching its back, makes a series of straight-legged jumps that shake you from the saddle before you can settle. You fall to the cobbles, stunned, listening in a detached way as the hoof beats of your pursuers come closer and stop. Your head is swimming as the soldiers dismount.||\"Judain scum,\" says one of them, plunging a sword in your back, killing you as if you were no more than a dog. \"That's one less to worry about,\" he says.">

<ROOM STORY289
	(DESC "289")
	(STORY TEXT289)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT290 "A great crash echoes round the room and seems to shake the whole tower. It is followed by an explosion of spurting red flame which bathes the black spider in its punishing light. You feel giddy as the tower rocks. The spider recoils, its legs buckle under it and it struggles in vain to get up. The Jewel of Sunset Fire is yours for the taking. You make a dash for it before the gigantic spider, which is giving out a high keening hiss, can recover.">

<ROOM STORY290
	(DESC "290")
	(STORY TEXT290)
	(CONTINUE STORY308)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT291 "Skakshi takes you by a devious route, perhaps hoping you will get lost in the foreigners' quarter, which you have been travelling through now for ten minutes.
'What do you have in mind for Melmelo?' Skakshi is anxious to know whether you intend the Guildmaster of Thieves any harm. There is naked ambition gleaming in his eyes; he is a truly nasty piece of work.||\"Wait and see,\" you tell him.||At last you stand before a white stuccoed villa with an ornamental steam bath bubbling in the garden.||\"This is Melmelo's place. The soft living here has made him unfit to lead our guild. There are many who are just waiting for something to happen.\"||\"Thank you, Skakshi, for guiding me here. What is the password? I don't want to be killed for calling without an invitation.\"||\"Just shout, 'enchantress' and they will let you in. If anything happens remember it was me, honest Skakshi, who brought you here. Don't tell Melmelo though.\" With that he is gone; he blends into the shadows like a ghost.||Walking up to the double doors of the villa you cry the password for all to hear.">

<ROOM STORY291
	(DESC "291")
	(STORY TEXT291)
	(CONTINUE STORY012)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT292 "Taking the grandest gilded gondola from the tie-ups at Tartars' Quay you begin to pole effortlessly down the Grand Canal. Inside the gondola the benches are covered with black leather, neatly garnished with fine linen cloth, its edges trimmed with lace. The gilded ends of the boat are in the shape of dolphins' tails. There is no other traffic on the water and you are at leisure to notice the cracks developing in the waterfront villas as they begin to subside into the canal. Every now and then a cascade of tiles and chimney pots reminds you Godorno is sinking without trace.||How will you attract the attention of Hate as you pole down the canal?">
<CONSTANT CHOICES292 <LTABLE "sing a song" "call aloud for Hate to come and make final reckoning with you">>

<ROOM STORY292
	(DESC "292")
	(STORY TEXT292)
	(CHOICES CHOICES292)
	(DESTINATIONS <LTABLE STORY314 STORY323>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT293 "You find Lucie loitering around the moored gondolas on Circle Canal. In better days she might have had rich pickings from dipping her hand into the purses of the wealthy. In these troubled times, few people dare venture into the streets with money in their pockets.||You explain that you want to get into Grond and free the prisoners there.||\"Help free those vermin?\" she says. \"Why would I want to? Many are murderers, rapists and madmen!\"||\"Many are brave men whose only crime was to speak out against the Overlord. Others are even more blameless. My fellow Judain, for instance, declared criminal simply because of race and creed.\" Lucie seems not even to have heard you. \"Those beasts in Grond -- they are animals! Let Hate take them!\" She looks at you as though you have lost your wits, her pretty face contorted with hatred. The glint in her eyes is frightening. She looks mad.">
<CONSTANT CHOICES293 <LTABLE "slap her to end this hysterical outburst" "tell her to be calm">>

<ROOM STORY293
	(DESC "293")
	(STORY TEXT293)
	(CHOICES CHOICES293)
	(DESTINATIONS <LTABLE STORY336 STORY346>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT294 "The burial crypts of the Megiddo dynasty are reputed to be guarded by the Jade Warriors, four enchanted statues of their most trusted and able bodyguards. If you are forced to flee into those crypts you risk disturbing them. It is said they have killed even the most cunning and dangerous grave robbers and defilers of tombs over the centuries.||It is also said that the Jade Warriors. protect not only the ceremented mummies of the Megiddo dynasty but a vast panoply of war gear along with enough treasufe to maintain a large army indefinitely. The swords of the famed Megiddan Palace Guard are reputedly sharper than any ever made in the eastern world.">

<ROOM STORY294
	(DESC "294")
	(STORY TEXT294)
	(CONTINUE STORY409)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT295 "Hate reaches for the crumbling building on either side of the street. Locking its tentacles around the famous Bridge of Sighs, it brings the whole structure crashing down on your head. You fall and are crushed under the rubble, while Hate goes lumbering past to bring about the final end of the cursed city of Godorno. You have failed.">

<ROOM STORY295
	(DESC "295")
	(STORY TEXT295)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT296 "You take up a martial stance before the first of the Jade Warriors, searching for a weakness to attack. Your fists and feet cannot shatter thejade, which is impervious to your blows. The blades of the Jade Warriors are terribly sharp as you find to your cost when one bites into your thigh.">
<CONSTANT TEXT296-CONTINUED "You have no choice but to flee.">

<ROOM STORY296
	(DESC "296")
	(STORY TEXT296)
	(PRECHOICE STORY296-PRECHOICE)
	(CONTINUE STORY016)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY296-PRECHOICE ()
	<TEST-MORTALITY 4 ,DIED-FROM-INJURIES ,STORY296>
	<IF-ALIVE ,TEXT296-CONTINUED>>

<ROOM STORY297
	(DESC "297")
	(EVENTS STORY297-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY297-EVENTS()
	<COND(<OR <CHECK-ITEM ,SWORD> <CHECK-ITEM ,JADE-WARRIORS-SWORD>>
		<RETURN ,STORY328>
	)(ELSE
		<RETURN ,STORY384>
	)>>

<CONSTANT TEXT298 "It tears you apart to leave Lucie but she is already a lost soul, lost for ever in despair. With a heavy heart you set out towards your lair on Bumble Row once more to get ready to prepare the Judain for battle.">

<ROOM STORY298
	(DESC "298")
	(STORY TEXT298)
	(CONTINUE STORY195)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT299 "The surviving Judain of the city all look to you for leadership now. They are ashamed at not having stood up to the Overlord, but your news of his suffering has cheered them. They feel as if God has not yet forsaken them.||You circle various safe areas on your map of the city and assign a cell offive operatives to each, giving them a list of the people they are to support with their foraging. The high death rate at least means less mouths to feed.||Each cell is also given a list of people to be assassinated. \"If you do your work well the Overlord will be forced to grant us pardon and we can begin life anew,\" you tell them to instil hope in their hearts. \"We will search for the Promised Land where there is only the one true God, Light of our Lives.\"||\"Our miserable lives,\" grumbles one of the grandmothers.||\"Enough,\" you say autocratically, beginning to revel in your leadership now, \"I want no dissent. You all know what you have to do. The heads of each resistance cell will meet at noon on the third day from now, underneath the Lord Mayor's house. I expect all of you to report success in your missions, and without loss. I'm relying on you. You know where to find me if you need me, now go, and keep your heads down.\"">

<ROOM STORY299
	(DESC "299")
	(STORY TEXT299)
	(CONTINUE STORY006)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT300 "At last you face the noisome streets of the city once more. The facades of the palaces seem even more chipped and sullied than they were before you left. Several of the rows of grand villas along the riverfront and up the Grand Canal seem to have subsided several feet towards the waterline. Where once the roofline was an uninterrupted plane from one end of the canal to the other, now it is a crooked saw-toothed succession of pinnacles and collapsed roofs. Something has shaken the city to its foundations while you have been away.||Will you find a safe place to hide until the worst of the terror is over? Your old hovel on Copper Street is only a couple more miles' tramp from here. You decide to go back there to find old friends.">

<ROOM STORY300
	(DESC "300")
	(STORY TEXT300)
	(CONTINUE STORY004)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT301 "Only a rogue like you would know how to save yourself. Slipping your dagger from your sleeve you step sideways and grab a timid-looking young woman, richly dressed, away from her aged retainer. You hold the blade to her throat. You are lucky, she is the only daughter of a nobleman and the soldiers check, fearful of her father's wrath.||\"Put up your swords or the girl dies.\"||The mob falls silent and the soldiers look to the town crier who orders them to obey you.||You walk her away from the plaza, ordering everyone to stay where they are. As soon as you turn the corner you release her, shout a quick apology, and run for it.">

<ROOM STORY301
	(DESC "301")
	(STORY TEXT301)
	(CONTINUE STORY038)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT302 "It is unusual for travellers to walk alone on the trade route. Brigands live in hill forts to the north of the road. Their crenellated keeps survey great sweeps of land from which they come down on poor travellers like wolves on the fold. They plunder the merchant caravans, doing battle with the mercenary guards. Walking alone you are not safe.||The road is already starting to climb towards the mountain passes, through meadowlands where the brigands keep herds of cattle.">
<CONSTANT CHOICES302 <LTABLE "go along the road" "strike off north through brigand territory towards the great forest">>

<ROOM STORY302
	(DESC "302")
	(STORY TEXT302)
	(CHOICES CHOICES302)
	(DESTINATIONS <LTABLE STORY003 STORY014>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT303 "Mameluke greets you warmly. He is preparing to eat a cat which he has skinned and roasted over a slow fire; he offers to share it with you. Famished, you thank him and eat greedily while trying not to think of the rats the cat has itself dined upon in the past, in the fouled gutters of the city.||Mameluke insists on telling you about a mishap which befell him this morning: \"In going about three hours ago, to a rendezvous with a girl of Godorno -- unmarried and a daughter to one of the nobles -- I tumbled into the Grand Canal, my foot slipping as I got out of my gondola owing to the cursed slippery steps of the palaces here. In I flounced like a carp, and went dripping like a Triton to my Sea Nymph and had to scramble up to a grated window -- 'fenced with iron within and without, lest the lover get in or the lady get out'.\"||Mameluke is in a whimiscal mood. You are reminded of the man who sat around fiddling while the city burned. Nevertheless you implore him to help you for the sake of your people.||\"I will help you, my friend,\" he says, \"if only to rid myself of the wailing of the prisoners, which are a constant affront to my sanity.\"||\"Should I ask Lucie for help?\" you suggest. \"She might know someone in the fortress.\"||\"I'll warrant she does, but I don't trust that wench. She acts so innocent yet I've never known her want for protection on the streets of Godorno, have you?\"||\"Perhaps you're right, but we need a way in.\"">
<CONSTANT CHOICES303 <LTABLE "take Mameluke to call on Lucie and ask for her help" "take him into the catacombs to look for a way into the prison fortress of Grond">>

<ROOM STORY303
	(DESC "303")
	(STORY TEXT303)
	(CHOICES CHOICES303)
	(DESTINATIONS <LTABLE STORY402 STORY412>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT304 "You stumble through a door which opens onto a short staircase down and almost tumble into an inviting-looking blue pool. This room looks too big. It is oval and too long to fit inside the tower. Its centre is taken up with a thirty-foot wide pool surrounded with marble and majolica. A waterfall plunges into the pool from out of the wall near the ceiling. If this waterfall has fed this pool for centuries, where has the water conie from and why isn't the pool overflowing? The door that leads on upwards is on the other side of the room.">
<CONSTANT CHOICES304 <LTABLE "walk round the pool to the door" "through the pool to it">>

<ROOM STORY304
	(DESC "304")
	(STORY TEXT304)
	(CHOICES CHOICES304)
	(DESTINATIONS <LTABLE STORY203 STORY216>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT305 "There is a faint whispering sound above and the black shape settles heavily over you. Its skin sports rows of barbed spines that inject a poison into your bloodstream. Try as you might, you can't break free. The poison turns your blood to cloying syrup and your heart stops beating. You have died when revenge for the Judain was almost within your grasp. Hate will subdue all.">

<ROOM STORY305
	(DESC "305")
	(STORY TEXT305)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT306 "Sailing amid a froth of high flitting cloud, the moon casts a thin creamy light down to the narrow streets. You slide from shadow to shadow until you reach Mire Street, where you pause in the lee ofa doorway to take stock of your target. No lamp shows in the windows. On the upper storey, one of the latticed windows overlooking the street has been left ajar. According to the etiquette of your chosen profession, this is tantamount to an effusive invitation. Detaching yourself from the darkness, you make a nimble ascent of the shop front and slither in through the open window. Tiptoeing lightly over a large slumbering guard dog lying across the landing, you quickly reconnoitre the house, discovering three of the Overlord's soldiers on watch in an upstairs room. Surveying them from behind a drape, you notice a small locked treasure chest in an alcove at the back of the room. Without a doubt that is where the diamond is kept.||You bite your lip, sizing up the situation. The three sentries are intent on a dice game, and the flickering lamplight in the room provides ample shadows for concealment, but even so the job will not be easy. With all your dexterous talents, you are not sure that even you could creep past them unnoticed and pick the lock on the chest.">
<CONSTANT CHOICES306 <LTABLE "give it a try" "abandon the attempt and go back to where your comrades are waiting">>

<ROOM STORY306
	(DESC "306")
	(STORY TEXT306)
	(CHOICES CHOICES306)
	(DESTINATIONS <LTABLE STORY391 STORY190>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT307 "You were bound to get taken sometime, using the streets as if they were your own before the resistance has cleared them for you. Two groups of guards have been tracking you and they ambush you in a cul-de-sac. You die in a pool ofblood and there is no one left now to save the Judain. Hate will subdue all.">

<ROOM STORY307
	(DESC "307")
	(STORY TEXT307)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT308 "Clutching the Jewel of Sunset Fire, you marvel at the play of coloured light in its facets.||The climb back down is easier than coming up.">

<ROOM STORY308
	(DESC "308")
	(STORY TEXT308)
	(PRECHOICE STORY308-PRECHOICE)
	(CONTINUE STORY160)
	(ITEM JEWEL-OF-SUNSET-FIRE)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY308-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-SUNSET>
		<DELETE-CODEWORD ,CODEWORD-SUNSET>
	)>>

<CONSTANT TEXT309 "You are looking out over the eastern courtyard where the prisoners are brought daily to exercise but there is no one in sight. The barred windows of the towers at each corner of the quadrangle are all shut. There is no sign of Captain Khmer, the commandant of the prison, or his men. You decide to go deeper into the prison and walk carefully to the opposite tower.||The door creaks open and the familiar cloying smell of Hate assails your nostrils. The silence is oppressive but you wonder why you can't hear the screams of the tormented prisoners. Screwing up your courage you walk on into the inner ring of the fortress. Piles of masonry and strange holes in the ground that lead to lightless pits among the old fortress foundations do nothing to calm your fears.">

<ROOM STORY309
	(DESC "309")
	(STORY TEXT309)
	(CONTINUE STORY280)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT310 "You are in luck. He emerges from the palace about noon, borne in his gilded litter by eight slaves in silk tabards. The escort of heavily armed soldiers would deter any assassin. As the litter progresses slowly down the Avenue ofSilent Glory towards the Greenbark Plaza, some of the soldiers hurry ahead with halberds raised, urging the onlookers to raise a feeble cheer.||Inside the litter, the Overlord is reclining rather more than usual. When he twitches the curtain aside to wave less fulsomely than is his wont his face has the purplish hue of a man stricken by gout and a disease of the blood. His eyes are hooded and lacklustre.||You make your way back to your hidey-hole on Bumble Row and find a messenger waiting for you there, a Judain nipper with big brown eyes. He hands you a note. It is from a girl you used to know, called Lucie. Her name means 'rays of the dawn'. She wants to meet you tomorrow morning. You tell the little messenger you will be at the appointed place at the appointed hour and he scampers off.||It is not worth venturing out again. The streets are deserted as the curfew hour approaches. You settle down to sleep.">
<CONSTANT CHOICES310 <LTABLE "sleep with a sword ready by your side" "tucked the sword under your mattress" "you have no swords">>

<ROOM STORY310
	(DESC "310")
	(STORY TEXT311)
	(CHOICES CHOICES310)
	(DESTINATIONS <LTABLE STORY156 STORY090 STORY007>)
	(REQUIREMENTS <LTABLE <LTABLE SWORD JADE-WARRIORS-SWORD> <LTABLE SWORD JADE-WARRIORS-SWORD> NONE>)
	(TYPES <LTABLE R-ANY R-ANY R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT311 "Grand is as you left it. There are still prisoners clamouring to be set free. You open as many doors as you can, prising the shackles off the poor prisoners, some of whom are too far gone even to be grateful.||Soon you have released a multitude from the prison fortress. A mob of escaped convicts and their cruel guards start fighting outside the fortress walls. You leave them to it. They probably deserve each other. The city has sunk into a desperate state. You could almost imagine you were in hell.||A moment of inspiration lightens your mood, however, as you decide to have the massive chains which support the portcullis of the prison taken out. A sorcerer of ancient times forged those metal links. Perhaps you can use them to tether Hate.">

<ROOM STORY311
	(DESC "311")
	(STORY TEXT311)
	(CONTINUE STORY045)
	(ITEM CHAINS)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT312 "It takes too long for you to concentrate your mind to produce the magical effect of the Visceral Pang. Your preparations are rudely and painfully interrupted by Skakshi's second stiletto dagger which buries its tip in your heart. You fall dead and there is no one left to save the wretched Judain from being wiped out for ever.">

<ROOM STORY312
	(DESC "312")
	(STORY TEXT312)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT313 "You speak the word of power that evokes the potent spell of Visceral Pang. Skakshi is seized by a palsy and he collapses to the sawdust-covered floor, writhing and frothing at the mouth.||\"You, Skakshi, will take me to meet with your guildmaster, Melmelo. I have a proposition to put to him for his ears only.\"||\"I'll do anything, Judain. Anything! Just release me from this wracking spell.\"||You take pity on the miserable wretch and banish the spell with a thought. Skakshi rises slowly to his feet and says he will take you to Melmelo's stronghold, claiming that only he knows the password. Skakshi must fear you are going to kill him.">

<ROOM STORY313
	(DESC "313")
	(STORY TEXT313)
	(CONTINUE STORY181)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT314 "You sing the song of the traveller's return with as jaunty an air as you can muster. The murky waters of the canal ripple and bubble unnervingly as you glide across the surface. You stare through the surface reflection for any signs of the roiling coils of Hate moving below the surface. You turn out onto Grand Canal, where a puffof wind turns the gondola sideways and towards the sea. A flock of seagulls passes overhead and still you have seen no one. Looking ahead of the prow you notice a swelling in the water ahead of you. Something large is on its way towards you.">
<CONSTANT CHOICES314 <LTABLE "jump over the side and swim for shore" "remain in the boat and pole towards the shore" "towards the gargantuan underwater form">>

<ROOM STORY314
	(DESC "314")
	(STORY TEXT314)
	(CHOICES CHOICES314)
	(DESTINATIONS <LTABLE STORY314-SWIM STORY205 STORY251>)
	(TYPES THREE-NONES)
	(FLAGS LIGHTBIT)>

<ROOM STORY314-SWIM
	(DESC "314")
	(EVENTS STORY314-EVENTS)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY314-EVENTS ()
	<COND(<CHECK-SKILL ,SKILL-SEAFARING>
		<RETURN ,STORY344>
	)(ELSE
		<RETURN ,STORY331>
	)>>

<CONSTANT TEXT315 "Dodging the Overlord's soldiers turns what would be an easy walk into a nightmarish series of short hops between patrols. You are continually forced to lie low for long periods until the coast is clear. Not until early evening do you reach the row of crooked houses, long since abandoned and ransacked. They do, however, provide a snug hole in which to lie low. You make yourself as comfortable as possible in the dank cellar of one of the houses, using broken crates to make a rough pallet on which to sleep.||You begin to draw up your plans the next morning. It could be worth watching to see if the Overlord leaves his palace, as you might be able to spot a weak link in his security arrangements.">

<ROOM STORY315
	(DESC "315")
	(STORY TEXT315)
	(CONTINUE STORY310)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT316 "Mameluke's garret is hung with silk prints and tapestries depicting the great cities of the Archipelago and their rulers. There is thick rush matting on the floor and Mameluke would have lit the fire to warm you both, but the smoking chimney would have given you away.||You don't feel well. The sickness is shaking you like a palsy. Your face burns where the ichor ofHate splashed you. Mameluke looks at you with concern in his eyes.">

<ROOM STORY316
	(DESC "316")
	(STORY TEXT316)
	(PRECHOICE STORY316-PRECHOICE)
	(CONTINUE STORY340)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY316-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-VENEFIX ,STORY325>>

<CONSTANT TEXT317 "The invisibility spell works again for you and you quickly duck under the arboretum and back onto the street. Once there you make for Bumble Row as fast as you prudently can. Behind you the soldiers are cursing but they cannot even keep up with Lucie. She knows the dens and dives, the secret ways and ambushes of the city even better than you. You will have to keep an eye out for that little minx.">

<ROOM STORY317
	(DESC "317")
	(STORY TEXT317)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<ROOM STORY318
	(DESC "318")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT319 "You jump to safety, holding one corner of the bedspread, then tug it hard so that the girl slips from the bed and is dragged across the carpet. As soon as the swaddled form touches the filigreed carpet the wires spring forth to entangle themselves in the counterpane. Try as you might you cannot drag her any further.||A large black form, like a manta ray or a vampire's cloak, detaches itself from the underside of the canopy of the Overlord's bed and drifts down through the air towards your head.">
<CONSTANT CHOICES319 <LTABLE "make a run for it and leave the girl" "go back onto the carpet to cut the concubine free">>

<ROOM STORY319
	(DESC "319")
	(STORY TEXT319)
	(CHOICES CHOICES319)
	(DESTINATIONS <LTABLE STORY266 STORY322>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT320 "Your compassion for the wounded and maimed stands you in good stead. Whatever black thoughts have plagued your heart in the past, your noble and good deeds here in the prison fortress of Grond have shown you to be a pure-hearted hero.">

<ROOM STORY320
	(DESC "320")
	(STORY TEXT320)
	(PRECHOICE STORY320-PRECHOICE)
	(CONTINUE STORY159)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY320-PRECHOICE ()
	<COND(,RUN-ONCE
		<COND (<CHECK-CODEWORD ,CODEWORD-VENEFIX>
			<DELETE-CODEWORD ,CODEWORD-VENEFIX>
		)(ELSE
			<GAIN-CODEWORD ,CODEWORD-SATORI>
		)>
	)>>

<CONSTANT TEXT321 "Tyutchev is leading you by the back alleys towards the foreigners' quarter.">
<CONSTANT CHOICES321 <LTABLE "keep following him" "give up and return to your hidey-hole on Bumble Row">>

<ROOM STORY321
	(DESC "321")
	(STORY TEXT321)
	(PRECHOICE STORY321-PRECHOICE)
	(CHOICES CHOICES321)
	(DESTINATIONS <LTABLE STORY198 STORY160>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY321-PRECHOICE ()
	<COND(<AND ,RUN-ONCE <CHECK-SKILL ,SKILL-ROGUERY>>
		<STORY-JUMP ,STORY410>
	)>>

<CONSTANT TEXT322 "As soon as you step onto the carpet the gold and silver filigree threads seem to bunch and tighten beneath the balls of your feet. You take another step and then struggle to make another, but the wires have snared around your ankle. The slender metal thread is cutting into your skin like a cheesewire. Cursing, you drop the concubine and bend to free yourself. It should be easy enough to get free before the wire cuts through your leg.">

<ROOM STORY322
	(DESC "322")
	(STORY TEXT322)
	(CONTINUE STORY305)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT323 "Call as loud as you like for Hate has no ears with which to hears the cries of the tormented. Your cries do attract two rowing boats, however, which glide out from the granary wharf and are soon overtaking you. They are probably pirates so you pole rapidly towards the bank and decide to descend into the catacombs to seek Hate there.">
<CONSTANT CHOICES323 <LTABLE "enter the crypts of the Megiddo dynasty" "ascend through the cellars of the Overlord's palace">>

<ROOM STORY323
	(DESC "323")
	(STORY TEXT323)
	(CHOICES CHOICES323)
	(DESTINATIONS <LTABLE STORY365 STORY339>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT324 "\"No, I will not place myself in danger. I would be a fool to do so.\"||\"Don't you trust me?\" Lucie looks shocked and hurt. \"I've been doing my best to help you and now you won't trust me.\"||\"Lucie ...\" You reach out to touch her, but she spits at you and runs off. Bewildered at her strange behaviour, you return to Bumble Row.">

<ROOM STORY324
	(DESC "324")
	(STORY TEXT324)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT325 "Hate has nourished itself on your evil thoughts of murder and revenge. You are ready now, a soul already lost. Tonight you will walk open-armed into the sickly embrace of Hate and give yourself up for ever, sucked into Hate's orgy of despair. There is no one left to save your fellow Judain. Hate will conquer all.">

<ROOM STORY325
	(DESC "325")
	(STORY TEXT325)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT326 "As soon as you order the retreat, panic breaks out. By the time you have restored some semblance of order and discipline all the barricades have been smashed. Barricades are of no use against the monster. Your only hope is to kill it. This is the moment of truth. Triumph or perish. Dusk begins to fill the streets. Only the decaying spires of the cathedrals still catch the golden glint of daylight. This may be the last sunset you will ever see, as the great rolling bulk of Hate comes slithering through the canals and streets towards you.||Hate extrudes a tentacle. In the pits of its green eyes, a flicker of intelligence shows. It recognizes you as its foe. A beam of shimmering mauve light shines down on you as the monster unleashes its magic.">

<ROOM STORY326
	(DESC "326")
	(STORY TEXT326)
	(PRECHOICE STORY326-PRECHOICE)
	(CONTINUE STORY274)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY326-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-VENEFIX ,STORY399>>

<CONSTANT TEXT327 "You arrive back at the jeweller's house in the dead of night. Clouds cover the moon like grave soil on the face of a corpse. Underfoot, the cobblestones glisten blackly. A cat prowls in the shadows across the street, making barely less noise than you. You have always prided yourself on your stealth and cool nerve, but more useful than either of these is your mastery of magic. For tonight's work, your normal humdrum repertoire of charms will not suffice; you dredge your memory for a more arcane enchantment. Murmuring an antique rhyme, you work a charm that will keep all the house's occupants asleep by making their dreams more vivid than reality itself. Even an earthquake could not rouse them before dawn. Confident that nothing can go wrong now, you force the front and enter.||The interior of the shop is dark. You see no reason not to light the lamps; it will make your job easier, and any passer-by would just assume the jeweller is working late. A hasty but thorough search of the shop reveals no sign of the diamond, but that is only to be expected. Probably it is kept in a , treasure chest. Stepping over a slumbering guard dog, you start up the stairs.||A floorboard creaks on the landing above. Startled, you look up to see a young soldier in the uniform of the Overlord's troop standing there. His face is ashen with fright, but he musters a brave semblance of self-assurance as he calls: 'You there! You're under arrest!'">
<CONSTANT CHOICES327 <LTABLE "advance up the stairs to attack him" "run out of the shop and go back to join your friends">>

<ROOM STORY327
	(DESC "327")
	(STORY TEXT327)
	(CHOICES CHOICES327)
	(DESTINATIONS <LTABLE STORY176 STORY190>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT328 "Tyutchev is one of the greatest living warriors. His sword has drunk the blood of scores of unfortunates who crossed him, or perhaps just admitted to worshipping the wrong god. There is a gleam ofpleasure in his cruel eyes as he hefts his sword in one hand. You can be sure he will grant you no mercy, if he bests you.||His weapon is almost two feet longer than your blade and his reach is immense.">
<CONSTANT CHOICES328 <LTABLE "try to get in close" "warily keep your distance and try to parry his first blow">>

<ROOM STORY328
	(DESC "328")
	(STORY TEXT328)
	(CHOICES CHOICES328)
	(DESTINATIONS <LTABLE STORY338 STORY363>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT329 "The stinking latrine offers no escape but a very high window up near the ceiling.">

<ROOM STORY329
	(DESC "329")
	(STORY TEXT329)
	(PRECHOICE STORY329-PRECHOICE)
	(CONTINUE STORY342)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY329-PRECHOICE ()
	<SKILL-JUMP ,SKILL-AGILITY ,STORY368>>

<CONSTANT TEXT330 "You manage to find a few hours' sleep, balm to your troubled spirit though you awake cold and stiff, at dawn. There is a weariness which numbs your soul but then adversity is said to bring out the best in people. The sun is shining and reflected off the millpond calm surface of the canals. You slink carefully along back alleyways to the rendezvous. By the time you are nearing Fortuny Street the wind has picked up, whipping the stench of death away from the city and bringing with it hope for renewal. Small waves lap at the canal walls.||Lucie is waiting just as she said she would, under the eaves of the tax collector's offices on Rackman Row. She smiles to see you, looking well, her cheeks are rosy red and she is as pretty as ever. She links her arm in yours and says she has something to show you. You walk beside her, enjoying a moment's peace from the burden of trying to save your people. She does have news for you.||\"All is not well with the Overlord. He is being consumed by Hate like so many of his subjects. His concubine, Venus, has the marks of Hate on her body, yet still he lies with her. He has become morose and listless. Venus's handmaid told me all this. There is something terrible amiss at the palace. What will become of us if our leaders are falling into the embrace of the coils of Hate. How shall we be saved?\"||\"I will save you, Lucie. Does the concubine's handmaid know why the Overlord ordered the purging of my people?\"||\"He needed scapegoats so the wrath of the people could be deflected from him and his corrupt courtiers. The Judain have always made good scapegoats. Sorry, I didn't mean ...\" She puts her hand on your shoulder to show she likes you.||\"It doesn't matter, we Judain brave the slings and arrows of outrageous fortune by habit. We are inured to the hatred of others.\"||Lucie runs her hand over your chest.">

<ROOM STORY330
	(DESC "330")
	(STORY TEXT330)
	(CONTINUE STORY345)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT331 "You founder in the polluted waters of the Grand Canal. Like most people who live in Godorno, within a stone's throw of the water, you can't swim. Your life passes before you as you drown. There is no one left to save the Judain. Hate will conquer all.">

<ROOM STORY331
	(DESC "331")
	(STORY TEXT331)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT332 "It is eerily silent down in the dank bones of the fortress. Hanging your lantern outside the nearest door reveals a starving pair of Judain, manacled to the wall. It takes three hours to set all the prisoners free. Most are pathetically grateful to you as their saviour, having long given up hope of any release save the merciful release of death. The prisoners are looking at you with awe. You hear them whispering that you are a god come down from the heavens to right the wrongs of the ancient city. You organize stretcher parties to bear those who cannot walk out of the prison. You might dare to set up a sanatorium now that you have directly challenged the Overlord's
power.">

<ROOM STORY332
	(DESC "332")
	(STORY TEXT332)
	(CONTINUE STORY320)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT333 "\"I am one of the Overlord's paid informers,\" you shout with a commanding air. \"Follow me, I will take you to the nests of the Judain scum. Follow me.\" You turn your back and set out towards the fruit market. \"Come, I will show where three Judain spies and embezzlers are hiding out.\"||The mob follow eagerly, crying for Judain blood. One of them asks how they are to know you are the Overlord's informer. You start to run, calling: \"Hurry or we may be too late. Ifword reaches them before us they will flee the roost.\"||You run fast and the others can hardly keep up. Entering the fruit market you dive into a throng of people who are picking over a mound of rotting fruit that has been piled at the side of the road. As you make your escape into a narrow side-street, you hear the crowd calling for your blood.">
<CONSTANT CHOICES333 <LTABLE "leave by the usual means, the main gate to the trade road" "try to slip from the city unseen">>

<ROOM STORY333
	(DESC "333")
	(STORY TEXT333)
	(CHOICES CHOICES333)
	(DESTINATIONS <LTABLE STORY053 STORY070>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT334 "You find Skakshi at the Inn of the Inner Temple, occupying his usual booth. But now he has a morose look, and the bluster has gone out of him. \"You still want to meet Melmelo?\" he asks.||\"You've changed your tune, Skakshi.\"||He drains his mug and gets up. \"The city's changed. Now the Overlord has ordered the rounding-up of all foreigners. My sister-in law is from Kishtaria. Did you know that, Judain?\"||\"I didn't. But soon the Overlord's measures will become still harsher. I'm glad you've seen reason, Skakshi.\"||He takes you by narrow back streets to an ornamental villa on the edge of the criminal dens of the poor quarter. The villa itself is quite lavish, in contrast to the hovels nearby. Melmelo is the king of this dungheap, all right. Thanking Skakshi, you watch him slip away into the shadows before knocking on the door.">

<ROOM STORY334
	(DESC "334")
	(STORY TEXT334)
	(PRECHOICE STORY334-PRECHOICE)
	(CONTINUE STORY012)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY334-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-COOL>
		<DELETE-CODEWORD ,CODEWORD-VENEFIX>
	)>>

<CONSTANT TEXT335 "Your mighty struggles are in vain. You are not ready for this untimely death. There is no one left now to save your people.||Memories of the times you have felt Hate smoulder in your breast come unbidden into your mind and the strength seems to drain out of your muscles. The warm wet embrace of Hate welcomes you and your body is slowly and inexorably drawn inch by inch into the seething mass of the monster. Soon your head too is being drawn in. Your arms and legs have gone numb and you start to fight for breath as your nostrils and lips are sealed over by the soft purple flesh of Hate. You drown in the body of Hate and the city has lost its only saviour. Your tormented half-life has begun.">

<ROOM STORY335
	(DESC "335")
	(STORY TEXT335)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT336 "Lucie slaps you back and flounces away, back to her little hovel. She is a very headstrong young woman. There is no point in trying to follow her now, she knows at least as much as you do about the alleyways and dens of Godomo. You decide to ask your mulatto friend, Mameluke, to help you.||Mameluke greets you warmly. He is preparing to eat a cat which he has skinned and roasted over a slow fire; he offers to share it with you. Famished, you thank him and eat greedily while trying not to think of the rats the cat has itself dined upon in the past, in the fouled gutters of the city.||Mameluke insists on telling you about a mishap which befell him this morning: \"In going, about three hours ago, to a rendezvous with a girl of Godorno -- unmarried and a daughter to one of the nobles -- I tumbled into the Grand Canal, my foot slipping as I got out of my gondola owing to the cursed slippery steps of the palaces here. In I flounced like a carp, and went dripping like a Triton to my Sea Nymph and had to scramble up to a grated window -- 'fenced with iron within and without, lest the lover get in or the lady get out'.\"||Mameluke is in a whimsical mood. You are reminded of the man who sat around fiddling while the city burned. Nevertheless you implore him to help you for the sake of your people.||\"I will help you, my friend,\" he says, \"if only to rid myself of the wailing of the prisoners, which is a constant affront to my sanity. What is your plan?\"||\"I thought we'd descend into the catacombs below the city,\" you reply. \"There we can look for a way into the prison.\"">

<ROOM STORY336
	(DESC "336")
	(STORY TEXT336)
	(CONTINUE STORY412)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT337 "You could go to find the jewel that Melmelo spoke of, somewhere in the Tower of the Sentinel.">
<CONSTANT CHOICES337 <LTABLE "look for the jewel" "decide against that course of action for the present">>

<ROOM STORY337
	(DESC "337")
	(STORY TEXT337)
	(CHOICES CHOICES337)
	(DESTINATIONS <LTABLE STORY144 STORY100>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT338 "You move in close to seize the initiative. Tyutchev falls back into the comer of the tavern, where he is cramped by the low ceiling. He cannot make a powerful overhead swing without catching his long sword against the rafters. He has fought in these conditions before, however, and you can do no more than hold your own. You might be able to get past his blurred sword tip if you are fast enough, but for a big man he moves very quickly. You wound him but only at the expense of a nasty cut to your side.">
<CONSTANT TEXT338-CONTINUED "The grimace of pain on Tyutchev's pale face is quickly replaced by one of cold fighting rage. You sense that you cannot best this man unless you can slip your sword point past his guard.">
<CONSTANT CHOICES338 <LTABLE "use" "use" "fight on" "turn and flee">>

<ROOM STORY338
	(DESC "338")
	(STORY TEXT338)
	(PRECHOICE STORY338-PRECHOICE)
	(CHOICES CHOICES338)
	(DESTINATIONS <LTABLE STORY367 STORY367 STORY377 STORY199>)
	(REQUIREMENTS <LTABLE SKILL-AGILITY SKILL-SWORDPLAY NONE NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE R-NONE>)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY338-PRECHOICE ()
	<COND(,RUN-ONCE
		<TEST-MORTALITY 2 ,DIED-FROM-INJURIES ,STORY338>
		<IF-ALIVE ,TEXT338-CONTINUED>
	)>>

<CONSTANT TEXT339 "As far as you know no one who has desecrated the tombs of the Megiddo dynasty has ever come back out of the catacombs. You resolve to be very careful. It is said that four tomb robbers of the Savanorola years did escape but that they had been turned into foul-smelling scarab beetles, which were eaten alive by pigs.">

<ROOM STORY339
	(DESC "339")
	(STORY TEXT339)
	(CONTINUE STORY409)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT340 "Hate is trying to claim you for its own. Your vision blurs and your head aches. You close your eyes and all you can see is the staring green pools of Hate's eyes. Hate is searching your soul for evil thoughts but you pass the te,st. You lie back as Hate leaves you to search for another lost soul and the fever passes.||Mameluke mops your brow with a moist sponge. You gratefully accept his offer of a couch for the night and wake up feeling a little refreshed, though the cries of Grond's tortured damned still sicken.||Thanking Mameluke for his help, you return to your hideout on Bumble Row.">

<ROOM STORY340
	(DESC "340")
	(STORY TEXT340)
	(PRECHOICE STORY340-PRECHOICE)
	(CONTINUE STORY159)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY340-PRECHOICE ()
	<COND(,RUN-ONCE <GAIN-LIFE 2>)>>

<CONSTANT TEXT341 "Did you think you could frighten five hundred guards inside a huge fortress with ten-foot thick walls that stand forty feet high into letting you in among them? They have only one reply to such a hideous apparition as you have conjured: they shoot you with their crossbows from the arrow slits on either side and above the gates. You are peppered like a pincushion. As you die and the magic fades there is a low heartless cheer as the guards realize they have slaughtered yet another Judain. There is no hero left now to save the city. Hate will subdue all.">

<ROOM STORY341
	(DESC "341")
	(STORY TEXT341)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT342 "You are taken under arrest to the prison fortress of Grond. The courtyard is thronged with captive Judain. More are being brought in all the time. Without a chance to say who you are, or to pretend loyalty to the Overlord, they force you into underground cellars where, in the cramped dark, you fight to breathe. When the air is gone the weight of dead people pressing on you cannot be borne. You have no choice but to give up your spirit as the rest of your people have already.">

<ROOM STORY342
	(DESC "342")
	(STORY TEXT342)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT343 "You are pure of heart and so manage to break free as two tentacles snap forth from Hate's coils and try to drag you into the soft cloying flesh of the monster. You turn tail and flee up the stairway and out into the street where the fresher air makes your senses swim. You will have to abandon Lucie. She is already a lost soul. You slink back towards your hidey-hole on Bumble Row to ponder your next actions.">

<ROOM STORY343
	(DESC "343")
	(STORY TEXT343)
	(CONTINUE STORY195)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT344 "You strike out bravely for the nearest bank. Unlike most of the folk of Godorno, who pass their whole lives within a stone's throw of the water, you can swim quite strongly. Behind you there is a splash as the gilded gondola is moved by something large, and then the snort of an ugly but harmless sea cow. You have swum too far to turn back now so you swim on and soon gain the bank. You haul yourselfout of the murky canal and sit on the road to dry in the midday sun. Soon you have the uneasy feeling of being watched.">

<ROOM STORY344
	(DESC "344")
	(STORY TEXT344)
	(CONTINUE STORY374)
	(FLAGS LIGHTBIT)>

<ROOM STORY345
	(DESC "345")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT346 "Lucie smirks coquettishly as you tell her offand says, \"Well, it's true. Hate take them all and good riddance to bad rubbish.\"||You sigh, knowing you will never change her. You suspect that at least one of the criminal inmates of Grond must have done something dreadful to her before his imprisonment.||\"Surely there must be something you can do?\" you ask. \"Don't you know any of the guards?\"||\"I suppose I do, one or two. There's Captain Khmer in the east tower. He oversees the towngate and the eastern courtyard. I could smuggle you in there.\"">
<CONSTANT CHOICES346 <LTABLE "go along with Lucie's plan to smuggle you into the prison fortress of Grond" "thank Lucie but decline her brave offer of help" "consult your amulet">>

<ROOM STORY346
	(DESC "346")
	(STORY TEXT346)
	(CHOICES CHOICES346)
	(DESTINATIONS <LTABLE STORY354 STORY366 STORY388>)
	(REQUIREMENTS <LTABLE NONE NONE SKILL-CHARMS>)
	(TYPES <LTABLE R-NONE R-NONE R-SKILL>)
	(FLAGS LIGHTBIT)>

<ROOM STORY347
	(DESC "347")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT348 "The slaughter is swift and bloody. The look of disgust in the eyes of your fellow Judain when it is over and there are only the moans of the dying is eloquent testimony that revenge is a bitter fruit. How could you have let your people commit such barbaric atrocities? Delete the codeword Satori if you have it.||It is time to return to your secret bolthole and rest.">

<ROOM STORY348
	(DESC "348")
	(STORY TEXT348)
	(PRECHOICE STORY348-PRECHOICE)
	(CONTINUE STORY159)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY348-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-SATORI>
		<DELETE-CODEWORD ,CODEWORD-SATORI>
	)>>

<ROOM STORY349
	(DESC "349")
	(STORY TEXT)
	(EVENTS NONE)
	(PRECHOICE NONE)
	(CHOICES NONE)
	(DESTINATIONS NONE)
	(REQUIREMENTS NONE)
	(TYPES NONE)
	(CONTINUE NONE)
	(ITEM NONE)
	(CODEWORD NONE)
	(COST 0)
	(DEATH F)
	(VICTORY F)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT350 "You have dared to wait in the lion's den for too long. The Overlord's personal bodyguard are led by a magician who binds your feet to the spot as soon as he sets eyes on you. You are borne away to be tormented in the fortress of Grond. You will not survive. There is no one left now to save the Judain. Hate will conquer all.">

<ROOM STORY350
	(DESC "350")
	(STORY TEXT350)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT351 "Lucie watches as Tyutchev's blade chops into you as though you were already dead meat. It is indeed butchery and it takes Tyutchev only a few moments more to finish you off. He isn't even wounded. You have fought one of the greatest living swordsmen and you don't live to tell the tale. Now there is no one left to save the Judain.">

<ROOM STORY351
	(DESC "351")
	(STORY TEXT351)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT352 "When you reach the new breach iri the sea wall you find it choked with decaying bodies, almost as if Hate had voided itself into the sea. But they do not show the purple blotches of Hate's contagion. Something or someone else has piled these bodies here. Sickened by the stench you decide to find a different path.">

<ROOM STORY352
	(DESC "352")
	(STORY TEXT352)
	(CONTINUE STORY262)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT353 "The barricade is composed of pews from the nearest temple, doors stripped from nearby deserted houses, flagstones and carts. The carts have been laden with mud. Even an elephant could not break through.||The blockage is ten feet high and in places a parapet has been built on the defenders' side from which potshots can be taken at the Overlord's city guards as they advance. You have archers in the windows and on the roofs of the houses on either side of the barricade. Morale is high, the stories of how you killed scores of guards in the prison fortress of Grond have placed you high in the esteem of your people.||You are conferring with the captain of the archers stationed in the houses when everyone suddenly goes quiet. They are all staring down the cracked road towards the Grand Canal from which Hate is raising its dripping baleful-eyed face. Its feelers quest in the air for your scent and it rises out of the canal, smashing houses on either side as it comes. The barricade is proof against a stampede of elephants but not against Hate itself">
<CONSTANT CHOICES353 <LTABLE "order a tactical withdrawal" "stand at the barricade and defy the monster">>

<ROOM STORY353
	(DESC "353")
	(STORY TEXT353)
	(CHOICES CHOICES353)
	(DESTINATIONS <LTABLE STORY326 STORY233>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT354 "You wait in the bakery adjacent to the prison while Lucie goes in search of Captain Khmer. It is a long wait, but at least there is fresh bread to eat and the bakers and scullions will not give you away. They seem to be firm friends with Lucie. You have plenty of time to wonder how she binds people to her. These peasants are taking a terrible risk sheltering you under their roof.||At last Lucie comes back. She looks troubled.but says, \"I've arranged things for you. Walk up to the towngate in five minutes' time. They will open up and let you through. They won't harm you, but from then on you are on your own. I think something has gone terribly wrong in there. It wasn't easy to arrange. Don't waste my efforts in failure, Judain.\" She looks at you reproachfully. Mameluke is purple with embarrassment.||\"I'm going to the Silver Eel. Come to me there and tell me how you fared.\" With that and a little squeeze of the shoulder she is gone.">
<CONSTANT CHOICES354 <LTABLE "wait five minutes and then knock at the towngate of the prison fortress of Grond" "slink off back to Bumble Row">>

<ROOM STORY354
	(DESC "354")
	(STORY TEXT354)
	(CHOICES CHOICES354)
	(DESTINATIONS <LTABLE STORY413 STORY220>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT355 "You arrive back at the jeweller's house later that night and stand surveying it in the moonlight. Your overwhelming impression is that this has all the hallmarks of a trap. The Overlord would hardly leave a priceless diamond unguarded -- and he must be aware that his security measures, while enough to deter the casual thieves of the town, are simply an enticement to the pride of any true professional. So without a doubt there will be soldiers stationed in the house.||Climbing up to the first floor, you prise open a window and tiptoe along the landing, listening at each door in turn. Sure enough, from behind one of the doors comes the rattle of gaming dice and the unmistakable banter of bored soldiers. You pause. This is where the diamond must be kept.||Continuing along the landing .to the next door, you hear the sound ofthundering snores. The jeweller's bedroom. Quietly inching the door open, you go to a cupboard and extract a nightshirt and cap, which you put on over your clothes. Then, darting swiftly along the landing, you fling open the first door and cry: \"Thief! There's a thief downstairs!\"||The three soldiers leap up in amazement and grab their weapons, rushing past you along the anding with excited shouts. They are so intent on catching the thief -- and thereby earning a bonus -- that they don't even glance at your face.||You tear off the nightshirt and look around the room. A small locked chest catches yo.ur eye. Surely that is where the diamond is. The lock looks pretty secure, but you can break it at your leisure once you are safely away from here. You pick up the chest, tucking it under your arm for a hasty getaway, but then an unpleasant shadow of doubt clouds your elation: what if the chest is only a decoy, and the diamond is really kept somewhere else?">
<CONSTANT CHOICES355 <LTABLE "leave at once with the chest" "first open it and make sure you have the diamond">>

<ROOM STORY355
	(DESC "355")
	(STORY TEXT355)
	(CHOICES CHOICES355)
	(DESTINATIONS <LTABLE STORY358 STORY394>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT356 "Melmelo's door is opened by his majordomo, a grizzled old man with a wooden leg, who growls, \"Get you gone, vile Skakshi, or you'll not live to see the dawn.\"||\"What's this I hear about Hammer being hired to kill me?\" says Skakshi, ignoring his threat. \"I didn't know Melmelo feared me so strongly.\"||\"You're beneath the notice of a man with Melmelo's wit and accomplishments. Melmelo wouldn't waste money on that greedy cutthroat Hammer over the likes of you, Skakshi.\"||\"Do I have your word on that, pegleg?\"||The majordomo fixes him with an incandescent stare. \"Be off with you.\"||Skakshi seems satisfied but as he goes he calls back over his shoulder, \"It was a judain scumbag told me Hammer was after me. Look out, you know what slippery customers the Judain are.\" He and the majordomo both hawk and spit into the gutter at the mention of the word Judain.||You wait till Skakshi has turned the corner out of sight before knocking on the door, not too loud and not too timid.">

<ROOM STORY356
	(DESC "356")
	(STORY TEXT356)
	(CONTINUE STORY012)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT357 "As you square up to the cunning thief, he sends his throwing knife spinning end over end through the air towards your heart. Absolute quiet descends on the tavern as your life hangs in the balance.">

<ROOM STORY357
	(DESC "357")
	(STORY TEXT357)
	(PRECHOICE STORY357-PRECHOICE)
	(CONTINUE STORY108)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY357-PRECHOICE ()
	<SKILL-JUMP ,SKILL-AGILITY ,STORY058>>

<CONSTANT TEXT358 "Only when you have put a safe distance between you and Mire Street do you pause to inspect the diamond. It is as large as a walnut, and sparkles like a drop of crystallized starlight. The beauty takes your breath away and you have seen some excellent gems in your time. It would have made a fine sceptre for the Overlord, but you'll put it to more practical use. Dropping the diamond into your pocket you go to fence it.">

<ROOM STORY358
	(DESC "358")
	(STORY TEXT358)
	(PRECHOICE STORY358-PRECHOICE)
	(CONTINUE STORY128)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY358-PRECHOICE ()
	<COND(,RUN-ONCE
		<GAIN-ITEM ,DIAMOND>
		<SKILL-JUMP ,SKILL-STREETWISE ,STORY114>
	)>>

<CONSTANT TEXT359 "The Judain are horrified at your suggestion they take the lepers in. Many of the unfortunates are suffering from wet leprosy, which is highly contagious. Your own people shun you for fear of catching the curse.||Those who say the Judain are attracting too much attention to themselves with their campaign of assassinations win the vote in the general council of Judain. The resistance cells are disbanded. This will make it harder to get around the city, as before you could rely on the resistance for help.||It grieves you that you are unable to help the lepers. They go on their way, staggering about town, begging for scraps, fighting the dogs for any scraps of offal they can find in the gutter.">

<ROOM STORY359
	(DESC "359")
	(STORY TEXT359)
	(PRECHOICE STORY359-PRECHOICE)
	(CONTINUE STORY020)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY359-PRECHOICE ()
	<COND (<CHECK-CODEWORD ,CODEWORD-VENEFIX>
		<DELETE-CODEWORD ,CODEWORD-VENEFIX>
	)(ELSE
		<GAIN-CODEWORD ,CODEWORD-SATORI>
	)>>

<CONSTANT TEXT360 "With great care, you crawl down into the basement. There is an unpleasant smell of honeysuckle and camphor. A glimmer of light filtering through the broken ceiling illuminates Lucie. She is too ill even to move from her bed. Her features are wan; the light in the room gives her a bluish look and her eyes are sunken slightly, ringed with dark circles of fatigue. She looks like a little lost soul.||She calls your name. Her arm falls limp after she beckons you to her side. \"Leave me. Go quickly. It is too late for me, but you can Still save yourself. Don't let me die in vain.\"||\"Lucie ...\" You take another step towards the bed.||\"No, don't come close!\" she gasps. \"Go now, while you still can.\"">
<CONSTANT CHOICES360 <LTABLE "do as Lucie implores" "kneel at her side to comfort her">>

<ROOM STORY360
	(DESC "360")
	(STORY TEXT360)
	(PRECHOICE STORY360-PRECHOICE)
	(CHOICES CHOICES360)
	(DESTINATIONS <LTABLE STORY387 STORY273>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY360-PRECHOICE ()
	<COND(,RUN-ONCE
		<COND (<CHECK-CODEWORD ,CODEWORD-VENEFIX>
			<DELETE-CODEWORD ,CODEWORD-VENEFIX>
		)(ELSE
			<GAIN-CODEWORD ,CODEWORD-SATORI>
		)>
	)>>

<CONSTANT TEXT361 "You cast the spell and hail the guards behind the grilles in the gate. They do not answer and you are beginning to think your magic has missed its mark when there is a great clanking and grinding and the gates start to inch apart. It is a great labour to open them with the iron machinery forged by smiths from the mountains and you call out hearty thanks, as if to long-lost friends, but there is no one to answer your call. It is as if the gate was opened by ghosts. The sweet cloying smell of crushed roses and honeysuckle lingers here. Something is terribly wrong.">

<ROOM STORY361
	(DESC "361")
	(STORY TEXT361)
	(CONTINUE STORY413)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT362 "Speaking the word of power and clapping your hands vigorously brings forth a cloud of poisonous gas which smothers the guards and the old egg-seller. You leave them coughing and Tetching and set out into the once bustling city.">

<ROOM STORY362
	(DESC "362")
	(STORY TEXT362)
	(CONTINUE STORY300)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT363 "Tyutchev's sword lashes out, smashing your parry aside. The blade cuts into your breast just above the heart. Luckily yourjerkin absorbs some ofthe impact and the blow does not penetrate the muscle. Even so, it is very painful.">
<CONSTANT TEXT363-CONTINUED "Lucie suddenly says, \"Spare the Judain, Tyutchev, for me. The Overlord's men will do for the poor wretch soon anyway.\"||\"If it makes you happy.\" Tyutchev shrugs and carefully slides his sword back into the scabbard strapped to his back. \"What's the Judain to you?\"||\"A hero, valiant and true. The one that the Judain have put their faith in to save them.\"||\"I didn't know you had added such undesirables to your list of lovers,\" he says, giving you a sneering sidelong look.||\"We had a meeting arranged but we were disturbed,\" says Lucie. \"I wish to speak with the Judain. Leave us, please, Tyutchev.\"||\"As you wish, girl. Will you come to my abode this evening?\"||\"Will Cassandra be there?\"||\"No. She took ship for Aleppo on the rising tide. We'll be alone.\" So saying he turns on his heel, his black cloak flaring out like a sail, and walks out of the Silver Eel in five great strides.||Lucie touches your sleeve. \"Come, my friend, join me.">
<CONSTANT CHOICES363 <LTABLE "sit with her" "follow Tyutchev" "bid Lucie farewell and leave">>

<ROOM STORY363
	(DESC "363")
	(STORY TEXT363)
	(PRECHOICE STORY363-PRECHOICE)
	(CHOICES CHOICES363)
	(DESTINATIONS <LTABLE STORY403 STORY321 STORY199>)
	(TYPES THREE-NONES)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY363-PRECHOICE ()
	<COND(,RUN-ONCE
		<TEST-MORTALITY 4 ,DIED-FROM-INJURIES ,STORY363>
		<IF-ALIVE ,TEXT363-CONTINUED>
	)>>

<CONSTANT TEXT364 "Hate squirms and writhes, shaking the city like an earthquake. The people creep out of hiding to pelt it with every missile they can find, but there seems to be no way of killing the monster. At length it tears itself free and slithers off. Its mighty efforts have undermined the plaza, which now collapses into the river. The facade of the Bargello topples and you plummet to your death in a cascade of falling masonry.||The city crumbles and is lost for ever beneath the waves. Hate has completed its work.">

<ROOM STORY364
	(DESC "364")
	(STORY TEXT364)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT365 "The tunnels take you deeper and deeper into the bones of ancient Godorno. At last you stumble through a rotten tapestry into a chamber filled with gold-plated furniture and funeral biers with sarcophagi atop them. Four glassy green statues stand at the corners of the room.||The four Jade Warriors clank menacingly as they come to life before you. The green swords in their hands cut the beams of light, giving each blade an aura like a rainbow. The light shimmers off the · jagged blades and off the chiselled planes of the huge warriors themselves. When they step towards you, their heavy tread grinds the rubble beneath their armoured feet to powder. The whole room reverberates to their measured advance.">
<CONSTANT TEXT365-CONTINUED "You realize you must flee.">
<CONSTANT TEXT365-JADE-WARRIOR "The nearest Jade Warrior slashes you.">
<CONSTANT CHOICES365 <LTABLE "do battle" "fight them" "cast Encloud" "cast Rulership" "cast Bafflement" "cast Vanish" "fall back on" "use a">>

<ROOM STORY365
	(DESC "365")
	(STORY TEXT365)
	(PRECHOICE STORY365-PRECHOICE)
	(CHOICES CHOICES365)
	(DESTINATIONS <LTABLE STORY389 STORY296 STORY042 STORY066 STORY096 STORY102 STORY277 STORY204>)
	(REQUIREMENTS <LTABLE SKILL-SWORDPLAY SKILL-UNARMED-COMBAT SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS SKILL-SPELLS SKILL-AGILITY CENSER-OF-FRAGRANT-INCENSE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-SKILL R-SKILL R-SKILL R-SKILL R-SKILL R-ITEM>)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY365-PRECHOICE ()
	<COND(,RUN-ONCE
		<COND(<OR <CHECK-SKILL ,SKILL-SWORDPLAY> <CHECK-SKILL ,SKILL-UNARMED-COMBAT> <CHECK-SKILL ,SKILL-SPELLS> <CHECK-SKILL ,SKILL-AGILITY> <CHECK-ITEM ,CENSER-OF-FRAGRANT-INCENSE>>
			<PREVENT-DEATH ,STORY365>
		)(ELSE
			<IF-ALIVE ,TEXT365-JADE-WARRIOR>
			<TEST-MORTALITY 6 ,DIED-FROM-INJURIES ,STORY365>
			<COND(<IS-ALIVE>
				<IF-ALIVE ,TEXT365-CONTINUED>
				<STORY-JUMP ,STORY016>
			)>
		)>
	)>>

<CONSTANT TEXT366 "You drop in on your friend Mameluke, a man of far-off Tartary. He listens to your plans to enter Grond through the catacombs beneath the city, then shakes his head.">

<ROOM STORY366
	(DESC "366")
	(STORY TEXT366)
	(CONTINUE STORY412)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT367 "Only a very agile fighter like yourself could slip past the mesmerizing point of Tyutchev's sword as it whistles through the air in deadly arcs. You crouch and spring forward, then lunge your sword into the gap in his armour, beneath his armpit. There is a satisfying groan from Tyutchev who staggers back and looks on you with new respect. But he is not beaten yet.">
<CONSTANT CHOICES367 <LTABLE "call on him to put down his sword, saying that senseless slaughter serves no purpose" "fight on">>

<ROOM STORY367
	(DESC "367")
	(STORY TEXT367)
	(CHOICES CHOICES367)
	(DESTINATIONS <LTABLE STORY397 STORY373>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT368 "You leap high and brace yourself against the corner walls, edging your way up to the window as they call for you to stop skulking in the privy like a criminal. By the time they risk following you into the cramped confines of the privy you have reached the window and dropped down through it into an alley below. You get away before they can run round to the back alley.||Listening to the bloodcurdling yells of a mob that seems to be rampaging back and forth across the city you decide the time has come to leave Godorno.">
<CONSTANT CHOICES368 <LTABLE "do so by the usual means, the main gate to the trade road" "try to slip from the city unseen">>

<ROOM STORY368
	(DESC "368")
	(STORY TEXT368)
	(CHOICES CHOICES368)
	(DESTINATIONS <LTABLE STORY053 STORY070>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT369 "This is not the first time in your life you have had to escape from an angry mob. You turn down a side street and, seeing an open door, sneak into a house. The inhabitants are having supper and shouting at each other. You creep quietly upstairs, unnoticed, out onto a balcony from which you jump to the balcony of the house opposite. Creeping out through that house you rejoin another street and double back onto your old route to shake off your pursuers.">

<ROOM STORY369
	(DESC "369")
	(STORY TEXT369)
	(CONTINUE STORY201)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT370 "Using the flat of your blade reduces the viscous purple flesh of the monster to a jelly. Several of the guards are now able to pull themselves out of the body of Hate as it recoils from your punishing blows. Those still trapped implore their comrades to stay and free them, but not one of those you have rescued is prepared to risk his life for his friends. Eyes wide with terror, they bolt past you.">

<ROOM STORY370
	(DESC "370")
	(STORY TEXT370)
	(CONTINUE STORY034)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT371 "Finding Lucie later in the day is easy. It turns out she has also been looking for you. \"Come!\" she says, tugging you by the sleeve. Her tone is urgent and breathless. \"I have someone important for you to meet. Someone who can help you to save your people. No friend of the Overlord, this man.\"||\"Who is it? Who in all Godorno will help us Judain?\"||\"You wouldn't believe me if I told you,\" she replies.||\"Of course I would, Lucie, I believe every word you say.\"||\"You'll see soon enough. Come, we must go to Fortuny Street. We can meet him there.\"">
<CONSTANT CHOICES371 <LTABLE "put your trust in Lucie" "refuse to go with her in case she is leading you into a trap">>

<ROOM STORY371
	(DESC "371")
	(STORY TEXT371)
	(PRECHOICE STORY371-PRECHOICE)
	(CHOICES CHOICES371)
	(DESTINATIONS <LTABLE STORY411 STORY324>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY371-PRECHOICE ()
	<COND(<AND ,RUN-ONCE <OR <CHECK-SKILL ,SKILL-CUNNING> <CHECK-SKILL ,SKILL-STREETWISE>>
		<STORY-JUMP ,STORY407>
	>)>>

<CONSTANT TEXT372 "To your horror your spell backfires, singeing your eyebrows. Before you can recover the guards, who know better than to allow a magician time to cast a second spell, run you through with their rapiers, while the old woman screams with the shock of it. There is no one left alive to save the Judain now. They will all perish and be wiped from the face of the earth.">

<ROOM STORY372
	(DESC "372")
	(STORY TEXT372)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT373 "Now he is wounded, Tyutchev is more deadly than ever. His blade cuts the air in a whirlwind of fury and you are driven back. You cannot parry Tyutchev's flashing blade for ever and your ripostes fall short as the pale-faced swordsman then steps back to use his longer reach. There is no chance to break off combat or use a spell.">
<CONSTANT CHOICES373 <LTABLE "beg Lucie to do something to save you" "fight on">>

<ROOM STORY373
	(DESC "373")
	(STORY TEXT373)
	(CHOICES CHOICES373)
	(DESTINATIONS <LTABLE STORY363 STORY351>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT374 "You manage to hide in a doorway just as a band of lepers turns into sight. They are coming on up the street in a slow-moving throng, a parody of a dance troupe that shuffies from house to house striking guilt into the hearts of those who see it. They are starving and emaciated, many have lost fingers, toes and their noses. Some are missing a foot or a hand. A few are heaving themselves along on trolleys, with no legs left on which to walk. They have escaped from the sanatorium. No one has fed them for days.">
<CONSTANT CHOICES374 <LTABLE "leave your hiding place and lead them to safety" "let them wander on until Hate swallows them into its qmvermg grey-green maw">>

<ROOM STORY374
	(DESC "374")
	(STORY TEXT374)
	(CHOICES CHOICES374)
	(DESTINATIONS <LTABLE STORY395 STORY404>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT375 "You have the Jewel of Sunset Fire with which to focus the rays of the setting sun on the monster but you have no way of tethering Hate so that it must suffer the searing agony of the jewel until death wracks it. You stand alone upon the parapet of the Bargello, focusing the jewel, and Hate writhes in anguish. But the monster raises itself up, towering above you and then drops like an avalanche, crushing you into the midst of a mound of rubble that was once the strongest building in the city. The monster carries all before it. You lose the sword inside its flesh and soon you are all partners in the eternal orgy of despair. The city crumbles and is lost for ever beneath the waves. Hate has completed its work.">

<ROOM STORY375
	(DESC "375")
	(STORY TEXT375)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT376 "You pass a troubled night but an undisturbed one. You awake feeling heavy headed but rested. This place is cold and, looking at the back wall, you see traces of translucent purple slime. Was a demon questing here in the night for your defenceless soul? Perhaps the very demon that embodies Hate itself?||It is clearly not safe here, however, and it is time to find a new hideaway. You set out for Bumble Row, as you know that most of the shopkeepers there shut up shop long ago and there should be plenty ofhideaways to choose from.">

<ROOM STORY376
	(DESC "376")
	(STORY TEXT376)
	(PRECHOICE STORY376-PRECHOICE)
	(CONTINUE STORY315)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY376-PRECHOICE ()
	<COND(,RUN-ONCE
		<GAIN-LIFE 2>
	)>>

<CONSTANT TEXT377 "You have taken the wrong course. You have never seen a man so skilled with a sword as the tall pale-faced Tyutchev. He is fast and strong too, and he cuts you down in a welter of blood and iron. Lucie looks on mournfully as he delivers the coup de grace, severing your head from your shoulders. There is no one left to save the Judain now. Hate will subdue all.">

<ROOM STORY377
	(DESC "377")
	(STORY TEXT377)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT378 "The magic works. The guards are feeling calm and tranquil now, completely unmoved by the horrors which have overtaken Godorno. They feel similarly unmoved about the idea of opening the gate to you -- or doing anything, for that matter. You will have to try another way.">
<CONSTANT CHOICES378 <LTABLE "wait until the spell wears off and offer them gold" "try magic again in an attempt to terrorize them" "make friends with them" "return to your hideout; bribes or magic will get you no further">>

<ROOM STORY378
	(DESC "378")
	(STORY TEXT378)
	(CHOICES CHOICES378)
	(DESTINATIONS <LTABLE STORY206 STORY341 STORY316 STORY020>)
	(REQUIREMENTS <LTABLE NONE SKILL-SPELLS NONE NONE>)
	(TYPES <LTABLE R-NONE R-SKILL R-NONE R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT379 "The Judain look at you in horror. They are not suicide troops, nor religious zealots anxious to meet their maker. \"You have gone mad!\" shouts Caisphas. \"We follow you no more.\"||With that they start to flee the barricade and go back into hiding. You are left alone to face your foe. Dusk begins to fill the streets. Only the decaying spires of the cathedrals still catch the golden glint of daylight. This may be the last sunset you will ever see, as the great rolling bulk of Hate comes slithering through the canals and streets towards you.||Hate extrudes a tentacle. In the pits of its green eyes, a flicker of intelligence shows. It recognizes you as its foe. A beam of shimmering mauve light shines down on you as the monster unleashes its magic.">

<ROOM STORY379
	(DESC "379")
	(STORY TEXT379)
	(PRECHOICE STORY379-PRECHOICE)
	(CONTINUE STORY274)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY379-PRECHOICE ()
	<CODEWORD-JUMP ,CODEWORD-VENEFIX ,STORY399>>

<CONSTANT TEXT380 "The old woman is looking at you shrewdly. She is dressed in rags and down-at-heels clogs. She probably comes to the city every second or third day to sell her eggs. She has the look of one who has outlived her children.">
<CONSTANT CHOICES380 <LTABLE "confide in her that you are in fact a Judain" "try to lose her in the streets and hope she does you no harm">>

<ROOM STORY380
	(DESC "380")
	(STORY TEXT380)
	(CHOICES CHOICES380)
	(DESTINATIONS <LTABLE STORY275 STORY286>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT381 "With a word of power and a clap of your hands you bring forth a cloud of poisonous gas which has the guards and Lucie retching helplessly while you make your getaway. You have found out the hard way that Lucie is not to be trusted. You could spend time trying to track her down and perhaps even murder her but she knows the back ways and dives of the city even better than you. You will never find her. And now that you know her for a traitor she is unlikely to trouble you again. After all, she has no reason to hate you, does she?||You make your way back into hiding trying not to think about what a fool the young strumpet made of you.">

<ROOM STORY381
	(DESC "381")
	(STORY TEXT381)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT382 "Rulership is a good choice under these circumstances, as you have a clearly identified leader who can be forced to give your commands. He is a bored gate guard to boot and falls easily under the sway of your magic. You order him to have you let through while the old woman is detained and searched for weapons. You leave the guards behind and enter the once bustling city proper.">

<ROOM STORY382
	(DESC "382")
	(STORY TEXT382)
	(CONTINUE STORY300)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT383 "It is a good job you took the time to bandage your wound. The dripping blood would have left a trail which would allow your enemies to locate you in spite of all your sorcery.">

<ROOM STORY383
	(DESC "383")
	(STORY TEXT383)
	(PRECHOICE STORY383-PRECHOICE)
	(CONTINUE STORY300)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY383-PRECHOICE ()
	<COND(,RUN-ONCE
		<GAIN-LIFE 1>
	)>>

<CONSTANT TEXT384 "Tyutchev orders the landlord to throw you a sword. You catch it. As you stand ready, trying to get the feel of your new weapon, Tyutchev draws his own sword over his shoulder in a single fluid motion full of grace and power. There is a merciless glint in his pale blue eyes as he advances steadily towards you. Lucie looks on with keen interest.">
<CONSTANT CHOICES384 <LTABLE "rush past him and out of the inn" "stay and fight Tyutchev">>

<ROOM STORY384
	(DESC "384")
	(STORY TEXT384)
	(CHOICES CHOICES384)
	(DESTINATIONS <LTABLE STORY199 STORY328>)
	(TYPES TWO-NONES)
	(ITEM SWORD)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT385 "You walk quickly down a side street, taking every first turn you come to and skirting-round Greenbark Plaza. You can hear the bell of the town crier and then hear him making a proclamation. The crowd that has gathered to hear the Overlord's commandments starts to shout excitedly. You can't make out their cries, but they remind you of a pack of hounds baying for blood. Your spine tingles at the sound and you hurry away. Rounding a corner you see three Judain, unknown to you, running from the plaza. The mob is in full cry behind them.||Seeing a derelict villa nearby you push through the gate to hide in the overgrown garden. Listening to the bloodcurdling yells of a mob that seems to be rampaging back and forth across the city you decide the time has come to leave Godorno.">
<CONSTANT CHOICES385 <LTABLE "leave by the usual means, the main gate to the trade road" "try to slip from the city unseen">>

<ROOM STORY385
	(DESC "385")
	(STORY TEXT385)
	(CHOICES CHOICES385)
	(DESTINATIONS <LTABLE STORY053 STORY070>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT386 "Cloudswept moonlight washes the streets of Godorno, turning the dirty cobblestones and narrow cramped houses into eerie sculptures of silver. Rats scurry off into the shadows as you pass. Off in another street, you hear a drunkard singing bawdy songs only to fall suddenly silent as someone empties the contents of their bedpan over him.||The jeweller's house lies just ahead. Looking to left and right, you slink across the street and gain entry by forcing the door. You pray that no one heard the sound of splintering timber as the door frame gave way. There is no point-m searching the ground floor; you expect to find the diamond locked away somewhere upstairs. Sure enough, the first floor on the landing opens onto a store room with a locked chest in the corner. You tiptoe over and bend over this, fingers twitching with greed as you pick it up, triumph spreading a smile across your face. Who would have thought it would be so easy?||A lantern is suddenly unshuttered behind you. The smile disappears. You whirl around and find yourself face to face with three of the Overlord's soldiers. \"Drop that and stand where you are, villain!\" says one with a snarl.">

<ROOM STORY386
	(DESC "386")
	(STORY TEXT386)
	(PRECHOICE STORY386-PRECHOICE)
	(CONTINUE STORY283)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY386-PRECHOICE ()
	<COND(<CHECK-SKILL ,SKILL-AGILITY>
		<STORY-JUMP ,STORY406>
	)>>

<CONSTANT TEXT387 "The sound of Lucie crying gives you a pang of remorse as you climb the steps into the evening light. She sounds utterly desolate. Breathing the fresher air outside makes you realize there is a cloying odour of putrefaction down in the cavern.">
<CONSTANT CHOICES387 <LTABLE "go back to her and comfort her" "harden your heart and go on your way">>

<ROOM STORY387
	(DESC "387")
	(STORY TEXT387)
	(CHOICES CHOICES387)
	(DESTINATIONS <LTABLE STORY273 STORY298>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT388 "Speaking a few magical riddle-me-rees-you rub the amulet and hold it up towards where Grond towers granite-grey against the violet twilighnky. It burns red and hot, but then what did you expect? Its function is to warn you of danger, after all. Only a fool would venture into Grond alone.||You cancel the charm and the stone grows cold once more. You catch Lucie eyeing the amulet covetously. \"Of course,\" you say in a casual tone, \"this amulet is magically attuned to my life force. It will not work for anyone else.\" You dart a look at Lucie to see if she believes you. \"In fact, it will explode in the face of anyone trying to steal it from me. What do you think of that?\"||\"I think it sounds as if any thief would get a nasty surprise if they tried to steal from you.\"||\"That's right, they would.\" Satisfied you have put Lucie off the idea of stealing your magical amulet you tell her to lead on.">

<ROOM STORY388
	(DESC "388")
	(STORY TEXT388)
	(CONTINUE STORY354)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT389 "You dart in to attack the first of the Jade Warriors. You fight well; your sword is an arcing blaze of light, but though it rings loudly against the jade bodies of your adversaries they are not dinted. Their heavy blows break down your guard and their blades are terribly sharp, as you find to your cost when one bites into your shoulder.">
<CONSTANT CHOICES389 <LTABLE "make another attempt at the champions of the Megiddo dynasty" "flee">>

<ROOM STORY389
	(DESC "389")
	(STORY TEXT389)
	(PRECHOICE STORY389-PRECHOICE)
	(CHOICES CHOICES389)
	(DESTINATIONS <LTABLE STORY296 STORY016>)
	(REQUIREMENTS <LTABLE SKILL-UNARMED-COMBAT NONE>)
	(TYPES <LTABLE R-SKILL R-NONE>)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY389-PRECHOICE ()
	<COND(,RUN-ONCE
		<TEST-MORTALITY 2 ,DIED-FROM-INJURIES ,STORY389>
	)>>

<CONSTANT TEXT390 "This is a very confined space in which to let loose the awful spell of the Miasma. The billowing cloud of gas which erupts fills the Inn of the Inner Temple and all inside fall retching helplessly to the floor. You have taken the precaution of winding a damp scarf about your mouth and nose and can still breathe. Grabbing Skakshi you drag him out.||\"You, Skakshi, will take me to meet your guildmaster, Melmelo. I have a proposition for his ears only.\"||\"I'll -- ack! -- do anything you say ... Just release me -- cough! -- from this wracking spell!\"||Skakshi is only too glad to do your bidding as long as he is released from the pit of gas the Inn of the Inner Temple has become.">

<ROOM STORY390
	(DESC "390")
	(STORY TEXT390)
	(CONTINUE STORY181)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT391 "Amateur rogues often assume that speed is the important thing in a job like this. Long experience has taught you better. The key to success is to take your time. Luckily patience is your only virtue, so you have had plenty of opportunity to practise it over the years.||Creeping low, pressed hard back into the dingy shadows by the wainscoting, you inch round the room. All the while the three guards go on with their game. Though your eyes remain firmly fixed on the treasure-box you listen to the hisses of breath and grunts and curses that indicate when someone has lost a throw, to the gulps of watered wine taken during respites in the game, to the rattle of dice and the slap ofcopper coins on the wooden tabletop. But still the guards remain oblivious of the rogue at their backs who is intent on whisking away a greater fortune in this one night than they will win or lose in their whole lives.||You reach the treasure chest at last and allow yourself a backward glance. One of the guards is now slumped dozily across the table. Another fingers the dice idly, tired of squandering his pay. The third grunts and begins to clean his fingernails with a dagger. \"How much longer are we on duty for?\" he asks.||\"The next watch ought to be here in a few minutes to relieve us,\" replies the man with the dice.||Now you know you must work fast. When the next watch takes over they are bound to check the treasure chest. It isn't very large, but with any load under your arm you would find it harder to move silently.">
<CONSTANT CHOICES391 <LTABLE "try picking the lock" "take the chest with you and open it later">>

<ROOM STORY391
	(DESC "391")
	(STORY TEXT391)
	(CHOICES CHOICES391)
	(DESTINATIONS <LTABLE STORY217 STORY253>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT392 "You must try to bind the monster long enough to find a way to destroy it.">

<ROOM STORY392
	(DESC "392")
	(STORY TEXT392)
	(PRECHOICE TEXT392-PRECHOICE)
	(CONTINUE STORY224)
	(FLAGS LIGHTBIT)>

<ROUTINE TEXT392-PRECHOICE ()
	<COND(<OR <CHECK-SKILL ,SKILL-ROGUERY> <CHECK-SKILL ,SKILL-CUNNING>>
		<STORY-JUMP ,STORY089>
	)>>

<CONSTANT TEXT393 "If only you had taken the time to bandage your wound and staunch the flow of blood. The leg of your breeches is soaked and you are leaving red telltale footprints behind as you try to sidle past the line of guard. They could follow you as easily as if you had left chalk arrows on the ground. One of them sees the blood, shouts and points in your direction. They all fire their bows at you. It is a mercifully sudden death. There is no one left now to save the Judain. They will all perish and be wiped from the face of the earth.">

<ROOM STORY393
	(DESC "393")
	(STORY TEXT393)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT394 "A heavy footstep sounds in the open doorway. \"Hey, lads, we've been suckered!\" shouts the guard standing there. \"The thief is right here all along!\"||As you turn, you can already hear the other guards racing back to trap you.">

<ROOM STORY394
	(DESC "394")
	(STORY TEXT394)
	(PRECHOICE STORY394-PRECHOICE)
	(CONTINUE STORY283)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY394-PRECHOICE ()
	<COND(<CHECK-SKILL ,SKILL-AGILITY>
		<STORY-JUMP ,STORY406>
	)>>

<CONSTANT TEXT395 "This motley crew would follow you anywhere. They shuffie along in your wake, calling out feebly for food and medicine, though there is no magic or medicine that can restore these disfigured unfortunates to health. You are not bothered by city guardsmen, nor thieves and cut-throats while surrounded by your crowd oflepers. The sweet putrefying smell that seeps from their bandages is an antidote to the stench of death that pervades the city.||You must decide where to lead your motley band.">
<CONSTANT CHOICES395 <LTABLE "take them to the prison fortress of Grand, in the hope of using them to set the prisoners free" "have them sheltered by the cells of the Judain resistance">>

<ROOM STORY395
	(DESC "395")
	(STORY TEXT395)
	(CHOICES CHOICES395)
	(DESTINATIONS <LTABLE STORY194 STORY359>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT396 "All you have in the way of weaponry to defeat Hate is the Jade Warrior's sword. It is a potent magical weapon but it is perhaps a forlorn hope that it will allow you to vanquish the monster. Still, it is all the hope you have. You lead your doomed people in a final stand against Hate. The monster carries all before it. You lose the sword inside its flesh and soon you are all partners in the eternal orgy of despair. The city crumbles and is lost for ever beneath the waves. Hate has completed its work.">

<ROOM STORY396
	(DESC "396")
	(STORY TEXT396)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT397 "\"Slaughter is a fine end in itself. No end is finer than death and destruction. Slaughter is the reason the god Anarchil put me on this world.\" He is smiling as he says it but he really means what he is saying. Tyutchev is a very dangerous lunatic. You have never heard of his god but you can rest assured it is a vicious and barbaric cult that reveres him.||He turns to Lucie. \"I leave you to talk with this Judain. But you may call on me this evening.\"||\"Will we be alone?\" she asks.||\"Yes. Cassandra took ship for Aleppo on the rising tide.\"||Lucie looks pleased. \"Till tonight, then.\"||Tyutchev quits the tavern, leaving you alone with Lucie.">

<ROOM STORY397
	(DESC "397")
	(STORY TEXT397)
	(CONTINUE STORY403)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT398 "You offer one of the gate guards money, but he just says, \"It's more than my life's worth to open the gate when the bell tolls. You'd best come with me ...\"||He lays a calloused hand on your shoulder, then turns to call to his fellow guards: \"Got one here -- a Judain! Tried to bribe me.\"||He steps back as if to let you go but it is only to move away from you, the target of the other guards' crossbows. Your body is peppered with crossbow bolts and you fall to the ground.||\"That's one less of those scum,\" says another guard as you die.">

<ROOM STORY398
	(DESC "398")
	(STORY TEXT398)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT399 "You scream in agony as the light seeps into your flesh. A moment later, you are horrified to see purple polyps sprouting from your chest. Hate has awakened the evil in your own heart, forming a cancer that gnaws at you from within.">
<CONSTANT TEXT399-CONTINUED "You are determined to destroy the monster before it can subvert you to its cause.">

<ROOM STORY399
	(DESC "399")
	(STORY TEXT399)
	(PRECHOICE STORY399-PRECHOICE)
	(CONTINUE STORY274)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROUTINE STORY399-PRECHOICE ()
	<TEST-MORTALITY 5 ,DIED-GREW-WEAKER ,STORY399>
	<IF-ALIVE ,TEXT399-CONTINUED>>

<CONSTANT TEXT400 "You disappear through the jaws of Hate. As it absorbs you into its being, it begins to be wracked by spasms of pain. It cannot tolerate the presence of goodness within its very being. Shuddering, Hate tries to flee back to the sewers, but it is rotting away by the moment. The people come out of hiding to watch as it dwindles. They take up rocks and sticks and pelt the dying monster. The Overlord's men stand shoulder to shoulder with Judain resistance fighters, smiting their common enemy. At last Hate gives a forlorn screech and dies, turning to dust which is carried off by the wind.||You lost your life, but you died a martyr's death, bringing salvation to your people and your city.">

<ROOM STORY400
	(DESC "400")
	(STORY TEXT400)
	(VICTORY T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT401 "Hate thrashes wildly and a tidal wave erupts from the canal, smashing against the Bargello keep. But it is the monster's death throes. Just as the sun sinks beneath the horizon, the jewel glows white hot and the ruby light becomes a coruscating fan of many-coloured motes that disintegrate the vile purple flesh. The monster falls and makes its own grave as the catacombs open up beneath its bulk, welcoming it to its final rest. The sun sets and the city is quiet.">

<ROOM STORY401
	(DESC "401")
	(STORY TEXT401)
	(CONTINUE STORY416)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT402 "Lucie smiles as sweetly at Mameluke but Mameluke greets her gruffiy, disdaining to hide'his dislike of the girl.||\"I need strong and trusty Mameluke here as bodyguard if I am to go to Grand and get you smuggled into the prison,\" she says. \"Will you be my protector, Mameluke?\"||\"If I must -- though I'd rather stick my head inside a lion's jaws.\"||\"It's settled, then; come with me.\"||Lucie leads you by cunning back ways towards the prison fortress.">

<ROOM STORY402
	(DESC "402")
	(STORY TEXT402)
	(CONTINUE STORY354)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT403 "You sit down beside Lucie, oblivious of the other vermin drinking in this slop hole. \"Why do people like him waste time in a place like this? I mean, I don't want to offend, but there must be girls like you in other cities north of the sea.\"||\"Ah, but in Godorno everyone is desperate. Tyutchev likes desperate people.\"||\"Are you desperate, Lucie?\"||\"Aren't you, to survive?\"||You change the subject. \"I've never seen a man wield a sword like that before. I didn't know it was possible. He fights like a demigod.\"||\"And he thinks he is demigod, too,\" says Lucie with an arch smile. \"It really gripes him when people don't treat him that way. And now you're going to ask what's a nice girl like me --\"||\"-- doing with a murderous bastard like that?\"||\"He amuses me.\"||\"What about his woman friend, the one called Cassandra?\"||Lucie shivers. \"She'd like to kill me, that one. She's killed enough men in her time. Soon as she's tired of them she fires them with cold steel. I'll make a bargain with you, Judain. You kill her for me and I'll help you save your beloved people. I know I only look like a little sweetmeat of a girl, but I can do it, with people like Tyutchev on my side.\"||\"He won't thank us for killing Cassandra.\"||\"What's the matter, Judain? Are you frightened?\"||You coolly point out that Tyutchev said Cassandra had taken ship to Aleppo.||Lucie sneers prettily. \"She'll be back sooner or later.\"||\"It's no business of mine,\" you reply.||Lucie looks annoyed for a moment, then turns a bright smile on you. \"You're quite the hero of your people, and I like heroes. You can call on me if you need me and I'll give you a reward for your heroism.\"||\"Thank you, Lucie. All help is appreciated in these troubled days.\"||Bidding her farewell, you leave the inn.">

<ROOM STORY403
	(DESC "403")
	(STORY TEXT403)
	(CONTINUE STORY199)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT404 "Who would have thought that lepers could have such a strong will to live? They wander unknowing onto a glassy mauve grey surface at the end of the street and fall into the morass of Hate. Their struggles to be free are every bit as mighty as the fit young people of Godorno who have also been summoned to the eternal embrace. With their harrowing cries still vivid in your memory, you return to Bumble Row.">

<ROOM STORY404
	(DESC "404")
	(STORY TEXT404)
	(CONTINUE STORY020)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT405 "There is no way out. The crossbows of the guards pepper your body with quarrels and you fall dead to the cobbled street in a pool of blood. The old egg-seller steals your purse and goes on her way. There is no one left now to save the Judain. Hate will subdue all.">

<ROOM STORY405
	(DESC "405")
	(STORY TEXT405)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT406 "\"You want this?\" you cry. \"Then catch!\"||So saying, you throw the treasure-box. It catches one of the guards with a resounding crack and he reels back onto the landing, clutching his nose, as the others close in. You dart back, seize the edge of the carpet on which they're standing, and give it a sharp tug. The breath comes out of their lungs in sharp surprised grunts as they lose their footing and tumble over backwards. Using their stomachs as a springboard, you bound over to the doorway and snatch up the box. The other guard has started to recover his wits. Despite the blood streaming from his nose, he advances along the landing towards you with an angry snarl.||You see no gain in fighting him. A few swift steps carry you to the window at the end of the landing, where you execute an agile dive, twisting in midair to land softly in a cart which you noticed earlier. The guards crowd to the window. \"Come back here, you cur!\" growls the one with the bloody nose.||\"Sirrah,\" you reply with a courtly bow, \"I regret I must decline your gracious request. Adieu!\" And with that you dart off down the street, sniggering at the angry shouts which soon recede into the distance far behind you.">

<ROOM STORY406
	(DESC "406")
	(STORY TEXT406)
	(CONTINUE STORY358)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT407 "Though your instinct is to trust Lucie who seems open and without guile you know it makes no sense to agree to a meeting with a stranger, particularly in a city like Godorno where your people are the victims of genocide. You demand to be told who it is who can help you in your struggle to save your people.||\"He made me promise to keep his identity secret, until you meet. He said he could help you only if you are able to trust. So many good people have fallen into the clutches of the coils of Hate. Trust me.\"||\"Is he Judain?\"||\"No, not Judain. Come, we are almost there.\"">
<CONSTANT CHOICES407 <LTABLE "follow Lucie" "change your mind and tell her you are going back to your hideout">>

<ROOM STORY407
	(DESC "407")
	(STORY TEXT407)
	(CHOICES CHOICES407)
	(DESTINATIONS <LTABLE STORY411 STORY324>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT408 "Your leadership has so inspired your people that they are prepared to man the barricade against Hate itself. They pelt it with missiles and arrows and hack at it with swords, cleavers and boathooks but all to no avail. Hate dines well today as it rolls over the barricade crushing everything there to a pulp. You could not desert your people now and you too are flattened and drawn in to the eternal orgy of despair. Hate will conquer all.">

<ROOM STORY408
	(DESC "408")
	(STORY TEXT408)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT409 "The catacombs under the palace are dark and eerie. There is an evil resonance here, as if unspeakable acts had been carried out far from the light of day. You find your way carefully forward until you reach the cellar stairs that lead up into the palace.">

<ROOM STORY409
	(DESC "409")
	(STORY TEXT409)
	(CONTINUE STORY279)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT410 "Tyutchev seems to be a bit of a rogue as well as a swordsman. He moves stealthily and shows all the tricks of a footpad in moving through the dangerous streets. He may well be leading you into a trap, for you are being taken deeper and deeper into the foreigners' quarter and soon you will be up against the town wall, where you can be cornered. You decide to let him go and quit the foreigners' quarter as fast as you can.">

<ROOM STORY410
	(DESC "410")
	(STORY TEXT410)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT411 "Of course you trust lovely little Lucie. She takes your hand and leads you into a quiet courtyard that gives out onto the upper end of Fortuny Street. You walk through an arboretum of magnolia trees and hanging baskets of weeping lilies and find yourself surrounded by the Overlord's men with crossbows pointed at your chest. Lucie smiles a wicked little smile.">
<CONSTANT CHOICES411 <LTABLE "turn invisible" "send a fog of poison gas towards them" "surrender">>

<ROOM STORY411
	(DESC "411")
	(STORY TEXT411)
	(CHOICES CHOICES411)
	(DESTINATIONS <LTABLE STORY317 STORY381 STORY196>)
	(REQUIREMENTS <LTABLE SKILL-SPELLS SKILL-SPELLS NONE>)
	(TYPES <LTABLE R-SKILL R-SKILL R-NONE>)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT412 "Mameluke comes up with a plan. \"No need to brave the horrors of the catacombs ...\" He will distract the guards while you slip past into the fortress.||You both scurry through the back alleys to the prison. At first it seems as though the plan will fail. When he hammers on the great gates of Grond there is no reply.||He hammers on the door again, saying he is the Overlord's messenger. Fortunately, the Overlord does use a Tartar like Mameluke as a courier. At length there is a great clanking and grinding and the gates start to inch apart. It is a great labour to open them with the iron machinery forged by smiths from the mountains and he calls out hearty thanks, but there is no one to answer his call. It is as if the gate was opened by ghosts. The sweet cloying smell of crushed roses and honeysuckle lingers here. Something is terribly wrong. You decide not to risk Mameluke's life any further and step inside the prison fortress alone, despite the Tartar's protestations.">

<ROOM STORY412
	(DESC "412")
	(STORY TEXT412)
	(CONTINUE STORY413)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT413 "The towngate at Grand is a ten foot thick wall abutting a battlemented and turreted gatehouse. As the gates creak open you look into the bleak eastern courtyard. There is silence for a moment as you look at the grim grey stones that have witnessed the trials and tortures of so many. For fifteen hundred years Grand has stood at the rivermouth. Additions made in a new style every century or two, always in the same sombre hard grey stone, give it a chaotic air.||For centuries the prison fortress has struck terror into the hearts of the good burghers of Godorno. Its architect, Falsaphio the Gifted, was walled in above the gatehouse keystone because the prison had cost more to build than he had promised. You are standing beneath his remains.">

<ROOM STORY413
	(DESC "413")
	(STORY TEXT413)
	(CONTINUE STORY309)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT414 "At last you manage to regain the safety of the underground cellars. There is a hole in the ceiling through which you can be spied on from the road unless you move back against the back wall, but the other Judain have taken all the best bolt holes. You will find a better hideaway in time.">
<CONSTANT CHOICES414 <LTABLE " drag the palliasse to the back where you cannot be seen through the hole in the roof" "sleep on the street side near the hole">>

<ROOM STORY414
	(DESC "414")
	(STORY TEXT414)
	(CHOICES CHOICES414)
	(DESTINATIONS <LTABLE STORY347 STORY376>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT415 "When the captain of the Eastgate at Grond sees how much gold you have brought him his eyes nearly pop out of his head. He hands you a huge bunch of keys on a belt and directs you by a circuitous route to the torture chambers. There are no other guards to be seen. He must have given orders that are keeping them busy. By the time you find the torture chambers, deep below the towers of the Great Keep, the captain of the guard is long gone, knowing full well what his grisly fate would be if he should be caught by those he has tortured.">

<ROOM STORY415
	(DESC "415")
	(STORY TEXT415)
	(CONTINUE STORY413)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT416 "Then there is a murmuring from the catacombs: a sound that grows and swells from a hum to a roar. The lost souls are free once more and they climb into the streets to hail you as their saviour. You are a hero and you will be feted for a hundred days. Now is the time for the banquet at the Overlord's palace that you have promised your people. Together you will rebuild Godorno and make it once more the jewel of the east. You are carried aloft to the palace and set on the throne despite all your protestations. The city is yours. At last the Judain need have no fear.">

<ROOM STORY416
	(DESC "416")
	(STORY TEXT416)
	(VICTORY T)
	(FLAGS LIGHTBIT)>
