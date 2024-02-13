<INSERT-FILE "numbers">

<GLOBAL CHARACTERS-ENABLED T>
<GLOBAL STARTING-POINT PROLOGUE>

<CONSTANT BAD-ENDING "Your adventure ends here.|">
<CONSTANT GOOD-ENDING "You saved your people from annihilation.|">

<OBJECT CURRENCY (DESC "gleenars")>
<OBJECT VEHICLE (DESC "none")>

<ROUTINE RESET-OBJECTS ()
	<PUTP ,KNIFE ,P?QUANTITY 1>
	<RETURN>>

<ROUTINE RESET-STORY ()
	<RESET-TEMP-LIST>
	<RESET-GIVEBAG>
	<RESET-CONTAINER ,LOST-SKILLS>
	<SETG PROTECT-FROM-HATE F>
	<PUTP ,STORY003 ,P?DEATH T>
	<PUTP ,STORY005 ,P?DEATH T>
	<PUTP ,STORY014 ,P?DEATH T>
	<PUTP ,STORY016 ,P?DEATH T>
	<PUTP ,STORY106 ,P?DEATH T>
	<PUTP ,STORY121 ,P?DEATH T>
	<PUTP ,STORY123 ,P?DEATH T>
	<PUTP ,STORY130 ,P?DEATH T>
	<PUTP ,STORY135 ,P?DEATH T>
	<RETURN>>

<CONSTANT DIED-IN-COMBAT "You died in combat">
<CONSTANT DIED-OF-HUNGER "You starved to death">
<CONSTANT DIED-GREW-WEAKER "You grew weaker and eventually died">
<CONSTANT DIED-FROM-INJURIES "You died from your injuries">
<CONSTANT DIED-FROM-COLD "You eventually freeze to death">
<CONSTANT NATURAL-HARDINESS "Your natural hardiness made you cope better with the situation">

<CONSTANT HEALING-KEY-CAPS !\U>
<CONSTANT HEALING-KEY !\u>

<GLOBAL PROTECT-FROM-HATE F>

<OBJECT LOST-SKILLS
	(DESC "skills lost")
	(SYNONYM SKILLS)
	(ADJECTIVE LOST)
	(FLAGS CONTBIT OPENBIT)>

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

<ROUTINE TEST-MORTALITY (DAMAGE MESSAGE "OPT" STORY (AGAINST-HATE F))
	<COND (<NOT .STORY> <SET .STORY ,HERE>)>
	<COND (<AND .AGAINST-HATE ,PROTECT-FROM-HATE> <DEC .DAMAGE>)>
	<COND (<G? .DAMAGE 0>
		<LOSE-LIFE .DAMAGE .MESSAGE .STORY>
	)(ELSE
		<PREVENT-DEATH .STORY>
	)>>

<ROUTINE PREVENT-DEATH ("OPT" STORY)
	<COND (<NOT .STORY> <SET STORY ,HERE>)>
	<COND (<GETP .STORY ,P?DEATH> <PUTP .STORY ,P?DEATH F>)>>

<ROUTINE GET-NUMBER (MESSAGE "OPT" MINIMUM MAXIMUM "AUX" COUNT)
	<REPEAT ()
		<CRLF>
		<TELL .MESSAGE>
		<COND (<AND <OR <ASSIGNED? MINIMUM> <ASSIGNED? MAXIMUM>> <G? .MAXIMUM .MINIMUM>>
			<TELL " (" N .MINIMUM "-" N .MAXIMUM ")">
		)>
		<TELL "? ">
		<READLINE>
		<COND (<EQUAL? <GETB ,LEXBUF 1> 1> <SET COUNT <CONVERT-TO-NUMBER 1 10>>
			<COND (<OR .MINIMUM .MAXIMUM>
				<COND (<AND <G=? .COUNT .MINIMUM> <L=? .COUNT .MAXIMUM>> <RETURN>)>
			)(<G? .COUNT 0>
				<RETURN>
			)>
		)>
	>
	<RETURN .COUNT>>

<ROUTINE DELETE-CODEWORD (CODEWORD)
	<COND (<AND .CODEWORD <CHECK-CODEWORD .CODEWORD>>
		<CRLF>
		<TELL "[You lose the codeword ">
		<HLIGHT ,H-BOLD>
		<TELL D .CODEWORD "]" CR>
		<HLIGHT 0>
		<REMOVE .CODEWORD>
	)>>

<ROUTINE KEEP-ITEM (ITEM "OPT" JUMP)
	<CRLF>
	<TELL "Keep " T .ITEM "?">
	<COND (<YES?>
		<COND (<NOT <CHECK-ITEM .ITEM>> <TAKE-ITEM .ITEM>)>
		<COND (.JUMP <STORY-JUMP .JUMP>)>
		<RTRUE>
	)>
	<COND (<CHECK-ITEM .ITEM> <LOSE-ITEM .ITEM>)>
	<RFALSE>>

<ROUTINE ADD-QUANTITY (OBJECT "OPT" AMOUNT CONTAINER "AUX" QUANTITY CURRENT)
	<COND (<NOT .OBJECT> <RETURN>)>
	<COND (<L=? .AMOUNT 0> <RETURN>)>
	<COND (<NOT .CONTAINER> <SET CONTAINER ,PLAYER>)>
	<COND (<EQUAL? .CONTAINER ,PLAYER>
		<DO (I 1 .AMOUNT)
			<TAKE-ITEM .OBJECT>
		>
	)(ELSE
		<SET CURRENT <GETP .OBJECT ,P?QUANTITY>>
		<SET QUANTITY <+ .CURRENT .AMOUNT>>
		<PUTP .OBJECT ,P?QUANTITY .QUANTITY>
	)>>

<ROUTINE CHECK-VEHICLE (RIDE)
	<COND (<OR <IN? .RIDE ,VEHICLES> <AND ,CURRENT-VEHICLE <EQUAL? ,CURRENT-VEHICLE .RIDE>>> <RTRUE>)>
	<RFALSE>>

<ROUTINE TAKE-VEHICLE (VEHICLE)
	<COND (.VEHICLE
		<COND (,CURRENT-VEHICLE <REMOVE ,CURRENT-VEHICLE>)>
		<MOVE .VEHICLE ,VEHICLES>
		<SETG CURRENT-VEHICLE .VEHICLE>
		<UPDATE-STATUS-LINE>
	)>>

<ROUTINE LOSE-VEHICLE (VEHICLE)
	<COND (.VEHICLE
		<COND (<CHECK-VEHICLE .VEHICLE>
			<REMOVE .VEHICLE>
			<SETG CURRENT-VEHICLE NONE>
			<UPDATE-STATUS-LINE>
		)>
	)>>

<ROUTINE LOSE-SKILL (SKILL)
	<COND (<AND .SKILL <CHECK-SKILL .SKILL>>
		<CRLF>
		<HLIGHT ,H-BOLD>
		<TELL "You lost " T .SKILL " skill">
		<TELL ,PERIOD-CR>
		<HLIGHT 0>
		<MOVE .SKILL ,LOST-SKILLS>
	)>>

<ROUTINE ADD-FOOD ("OPT" AMOUNT)
	<ADD-QUANTITY ,FOOD .AMOUNT ,PLAYER>>

<ROUTINE BUY-FOOD (PRICE)
	<BUY-STUFF ,FOOD "food supplies" .PRICE>>

<ROUTINE BUY-STUFF (ITEM PLURAL PRICE "OPT" LIMIT "AUX" QUANTITIES)
	<COND (<NOT .LIMIT> <SET LIMIT 8>)>
	<COND (<G=? ,MONEY .PRICE>
		<CRLF>
		<TELL "Buy " D .ITEM " for " N .PRICE " " D ,CURRENCY " each?">
		<COND (<YES?>
			<REPEAT ()
				<SET QUANTITIES <GET-NUMBER "How many will you buy" 0 .LIMIT>>
				<COND (<G? .QUANTITIES 0>
					<COND (<L=? <* .QUANTITIES .PRICE> ,MONEY>
						<CRLF>
						<HLIGHT ,H-BOLD>
						<TELL "You purchased " N .QUANTITIES " ">
						<COND (<G? .QUANTITIES 1> <TELL .PLURAL>)(ELSE <TELL D .ITEM>)>
						<TELL ,PERIOD-CR>
						<CHARGE-MONEY <* .QUANTITIES .PRICE>>
						<ADD-QUANTITY .ITEM .QUANTITIES>
						<COND (<L? ,MONEY .PRICE> <RETURN>)>
					)(ELSE
						<EMPHASIZE "You can't afford that!">
					)>
				)(ELSE
					<RETURN>
				)>
			>
		)>
	)>>

<ROUTINE SELL-STUFF (ITEM PLURAL PRICE "AUX" (ITEMS-SOLD 0) (QUANTITY 0))
	<COND (<HAS-FOOD>
		<SET QUANTITY <GETP .ITEM ,P?QUANTITY>>
		<CRLF>
		<TELL "Sell " D .ITEM " at " N .PRICE " " D ,CURRENCY " each?">
		<COND (<YES?>
			<SET ITEMS-SOLD <GET-NUMBER "How many will you sell" 0 .QUANTITY>>
			<COND (<G? .ITEMS-SOLD 0>
				<SETG ,MONEY <+ ,MONEY <* .ITEMS-SOLD .PRICE>>>
				<SET .QUANTITY <- .QUANTITY .ITEMS-SOLD>>
				<CRLF>
				<TELL "You sold " N .ITEMS-SOLD " ">
				<HLIGHT ,H-BOLD>
				<COND (<G? .ITEMS-SOLD 1> <TELL .PLURAL>)(ELSE <TELL D .ITEM>)>
				<HLIGHT 0>
				<TELL ,PERIOD-CR>
				<COND (<G? .QUANTITY 0>
					<PUTP .ITEM ,P?QUANTITY .QUANTITY>
				)(ELSE
					<PUTP .ITEM ,P?QUANTITY 1>
					<REMOVE .ITEM>
				)>
			)>
		)>
	)>>

<ROUTINE TAKE-FOOD ("OPT" AMOUNT)
	<RETURN <TAKE-STUFF ,FOOD "food supplies" .AMOUNT>>>

<ROUTINE TAKE-STUFF (ITEM PLURAL "OPT" AMOUNT "AUX" TAKEN)
	<COND (<NOT .AMOUNT> <SET .AMOUNT 1>)>
	<CRLF>
	<TELL "Take the ">
	<COND (<G? .AMOUNT 1> <TELL .PLURAL>)(<TELL D .ITEM>)>
	<TELL "?">
	<COND (<YES?>
		<COND (<G? .AMOUNT 1>
			<SET TAKEN <GET-NUMBER "How many will you take" 0 .AMOUNT>>
			<ADD-QUANTITY .ITEM .AMOUNT ,PLAYER>
			<RETURN .TAKEN>
		)(ELSE
			<TAKE-ITEM .ITEM>
			<RETURN 1>
		)>
	)>
	<RETURN 0>>

<ROUTINE CONSUME-FOOD ("OPT" AMOUNT JUMP "AUX" QUANTITY (RETURN-VALUE F))
	<COND (<NOT .AMOUNT> <SET AMOUNT 1>)>
	<COND (<CHECK-ITEM ,FOOD>
		<SET QUANTITY <GETP ,FOOD ,P?QUANTITY>>
		<COND (<G=? .QUANTITY .AMOUNT>
			<SET QUANTITY <- .QUANTITY .AMOUNT>>
			<PUTP ,FOOD ,P?QUANTITY .QUANTITY>
			<COND (<G=? .QUANTITY 1>
				<CRLF>
				<HLIGHT ,H-BOLD>
				<TELL "[Your supply of food decreased by " N .AMOUNT "]" CR>
				<HLIGHT 0>
			)(ELSE
				<EMPHASIZE "[You've exhausted your food supplies]">
			)>
			<COND (.JUMP <STORY-JUMP .JUMP>)>
			<SET RETURN-VALUE T>
		)>
		<COND (<L? .QUANTITY 1>
			<PUTP ,FOOD ,P?QUANTITY 1>
			<REMOVE ,FOOD>
		)>
	)>
	<RETURN .RETURN-VALUE>>

<ROUTINE HAS-FOOD ("OPT" (THRESHOLD 0) "AUX" (QUANTITY 0))
	<COND (<CHECK-ITEM ,FOOD>
		<SET QUANTITY <GETP ,FOOD ,P?QUANTITY>>
		<COND (<G? .QUANTITY .THRESHOLD> <RTRUE>)>
	)>
	<RFALSE>>

<ROUTINE TAKE-QUANTITIES (OBJECT PLURAL MESSAGE "OPT" AMOUNT)
	<CRLF>
	<TELL "Take the " .PLURAL "?">
	<COND (<YES?> <ADD-QUANTITY .OBJECT <GET-NUMBER .MESSAGE 0 .AMOUNT> ,PLAYER>)>>

<ROUTINE SKILL-JUMP (SKILL STORY)
	<COND (<CHECK-SKILL .SKILL> <STORY-JUMP .STORY>)>>

<ROUTINE ITEM-JUMP (ITEM STORY)
	<COND (<CHECK-ITEM .ITEM> <STORY-JUMP .STORY>)>>

<ROUTINE CODEWORD-JUMP (CODEWORD STORY)
	<COND (<CHECK-CODEWORD .CODEWORD> <STORY-JUMP .STORY>)>>

<CONSTANT TEXT "This story has not been written yet.">

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

<CONSTANT TEXT005 "Hate shrieks -- a cry of insensate fury as it sees you charging back to slice at it with your enchanted blade. In a welter of carnage, you and your mon- strous foe lock in mortal combat. The green-tinted metal of your blade chops deep into Hate's soft purulent flesh, while its tentacles slap into you with stunning force. Those baleful green eyes gleam with a new emotion now -- not hatred and unreasoning violence, but the liquid gleam of fear. Hate knows that it is going to die today. But it sells its life dearly.">

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

<CONSTANT TEXT006 "You spend much of the day poring over your battle plans with the heads of the resistance. Not only other Judain have rallied to your cause. Now you have many people who have equally good cause to fight the Overlord -- those whose families have been starved by his harsh taxes or abused by his brutish soldiers.|| Some time after noon, as you are explaining the tactics for the final pitched battle to decide the fate of the city, a little street urchin brings news that Lucie's house has collapsed. She is feared dead. ">
<CONSTANT CHOICES006 <LTABLE "go to see if you can do anything" "carry on making your plans for the battle">>

<ROOM STORY006
	(DESC "006")
	(STORY TEXT006)
	(CHOICES CHOICES006)
	(DESTINATIONS <LTABLE STORY210 STORY195>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT007 "On your way to meet Lucie the next day, you notice bushels of red flowers bobbing on the surface of the Circle Canal and wander over to the edge to look. On closer inspection they look like pieces of meat. An uneasy feeling steals over you as you realize they are human hearts, hundreds of them, bobbing on the surface, waiting for the carrion crows. These cannot be the hearts of the slaughtered Judain, for your people hang in iron cages and their chests are still intact.||When you arrive at the Garden of Statues, Lucie is there, looking as pretty as ever. She pretends not to have seen you and walks down the deserted street towards a dog-handler who has a gigantic deerhound straining at a leash. Perhaps Lucie doesn't want to give you away, in which case she is being very streetwise. You can stay hidden here but the dog seems to have picked up your scent and barks excitedly. What is it that makes bloodhounds bark so? Is the dog already imagining sinking his teeth into soft manfiesh?||Lucie may have some plan. ">
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
	(FLAGS LIGHTBIT)>

<ROUTINE STORY015-PRECHOICE()
	<COND (<CHECK-SKILL ,SKILL-AGILITY>
		<LOSE-SKILL ,SKILL-AGILITY>
	)>
	<TELL ,TEXT015-CONTINUED>
	<TELL ,PERIOD-CR>
	<COND (<CHECK-SKILL ,SKILL-WILDERNESS-LORE>
		<STORY-JUMP ,STORY022>
	)(ELSE
		<STORY-JUMP ,STORY035>
	)>>

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

<CONSTANT TEXT020 "You resolve to enter the prison fortress of Grond. Once there, you can free the captured Judain and other political prisoners detained to await the mercy of the Overlord's torturers. But you cannot succeed at such an ambitious mission alone, and you are unwilling to put your fellow Judain at further risk. They are brave enough, but to get inside the prison you will need the help ofan expert rogue.">
<CONSTANT CHOICES020 <LTABLE "pay a visit to your mulatto friend, Mame- luke, who has been useful to you in the past" "call on the little gamine Lucie">>

<ROOM STORY020
	(DESC "020")
	(STORY TEXT020)
	(CHOICES CHOICES020)
	(DESTINATIONS <LTABLE STORY303 STORY293>)
	(TYPES TWO-NONES)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT021 "Your ploy works. The lasso catches Tormil's leg and with the help of some bystanders you are able to drag him free.||\"Why do we help him?\" asks one of the men as he releases the rope. \"The Overlord's men treat us like cattle!\"||\"True, he has earned our hatred,\" you say. \"But now, see, he deserves our pity.\"||Tormil weeps over the body ofhis daughter, past saving in the body of the monster. You creep away while he mourns.">

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
<CONSTANT CHOICES027 <LTABLE "make a dash for the sword" "go to Lucie's help without delay ">>

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

<ROOM STORY032
	(DESC "032")
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

<ROOM STORY033
	(DESC "033")
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

<ROOM STORY034
	(DESC "034")
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

<ROOM STORY035
	(DESC "035")
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

<ROOM STORY036
	(DESC "036")
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

<ROOM STORY037
	(DESC "037")
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

<ROOM STORY038
	(DESC "038")
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

<ROOM STORY039
	(DESC "039")
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

<ROOM STORY040
	(DESC "040")
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

<ROOM STORY041
	(DESC "041")
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

<ROOM STORY042
	(DESC "042")
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

<CONSTANT TEXT043 "Skakshi slams the door as he goes and the other drinkers follow without so much as a glance in your direction. They do not dare to share the drinking hall of the Inn of the Inner Temple with you. You have made no friends here and you won't get a meeting with Melmelo now. He will hear everything that has happened here and he is not an easy man to find and get to talk to.||The landlord stoops to pick up the spiked club which still has congealed blood sticking to it from the last time it was used and puts it back behind the bar.">

<ROOM STORY043
	(DESC "043")
	(STORY TEXT043)
	(CONTINUE STORY214)
	(CODEWORD CODEWORD-COOL)
	(FLAGS LIGHTBIT)>

<ROOM STORY044
	(DESC "044")
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

<ROOM STORY045
	(DESC "045")
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

<ROOM STORY048
	(DESC "048")
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

<CONSTANT TEXT049 "You find the librarian outside the building, staring at a glimmering pile ofashes. As you go closer, you see that someone has piled up the books of the library and torched them. The librarian falls to his knees, overcome with distress. \"They burned my books!\" he groans, tears running into his beard.||\"Who did? And why?\" you ask.||\"The Overlord's men. They said that knowledge was the enemy oflaw and order. They claimed that lies had been written in the books by Judain authors. Oh, such a waste ...!\"||There is no chance now of finding more about Hate from the writings of ancient scholars; you may not visit the library again should you be given the option. You wonder if the Overlord has truly gone mad. ">

<ROOM STORY049
	(DESC "049")
	(STORY TEXT049)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<ROOM STORY050
	(DESC "050")
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

<ROOM STORY051
	(DESC "051")
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

<ROOM STORY052
	(DESC "052")
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

<ROOM STORY053
	(DESC "053")
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

<ROOM STORY054
	(DESC "054")
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

<ROOM STORY055
	(DESC "055")
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

<CONSTANT TEXT056 "Your sword rasps from its sheath. The youth starts to retreat, throwing his knife away and yelling at the top of his voice: \"Help, murder! A Judain tried to kill me! Help me!\"||Before you can sheathe your sword the shutters in the houses overlooking the street are flung open and the cry is taken up. A group of cobblers come advancing on you wielding their little hammers. Pots and pans rain down on your head from the windows above. A steaming hot sago pudding lands on your head and oozes down underneath your jerkin as you jump nimbly aside to avoid the contents ofa chamber pot. You have no choice but to flee before the mob overwhelms you.">

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

<ROOM STORY059
	(DESC "059")
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

<CONSTANT TEXT060 "You sprint for it, little caring that you will crush the poor snakes you tread on. They writhe underfoot and hiss balefully. You are half-way across the room .when you slip as one of the serpents rolls under the ball of your foot. You fall face down in a sea of serpentine coils and the envenomed fangs of the snakes are soon piercing your soft flesh and injecting the deadly venom. The poison of the garter snake is virulent indeed and you are soon dead. There is no one left to save the Judain now.">

<ROOM STORY060
	(DESC "060")
	(STORY TEXT060)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY061
	(DESC "061")
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

<ROOM STORY062
	(DESC "062")
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

<ROOM STORY063
	(DESC "063")
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

<CONSTANT TEXT064 "The brigands accept you into their band and though the life is hard you flourish. Within the year you lead your own band, preying on the rich and overlooking the psychopathic excesses of your men. You are a successful brigand leader, but the Judain perish in Godorno.||The next time you see the city it has sunk into the sea leaving only the tops of the fortresses and towers piercing the waves to show where the city that was once the jewel of the east now lies.">

<ROOM STORY064
	(DESC "064")
	(STORY TEXT064)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY065
	(DESC "065")
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

<CONSTANT TEXT066 "You summon up all your concentration and cast the puissant spell as the Jade Warriors lurch menacingly towards you. They are mere cyphers. There is no will within them to conquer. In vain you struggle to tamper with the circuits that set them in motion but it is quite beyond you. You are powerless as the Jade Warriors surround you and their razor-sharp swords slice into your vitals. You are slain and there is no one left to save the poor doomed Judain. Hate will conquer all.">

<ROOM STORY066
	(DESC "066")
	(STORY TEXT066)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT067 "\"There's a price on your head, Skakshi, my friend. Melmelo wants you dead and he's hired Hammer, the assassin, to take care of you.\"||\"It isn't true!\" he scoffs. \"Why should Melmelo want me dead?\"||\"He is afraid. He fears you seek to supplant him as guildmaster ofthieves. He has grown fat and worried on the juicy sinecures of the guild.\"||\"I'm going to find Melmelo and have it out with him once and for all,\" Skakshi snarls at this. He stalks out of the inn. In his high dudgeon he fails to notice you follow him, slinking stealthily through the shadows. Shadowing men is something you have done many times before -- there isn't an urchin of the streets who could lose you in the byways and cata- combs of Godorno.||Soon you are following Skakshi up the steps towards Melmelo's town stronghold. He walks past an ornamental steam bath that bubbles away in the garden. Melmelo's villa is built on the site of a thermal spring.">

<ROOM STORY067
	(DESC "067")
	(STORY TEXT067)
	(CONTINUE STORY356)
	(FLAGS LIGHTBIT)>

<ROOM STORY068
	(DESC "068")
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

<ROOM STORY069
	(DESC "069")
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

<ROOM STORY070
	(DESC "070")
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

<CONSTANT TEXT071 "Caiaphas's story of what has been the fate of their many friends is chilling. As soon as you fled the city, the Overlord's guards -- along with foreign mercenaries who marched out of beyond -- started to round up all the Judain they could find. The executions have been carried out all day every day since then. A few, like you, escaped from the city; several thousand have gone to ground; but most of your folk have already perished. You vow then and there to avenge your fellow Judain.||\"It is worse even than I have said,\" continues Caiaphas. \"Some have reported seeing a loathsome monster dragging its bulk through the streets at night. None knows where it comes from, but by daybreak there are always fewer people in the city.\"||\"What is it?\" you ask, aghast.||\"Hate itself The embodiment of cruelty. It has been awakened and given living form by the Over lord's excesses. Now it stalks the streets beyond even his power to control, and it will not rest until our city has become a desolate ruin.\"||You hear his words with horror.">

<ROOM STORY071
	(DESC "071")
	(STORY TEXT071)
	(CONTINUE STORY081)
	(FLAGS LIGHTBIT)>

<ROOM STORY072
	(DESC "072")
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

<ROOM STORY073
	(DESC "073")
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

<ROOM STORY074
	(DESC "074")
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

<ROOM STORY075
	(DESC "075")
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

<CONSTANT TEXT078 "\"I have been giving that matter much thought. It's not good for business with Hate disrupting the life of the city.\" Melmelo had the larceny side of business in the city nicely sewn up until the monster emerged from the catacombs. \"I can only think of one thing which might be the key to the city's salvation.\"||\"What is that?\" you ask, avidly.||\"The Jewel of Sunset Fire.\"||\"Where is this jewel?\"||Melmelo seems certain that it lies at the top of the Tower of the Sentinel at the east end of Fortuny Street. \"I have coveted it all my life. It is said to give wondrous powers to its wielder. But though many of us have tried to scale the tower -- both within, using stealth and cunning, and without, clinging like flies to the stones -- none of us survived.\"||\"I will survive,\" you say determinedly. You can be reasonably sure Melmelo is telling you the truth for he wants to see Hate vanquished as much as any man does. He is already .on top of the pile, here in Godorno.">

<ROOM STORY078
	(DESC "078")
	(STORY TEXT078)
	(CONTINUE STORY160)
	(CODEWORD CODEWORD-SUNSET)
	(FLAGS LIGHTBIT)>

<ROOM STORY079
	(DESC "079")
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

<CONSTANT TEXT080 "Conjuring a magical silver shield from thin air is the work of only a moment and you scoop a writhing interlocked mass of snakes aside, slowly and painstakingly clearing the way across the floor. The serpents hiss balefully, as if outraged to have been disturbed so unceremoniously. As soon as you sweep them aside, so they wriggle back towards you and it is a miracle that you reach the door at the other side of the room without being bitten.">

<ROOM STORY080
	(DESC "080")
	(STORY TEXT080)
	(CONTINUE STORY180)
	(FLAGS LIGHTBIT)>

<ROOM STORY081
	(DESC "081")
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

<CONSTANT TEXT082 " You choose a place where the road winds beneath copses of trees and wait. The horsemen are wearing the purple and black livery of the Overlord of Godomo and it seems they are tracking you. To attack them would be dangerous, there are too many of them you reluctantly decide, so you let them pass and double back making haste to put distance between yourself and your pursuers before they realize they have been thrown offthe scent.">

<ROOM STORY082
	(DESC "082")
	(STORY TEXT082)
	(CONTINUE STORY171)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT083 "You hack wildly at the purple flesh of Hate to free Mameluke, who strains against the suffocating flesh. Your sword rips dark maroon welts in the flesh of Hate which puckers and drools a pale pink viscous mucus. After three minutes of wild work with the sword your arms are aching, but Mameluke is able to pull himself free with one last effort. Pausing to wipe some of the pink mucus offyour face, you clasp the Tartar's hand and tell him you are taking him home for a bath. Hate's coil is twitching and still bleeding the pink mucus. Your skin crawls where the sticky secretions landed on your bare face. ">

<ROOM STORY083
	(DESC "083")
	(STORY TEXT083)
	(CONTINUE STORY185)
	(FLAGS LIGHTBIT)>

<ROOM STORY084
	(DESC "084")
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

<CONSTANT TEXT085 "Your journey back to the city takes no longer than your outward trek. By midday of the third day you are before the battlemented towers and guarded walls of the great city. Carrion crows wheel in great flocks above the city and the wind carries the dismal cries of the poor unfortunates being tortured in the prison fortress of Grond to your unwilling ears. You approach the gates with trepidation.">

<ROOM STORY085
	(DESC "085")
	(STORY TEXT085)
	(CONTINUE STORY188)
	(FLAGS LIGHTBIT)>

<ROOM STORY086
	(DESC "086")
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

<CONSTANT TEXT087 "You tried to leap too far. You fall with a thump among the writhing garter snakes. The snakes intertwine around your legs and arms, their forked tongues questing for bare flesh. They sink their venomed fangs into your flesh and your body is soon hot with poison. Unconsciousness comes as a blessed release. You are just another would-be thief. There is no one left alive to save theJl1dain now.">

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

<ROOM STORY089
	(DESC "089")
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

<CONSTANT TEXT092 "Your stiffened fingers lash out as fast as a striking cobra, jabbing into the cluster of nerves at the base ofhis palm. His fingers immediately go limp and he drops the knife without even feeling any pain. You snatch it up from the cobblestones before he can take stock of what has happened.||A moment later, he gives a sob of frustrated rage and launches a kick at your midriff. You easily catch his foot and draw it up, pulling him off-balance as you step closer to look him straight in the eye.||\"I wonder if you're also the sort who kicks dogs?\" you say softly, but with a hard look in your eye. \"Beware, if so. You'll find that we Judain are like wolfhounds. We bite back.\"||So saying, you give his leg a twist so that he is thrown over onto his back in the street. Pocketing his knife so that it cannot be used against another of your people, you saunter off in the direction of Greenbark Plaza.">

<ROOM STORY092
	(DESC "092")
	(STORY TEXT092)
	(CONTINUE STORY201)
	(ITEM KNIFE)
	(FLAGS LIGHTBIT)>

<ROOM STORY093
	(DESC "093")
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

<CONSTANT TEXT094 "The heads of each cell have risked coming together at the granary warehouse behind the old army stables on Slipshod Row. There are some two hundred people here, waiting for you to address them. Now that they are standing up to the Overlord, they are regaining their self respect. They report the number of their people dragged off to the Grand by the Overlord's guards is much diminished. Resistance fighters have assassinated over thirty key figures in the bureaucracy. If they continue to act with such success the Overlord will soon have to meet your demands.||\"There is bound to be a backlash,\" you caution.||\"Beware of anyone who is not of our people. They are jealous of us. At the end of this meeting, I am going to give you all new assignments and new safe houses in which to lie low. If we keep moving like this the Overlord's men can never find us all, even if they catch one of us for torture.\"||Your people are cheered to find you have thought about the situation and they look to you increasingly for leadership.">

<ROOM STORY094
	(DESC "094")
	(STORY TEXT094)
	(CONTINUE STORY160)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT095 "Tormil's sword seems to stick fast in the body of the purple mass. The weapon is pulled from his grasp and then the whole bloated purple mass rolls .over, crushing Tormil beneath it. His flattened body is already being absorbed. Terror draws bile into your throat and you cannot help giving a small cry of horror. Averting your face, you leave the grisly scene behind. You are ashamed to think you could have led any foe into such a trap, even a cur like Tormil.">

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

<CONSTANT TEXT099 "Your confident look unnerves him. He expected fear or anger but you treat him as if he were a harmless stranger asking the way. You guess from the red dye which stains his wrists that he is a tanner's son. Judging by the state ofhis clothing his father is poor, probably in debt to a Judain, else why would the youth show such malice towards you? You decide to bluff him.||\"Be careful, young one,\" you say, \"you know what happens if we Judain withdraw a loan -- debtors' prison or debt slavery if you can't pay up. You have a strong resemblance to one of my clients, a tanner down on his luck. Your father, perhaps?\"||You are lucky, your hunch was right. His father must be in debt. The youth won't risk harming you in case of losing the roof over his head. He slinks away.">

<ROOM STORY099
	(DESC "099")
	(STORY TEXT099)
	(CONTINUE STORY201)
	(FLAGS LIGHTBIT)>

<ROOM STORY100
	(DESC "100")
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

<CONSTANT TEXT105 "It looks like there is no back exit from this building, but you recall seeing a trap door in the alley running behind it. Dragging the frightened Ruth behind you, you descend to the cellar. Sure enough, there is a ramp for delivery of wine barrels. You make your escape, emerging in the alley at the back of the house while the soldiers are bursting in the front way.||Ruth cannot thank you enough. \"My baby will be born, thanks to you,\" she sobs as you lead her back to Copper Street.||\"I hope to save many others,\" you tell her. \"All our people, in fact.\" Once she is safe with Caiaphas, you return to your own bolthole. ">

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

<CONSTANT TEXT109 "Disturbed by your noise, the Overlord yawns, rubs sleep out of his eyes and looks about him. As he sees you his eyes widen with fear and.he reaches furtively beneath his pillow. He pulls out a small blowpipe and puffs out a tiny dart which bites into your neck like a hornet sting. It is tipped with curare, a very painful death. There is no one left now to save the Judain. Hate will subdue all.">

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

<CONSTANT TEXT113 "The landlord is ignoring you, cleaning glasses that already sparkle in the sombre red light. The pipes- moker gives you a glance, then turns away. You can hear two women gossiping about the fate of some of their Judain acquaintances. \"It wouldn't do to call them friends in these times -- well, would it, darling?\"||At the far end of the tavern the tall stranger is staring morosely at his drink, while Lucie watches him fondly.">
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

<CONSTANT TEXT141 "It is not hard to make contact with others of your kind. The Judain are well known for their sharpness and cunning. Word has been passed round among the Judain that all is not well with the other inhabitants of the city. Hundreds of people have mysteriously disappeared without trace. Something or somebody is carrying off the people of Godorno as they sleep.||There is a rumble outside as a town house crashes to the ground, killing its occupants. The very foundations of Godorno are rotten to the core.||A madman totters down the street shouting in a hoarse croak, \"We have brought it all upon ourselves. Too much evil, bad living, we are miserable sinners suffering the retribution of divine punishment ...\" He totters on, lapsing into a babble as he is pelted with mud by women washing clothes in a water butt. ">

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

<ROOM STORY143
	(DESC "143")
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

<CONSTANT TEXT144 "Standing beneath the Tower of the Sentinel, which looms three hundred feet above you against the glowering dusk sky, you feel very small and alone. If the greatest thieves of Godorno have tried to climb this tower and failed what hope is there for this poor Judain?||At the top of the Sentinel's tower, the jewel of Sunset Fire shines like a shooting star. The jewel of Sunset Fire is a so-called eye of power that can vanquish evil. The sheer-sided tower is chequered grey and red mosaic tiles, overlain with the black grime of centuries. It has stood on this spot since before the coming of the corsairs who ravaged the Old Empire. It was the lighthouse for Godorno before the sea level dropped in the great cataclysm. Looking up at the gaunt forbidding tower as it juts against the grey sky you are reminded of the frontispiece of a book you saw once -- The Tale of Nuth, Prince of Thieves -- which tells of the vain attempt to steal the jewel by the greatest thief of the Old Empire.||The black gate is reached under a trellis which is woven thickly with purple kiss-flowers, that smell unpleasantly like honeysuckle. To your surprise it opens at your touch and you walk into the atrium where small trees are growing in tubs. There is a curving marble staircase that leads up into the tower itself and you begin your long and dangerous climb.">

<ROOM STORY144
	(DESC "144")
	(STORY TEXT144)
	(CONTINUE STORY029)
	(FLAGS LIGHTBIT)>

<ROOM STORY145
	(DESC "145")
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

<ROOM STORY146
	(DESC "146")
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

<ROOM STORY147
	(DESC "147")
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

<CONSTANT TEXT148 "What a noble deed you have just done. They let Mameluke go and grasp you instead. They have no regard for the Judain and beat you to a pulp in the street, where they leave you to die. You will perish here and there is no one left to save the Judain.">

<ROOM STORY148
	(DESC "148")
	(STORY TEXT148)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY149
	(DESC "149")
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

<ROOM STORY150
	(DESC "150")
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

<ROOM STORY151
	(DESC "151")
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

<CONSTANT TEXT152 "There is nowhere to hide but inside the lime. There is lime dust everywhere, and wherever you go you leave a trail of chalky footsteps. You try to rub the footsteps away and burrow into the lime, leaving a small hole next to your nose to breathe through. As you lie there in the lime you daren't move in case someone sees you. But what if a small part of you is uncovered? Your dark clothes will be spotted against the white lime.||Your uncomfortable wait is ended when someone pokes a boathook into your side. The bargees clear the lime away from your head under the eyes of a group of the Overlord's soldiers.||\"It's a Judain,\" says one of the soldiers. Their captain orders them to knock you out and throw you in the river. Stuck inside the heavy mound of lime you are helpless as they cosh you over the head. You are food for the fishes.">

<ROOM STORY152
	(DESC "152")
	(STORY TEXT152)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY153
	(DESC "153")
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

<CONSTANT TEXT154 "With a word of power you unleash the Baffiement spell. It has no discernible effect on the monster but one of the guards goes glassy-eyed and his head lolls back into the pillow ofHate's body, to be submerged for ever in the orgy of despair. The monster convulses suddenly, throwing a coil out towards you. You decide it is time to flee back to your hidey-hole on Bumble Row.">

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

<ROOM STORY160
	(DESC "160")
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

<CONSTANT TEXT161 "You slink back into the catacombs, dousing your lantern so you will not be discovered. You are soon under the stables. It is cold and damp down here, but there is a strong breeze, almost a gale. The air should be still here under the city, like the nighted airs of the pyramids of the ancients. Hate has undermined it so much that part of the catacombs have come to light, you guess. That means the monsters that have lurked here since the city was built will be wandering out onto the streets to add to the woes of the poor cityfolk. Since the storm drains prove to be blocked, you enter the burial crypts of the Megiddo dynasty.">

<ROOM STORY161
	(DESC "161")
	(STORY TEXT161)
	(CONTINUE STORY365)
	(FLAGS LIGHTBIT)>

<ROOM STORY162
	(DESC "162")
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

<CONSTANT TEXT163 "You throw down the sword just in time as the monster tries to lap its black wings over you. The Overlord begins to wake up and the monster floats up again to attack you. You decide discretion is the better part of valour and retreat, leaving the concubine to her fate. By the look of her she will be one of Hate's many guests before the night is out.">

<ROOM STORY163
	(DESC "163")
	(STORY TEXT163)
	(CONTINUE TEXT161)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT164 "As you make a dash for the jewel the spider drops to flatten you. Its heavy bloated black sack of an abdomen engulfs you and you are borne to the floor, where you begin to suffocate. Terror lends you the strength of seven men but even as you try to fight your way clear so the spider's venom does its deadly work. The likeness of you at the top of the stairs did indeed tell the story ofyour grisly and hopeless fate. The Jewel of Sunset Fire cannot so easily be stolen from the tower. There is no one left to save the Judain now. Hate will subdue all.">

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

<ROOM STORY166
	(DESC "166")
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

<ROOM STORY167
	(DESC "167")
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

<CONSTANT TEXT168 "You start to swing your amulet like a pendulum and begin to hum softly. The heads of the snakes sway gently in time, like wheat in the summer breeze. Still humming the charm, you step onto the living carpet which writhes beneath your sole, while baleful hisses warn you not to linger. Garter snakes coil around your thighs but they are nestling there and do not bury their venom-tipped fangs in your soft flesh.||You step trancelike across the living carpet of snakes and through the far door, where you face another spiral staircase. Once outside the door the snake coils loosen and they glide to the floor out of sight.">

<ROOM STORY168
	(DESC "168")
	(STORY TEXT168)
	(CONTINUE STORY180)
	(FLAGS LIGHTBIT)>

<ROOM STORY169
	(DESC "169")
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

<ROOM STORY170
	(DESC "170")
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

<ROOM STORY171
	(DESC "171")
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

<CONSTANT TEXT172 "At least this way you live to fight another day. You reach the bottom of the tower again safely and as you walk back out onto the path to the street the great bronze doors swing shut with a sound like the knell ofdoom. You try the gates but they are sealed shut. You needn't worry -- Melmelo, the guildmaster ofthieves, probablyjust wanted to get his own hands on the jewel. He can go to the trouble of finding it for himself. You slink back to Bumble Row. ">

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

<CONSTANT TEXT174 "Exploiting the rekindled morale of the Judain resistance and the other townsfolk who are rallying to your banner, you make your plans for the defence of the city. Ifyou construct barricades in certain sectors of the city you can challenge the Overlord's authority. If his men cannot capture the barricades all will know that the writing is on the wall; it will only be a matter of time before you are storming the palace.||The barricade is composed of flagstones and carts, doors stripped from nearby deserted houses, and even pews from the nearest temple. The carts have been laden with mud. Even an elephant could not break through. The blockage is ten feet high and in places a parapet has been built on the defender's side from which potshots can be taken at the Overlord's city guards as they advance. You have archers in the windows and on the roofs of the houses on either side of the barricade. Morale is high; the stories of your exploits have placed you high in the esteem of your people.||But you have not chosen the sites for your barricades well. The Overlord's guards are quick to exploit your mistake. They pour a rain of crossbow quarrels from the roof into the brave defenders, slaughtering many, before charging the barricade. The ensuing battle is a slaughter. The guards have roused themselves to one'last great effort to reclaim the streets of the city and they are putting the brave defenders to the sword. You decide discretion is the better part of valour and retreat to Bumble Row.">

<ROOM STORY174
	(DESC "174")
	(STORY TEXT174)
	(CONTINUE STORY041)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT175 "You muse on the good fortune of finding your fellows so well provided for. \"A talent, more than I could have hoped for in my wildest dreams. With a talent of gold we can buy all the help we need.\"||\"Ah, but taking gold from Judain is a capital offence, punishable by impalement.\"||\"Even talking to a Judain is a capital offence, unless you are interrogating one.\"||\"Are we not the Judain? Have we not the merchant's silver tongue? We have never wanted for those to do our bidding in the past.\"||\"In the past the people were not in the grip offear. Where once they thought oflining their pockets they now count themselves lucky if they can line their stomachs and stay out of trouble.\"">

<ROOM STORY175
	(DESC "175")
	(STORY TEXT175)
	(CONTINUE STORY190)
	(FLAGS LIGHTBIT)>

<ROOM STORY176
	(DESC "176")
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

<CONSTANT TEXT179 "He is a tough-looking burly man and obviously used to dealing with rowdies like yourself. He snatches up a bottle ready to smash it against your skull. He had not reckoned with your skill at unarmed combat, however. You wrestle with him, throwing him against the bar repeatedly and then seizing his right arm and twisting it up behind his back. Your skill and speed are too much for his brute strength -- and your mental attitude has been hardened by adversity as you have watched the rape of your people.||He is in pain now and submits, becoming totally still. You make him pour you a drink ofale and ask him about Lucie and her friend.">

<ROOM STORY179
	(DESC "179")
	(STORY TEXT179)
	(CONTINUE STORY209)
	(FLAGS LIGHTBIT)>

<CONSTANT TEXT180 "Various cabbalistic signs like ancient cave paintings have been daubed on the outside ofthe topmost door in terracotta and charcoal. If your hopes are not disappointed the Jewel of Sunset Fire lies inside this topmost room||At the top of the staircase is a series of frescoes showing the tower and depicting the grisly fates that befall those who rashly try to climb it. To your absolute horror and consternation the final fresco is a picture of you, squashed flat beneath a gigantic bloated black spider. Above the spider you can see the orb shining brightly in its frame.||You walk on up a narrower spiral of stairs that lines the outer wall and at last pause before the final door. Gingerly you push it open, wincing at the creak of its rusty hinges. There is a brooding presence of evil here. Your heart hammers in your chest as you step forward.">

<ROOM STORY180
	(DESC "180")
	(STORY TEXT180)
	(CONTINUE STORY150)
	(FLAGS LIGHTBIT)>

<ROOM STORY181
	(DESC "181")
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

<ROOM STORY182
	(DESC "182")
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

<CONSTANT TEXT183 "An hour before dusk the members ofthe crew return from whichever wine cellar they have been squandering their money in and prepare to cast off. They look over their cargo briefly but do not notice you huddled under a pile of ropes. They sing as they pole the barge, a sombre song with a pounding beat about how a man may toil his whole life away and at the end have nothing to show for it but the clothes he will die in.||You guess from the movements of the barge it has turned up the Palayal river. You are being borne towards the Great Forest. You guess they are making for the town ofBagoe twenty miles upriver. You lie still, listening to the lapping ofwater at the bows and feeling the rhythmic surge as the crew drives the barge on, poling in time. After three hours of dirges the crew tie up for the rest of the night against the deserted riverbank. While they snore you leap from barge to shore and walk inland to the Bagoe road.">

<ROOM STORY183
	(DESC "183")
	(STORY TEXT183)
	(CONTINUE STORY222)
	(FLAGS LIGHTBIT)>

<ROOM STORY184
	(DESC "184")
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

<ROOM STORY185
	(DESC "185")
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

<ROOM STORY186
	(DESC "186")
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

<ROOM STORY187
	(DESC "187")
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

<ROOM STORY188
	(DESC "188")
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

<CONSTANT TEXT189 "Placing a money pouch on the bar, you ask, \"Tell me about Lucie. Does she frequent the Silver Eel often? And who is her companion?\"||The landlord pockets the money pouch after first weighing it carefully in his hand. He glances nervously at the gang of four and says, \"Yes, she haunts this place often. She's never alone. I see some of them again and again but she has a lot of friends, does little Lucie. She's a ornery girl that one. Knows her own mind and no mistake. Forever taking up with the most disreputable mountebanks and desperadoes. Always twists 'em round her little finger, mind.\"||\"And what about her friend?\"||\"That's Tyutchev, a foreigner. See how pale he is? Doesn't it make you feel ill just to look at him? He usually comes in with his doxy, Cassandra -- or is it he is her pretty boy? She's a terrible proud and beautiful woman, wearing gear like a Fury from the Abyss. At any rate, they had a terrible fight in here last week. I never saw a woman wield a sword with such skill and venom. It glowed cold blue, and where it struck the bar I found crystals of ice.\"||\"Who won the fight?\" you ask, incredulous.||\"They were both bleeding badly. It was a terrible battle. But they went out together. I do declare I've never had the misfortune to serve two less pleasant and outright perilous characters.\"||\"What do they all want with Lucie?\" you wonder aloud.||He cracks a rancid-toothed smile. \"What does any man want with Lucie?\"||You thank the landlord for his information and, leaving the alepot on the bar, walk over to the couple, who are watching you intently. Lucie smiles as she did when you met her in the street.">

<ROOM STORY189
	(DESC "189")
	(STORY TEXT189)
	(CONTINUE STORY227)
	(COST 3)
	(FLAGS LIGHTBIT)>

<ROOM STORY190
	(DESC "190")
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

<ROOM STORY191
	(DESC "191")
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

<ROOM STORY192
	(DESC "192")
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

<ROOM STORY193
	(DESC "193")
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

<ROOM STORY194
	(DESC "194")
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

<ROOM STORY197
	(DESC "197")
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

<CONSTANT TEXT198 "Tyutchev has led you into a trap. As a net is dropped from an archway above, entangling you, Tyutchev spins on his heel and slices yout head from your shoulders with a single blow of his sword. You took one chance too many. No one is left to save your people now.">

<ROOM STORY198
	(DESC "198")
	(STORY TEXT198)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY199
	(DESC "199")
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

<CONSTANT TEXT200 "You take your usual care in the alleys and backways of the old city but this time your sixth sense has failed you. An assassin has you in the sights of his crossbow. A poisoned bolt catches you in the shoulder, spinning you round so that you fall in an ungainly heap on the cobblestones. Someone had marked you out, for what reason, you will never know. There is no one left to save the Judain now. Hate will conquer all.">

<ROOM STORY200
	(DESC "200")
	(STORY TEXT200)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY201
	(DESC "201")
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

<ROOM STORY202
	(DESC "202")
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

<CONSTANT TEXT203 "As you go to step on a piece of mosaic majolica, your foot feels no resistance. You have stepped off the side of the tower and with a dreadful heave of the stomach you realize you are falling two hundred feet to be smashed on the rocks of what was once the entrance to Old Godorno harbour. Who will save your people now? Not you, a shattered body at the base of the Tower of the Sentinel. ">

<ROOM STORY203
	(DESC "203")
	(STORY TEXT203)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY204
	(DESC "204")
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

<ROOM STORY205
	(DESC "205")
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

<ROOM STORY206
	(DESC "206")
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

<ROOM STORY207
	(DESC "207")
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

<ROOM STORY208
	(DESC "208")
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

<ROOM STORY209
	(DESC "209")
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

<ROOM STORY210
	(DESC "210")
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

<ROOM STORY211
	(DESC "211")
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

<ROOM STORY212
	(DESC "212")
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

<CONSTANT TEXT213 "Your search for another amulet is interrupted by the venomed blade of Skakshi the master thief. He has crept up on you unseen and unheard as only a master rogue can. He turns the knife in your vitals and you die at his han<l;s. If only you hadn't lost your charm amulet it might have warned you of the danger. There is no one left to save the Judain now. Hate will subdue all.">

<ROOM STORY213
	(DESC "213")
	(STORY TEXT213)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY214
	(DESC "214")
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

<ROOM STORY215
	(DESC "215")
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

<ROOM STORY216
	(DESC "216")
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

<ROOM STORY217
	(DESC "217")
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

<ROOM STORY218
	(DESC "218")
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

<ROOM STORY219
	(DESC "219")
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

<CONSTANT TEXT220 "You throw yourselfdown on your bed in the row of crooked houses down Bumble Row and try to sleep. A taint in the air stops your slumber and there is a sound like wet kippers being thrown onto a marble slab. It is getting louder. You roll off your bed in time to see a purple veil close over the door. Hate has sealed you in. Its skin starts to swell into a great blister which slowly expands until it covers the whole room. You are caught up in the coils of Hate and have joined the eternal orgy of despair. You cannot even save yourself now, much less your oppressed people.">

<ROOM STORY220
	(DESC "220")
	(STORY TEXT220)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY221
	(DESC "221")
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

<ROOM STORY222
	(DESC "222")
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

<ROOM STORY223
	(DESC "223")
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

<ROOM STORY224
	(DESC "224")
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

<ROOM STORY225
	(DESC "225")
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

<ROOM STORY226
	(DESC "226")
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

<ROOM STORY227
	(DESC "227")
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

<ROOM STORY228
	(DESC "228")
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

<ROOM STORY229
	(DESC "229")
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

<ROOM STORY230
	(DESC "230")
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

<ROOM STORY231
	(DESC "231")
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

<ROOM STORY232
	(DESC "232")
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

<ROOM STORY233
	(DESC "233")
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

<ROOM STORY234
	(DESC "234")
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

<ROOM STORY235
	(DESC "235")
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

<ROOM STORY236
	(DESC "236")
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

<ROOM STORY237
	(DESC "237")
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

<CONSTANT TEXT238 "You are soon trussed up, helpless, and frogmarched into the prison fortress of Grond to join hundreds more of your people. You will never see the light of day again. There is no one left to save your people now. They will all perish and be wiped from the face of the earth.">

<ROOM STORY238
	(DESC "238")
	(STORY TEXT238)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY239
	(DESC "239")
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

<ROOM STORY240
	(DESC "240")
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

<ROOM STORY241
	(DESC "241")
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

<CONSTANT TEXT242 "It takes too long for you to concentrate your mind on the Rulership spell. You need to marshal every atom of your strength of will for this spell and your preparations are rudely and painfully interrupted by Skakshi's second stiletto dagger which buries its tip in your heart. You fall dead and there is no one left to save the wretched Judain from being wiped out for ever.">

<ROOM STORY242
	(DESC "242")
	(STORY TEXT242)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY243
	(DESC "243")
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

<ROOM STORY244
	(DESC "244")
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

<ROOM STORY245
	(DESC "245")
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

<ROOM STORY246
	(DESC "246")
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

<ROOM STORY247
	(DESC "247")
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

<ROOM STORY248
	(DESC "248")
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

<ROOM STORY249
	(DESC "249")
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

<ROOM STORY250
	(DESC "250")
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

<ROOM STORY251
	(DESC "251")
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

<ROOM STORY252
	(DESC "252")
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

<ROOM STORY253
	(DESC "253")
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

<ROOM STORY255
	(DESC "255")
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

<ROOM STORY256
	(DESC "256")
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

<ROOM STORY257
	(DESC "257")
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

<ROOM STORY260
	(DESC "260")
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

<ROOM STORY261
	(DESC "261")
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

<ROOM STORY262
	(DESC "262")
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

<ROOM STORY263
	(DESC "263")
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

<ROOM STORY264
	(DESC "264")
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

<ROOM STORY265
	(DESC "265")
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

<ROOM STORY266
	(DESC "266")
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

<CONSTANT TEXT267 "The honeyed ale slips down your gullet, filling your stomach with a heavy warm glow. The amber nectar is thick and almost sticky, yet strangely moreish. You finish the pot with relish, wipe your mouth backhanded and fall suddenly to the floor. The landlord has poisoned you in revenge for the pain you caused with your spell. You will not live to see this day out and there is no one who can save your people from extinction.">

<ROOM STORY267
	(DESC "267")
	(STORY TEXT267)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY268
	(DESC "268")
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

<ROOM STORY269
	(DESC "269")
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

<CONSTANT TEXT270 "The Overlord's soldiers close on you with drawn swords. You fight for your life valiantly, your blade thrumming through the air, but you can't keep them off for ever. There are too many foes and they cut you down, while the townsfolk howl with glee. Your dying thought is, \"How could I have been so foolish to think I could fight my way out of this?\"">

<ROOM STORY270
	(DESC "270")
	(STORY TEXT270)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY271
	(DESC "271")
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

<ROOM STORY272
	(DESC "272")
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

<ROOM STORY273
	(DESC "273")
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

<ROOM STORY274
	(DESC "274")
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

<ROOM STORY275
	(DESC "275")
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

<ROOM STORY276
	(DESC "276")
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

<ROOM STORY277
	(DESC "277")
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

<ROOM STORY278
	(DESC "278")
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

<ROOM STORY279
	(DESC "279")
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

<ROOM STORY280
	(DESC "280")
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

<ROOM STORY281
	(DESC "281")
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

<ROOM STORY282
	(DESC "282")
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

<ROOM STORY283
	(DESC "283")
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

<CONSTANT TEXT284 "The Overlord's soldiers close in on you with drawn swords. You fight for your life valiantly. Your fists and feet are a blur, but you can't keep them off for ever. There are too many foes and they cut you down while the townsfolk howl with glee. Your dying thought is: \"How could I have been so foolish to think I could fight my way out ot this?\"">

<ROOM STORY284
	(DESC "284")
	(STORY TEXT284)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY285
	(DESC "285")
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

<ROOM STORY286
	(DESC "286")
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

<ROOM STORY287
	(DESC "287")
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

<ROOM STORY288
	(DESC "288")
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

<CONSTANT TEXT289 "Seizing the bridle you vault into the saddle. The chestnut horse bucks and then, arching its back, makes a series of straight-legged jumps that shake you from the saddle before you can settle. You fall to the cobbles, stunned, listening in a detached way as the hoofbeats of your pursuers come closer and stop. Your head is swimming as the soldiers dismount.||\"Judain scum,\" says one of them, plunging a sword in your back, killing you as if you were no more than a dog. \"That's one less to worry about,\" he says.">

<ROOM STORY289
	(DESC "289")
	(STORY TEXT289)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY290
	(DESC "290")
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

<ROOM STORY291
	(DESC "291")
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

<ROOM STORY292
	(DESC "292")
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

<ROOM STORY293
	(DESC "293")
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

<ROOM STORY294
	(DESC "294")
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

<CONSTANT TEXT295 "Hate reaches for the crumbling building on either side of the street. Locking its tentacles around the famous Bridge of Sighs, it brings the whole structure <;rashing down on your head. You fall and are crushed under the rubble, while Hate goes lumbering past to bring about the final end of the cursed city of Godorno. You have failed.">

<ROOM STORY295
	(DESC "295")
	(STORY TEXT295)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY296
	(DESC "296")
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

<ROOM STORY297
	(DESC "297")
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

<ROOM STORY298
	(DESC "298")
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

<ROOM STORY299
	(DESC "299")
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

<ROOM STORY300
	(DESC "300")
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

<ROOM STORY301
	(DESC "301")
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

<ROOM STORY302
	(DESC "302")
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

<ROOM STORY303
	(DESC "303")
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

<ROOM STORY304
	(DESC "304")
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

<CONSTANT TEXT305 "There is a faint whispering sound above and the black shape settles heavily over you. Its skin sports rows of barbed spines that inject a poison into your bloodstream. Try as you might, you can't break free. The poison turns your blood to cloying syrup and your heart stops beating. You have died when revenge for the Judain was almost within your grasp. Hate will subdue all.">

<ROOM STORY305
	(DESC "305")
	(STORY TEXT305)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY306
	(DESC "306")
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

<ROOM STORY307
	(DESC "307")
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

<ROOM STORY308
	(DESC "308")
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

<ROOM STORY309
	(DESC "309")
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

<ROOM STORY310
	(DESC "310")
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

<ROOM STORY311
	(DESC "311")
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

<CONSTANT TEXT312 "It takes too long for you to concentrate your mind to produce the magical effect of the Visceral Pang. Your preparations are rudely and painfully interrupted by Skakshi's second stiletto dagger which buries its tip in your heart. You fall dead and there is no one left to save the wretched Judain from being wiped out for ever.">

<ROOM STORY312
	(DESC "312")
	(STORY TEXT312)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY313
	(DESC "313")
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

<ROOM STORY314
	(DESC "314")
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

<ROOM STORY315
	(DESC "315")
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

<ROOM STORY316
	(DESC "316")
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

<ROOM STORY317
	(DESC "317")
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

<ROOM STORY319
	(DESC "319")
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

<ROOM STORY320
	(DESC "320")
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

<ROOM STORY321
	(DESC "321")
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

<ROOM STORY322
	(DESC "322")
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

<ROOM STORY323
	(DESC "323")
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

<ROOM STORY324
	(DESC "324")
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

<CONSTANT TEXT325 "Hate has nourished itself on your evil thoughts of murder and revenge. You are ready now, a soul already lost. Tonight you will walk open-armed into the sickly embrace of Hate and give yourself up for ever, sucked into Hate's orgy of despair. There is no one left to save your fellow Judain. Hate will conquer all.">

<ROOM STORY325
	(DESC "325")
	(STORY TEXT325)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY326
	(DESC "326")
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

<ROOM STORY327
	(DESC "327")
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

<ROOM STORY328
	(DESC "328")
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

<ROOM STORY329
	(DESC "329")
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

<ROOM STORY330
	(DESC "330")
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

<ROOM STORY331
	(DESC "331")
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

<ROOM STORY332
	(DESC "332")
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

<ROOM STORY333
	(DESC "333")
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

<ROOM STORY334
	(DESC "334")
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

<CONSTANT TEXT335 "Your mighty struggles are in vain. You are not ready for this untimely death. There is no one left now to save your people.||Memories of the times you have felt Hate smoulder in your breast come unbidden into your mind and the strength seems to drain out of your muscles. The warm wet embrace of Hate welcomes you and your body is slowly and inexorably drawn inch by inch into the seething mass of the monster. Soon your head too is being drawn in. Your arms and legs have gone numb and you start to fight for breath as your nostrils and lips are sealed over by the soft purple flesh of Hate. You drown in the body of Hate and the city has lost its only saviour. Your tormented half-life has begun.">

<ROOM STORY335
	(DESC "335")
	(STORY TEXT335)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY336
	(DESC "336")
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

<ROOM STORY337
	(DESC "337")
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

<ROOM STORY338
	(DESC "338")
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

<ROOM STORY339
	(DESC "339")
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

<ROOM STORY340
	(DESC "340")
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

<ROOM STORY343
	(DESC "343")
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

<ROOM STORY344
	(DESC "344")
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

<ROOM STORY346
	(DESC "346")
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

<ROOM STORY348
	(DESC "348")
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

<ROOM STORY352
	(DESC "352")
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

<ROOM STORY353
	(DESC "353")
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

<ROOM STORY354
	(DESC "354")
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

<ROOM STORY355
	(DESC "355")
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

<ROOM STORY356
	(DESC "356")
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

<ROOM STORY357
	(DESC "357")
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

<ROOM STORY358
	(DESC "358")
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

<ROOM STORY359
	(DESC "359")
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

<ROOM STORY360
	(DESC "360")
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

<ROOM STORY361
	(DESC "361")
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

<ROOM STORY362
	(DESC "362")
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

<ROOM STORY363
	(DESC "363")
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

<ROOM STORY364
	(DESC "364")
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

<ROOM STORY365
	(DESC "365")
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

<ROOM STORY366
	(DESC "366")
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

<ROOM STORY367
	(DESC "367")
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

<ROOM STORY368
	(DESC "368")
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

<ROOM STORY369
	(DESC "369")
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

<ROOM STORY370
	(DESC "370")
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

<ROOM STORY371
	(DESC "371")
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

<CONSTANT TEXT372 "To your horror your spell backfires, singeing your eyebrows. Before you can recover the guards, who know better than to allow a magician time to cast a second spell, run you through with their rapiers, while the old woman screams with the shock of it. There is no one left alive to save the Judain now. They will all perish and be wiped from the face of the earth.">

<ROOM STORY372
	(DESC "372")
	(STORY TEXT372)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY373
	(DESC "373")
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

<ROOM STORY374
	(DESC "374")
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

<CONSTANT TEXT375 "You have the Jewel of Sunset Fire with which to focus the rays of the setting sun on the monster but you have no way of tethering Hate so that it must suffer the searing agony of the jewel until death wracks it. You stand alone upon the parapet of the Bargello, focusing the jewel, and Hate writhes in anguish. But the monster raises itself up, towering above you and then drops like an avalanche, crushing you into the midst of a mound of rubble that was once the strongest building in the city. The monster carries all before it. You lose the sword inside its flesh and soon you are all partners in the eternal orgy of despair. The city crumbles and is lost for ever beneath the waves. Hate has completed its work.">

<ROOM STORY375
	(DESC "375")
	(STORY TEXT375)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY376
	(DESC "376")
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

<CONSTANT TEXT377 "You have taken the wrong course. You have never seen a man so skilled with a sword as the tall pale-faced Tyutchev. He is fast and strong too, and he cuts you down in a welter of blood and iron. Lucie looks on mournfully as he delivers the coup de grace, severing your head from your shoulders. There is no one left to save the Judain now. Hate will subdue all.">

<ROOM STORY377
	(DESC "377")
	(STORY TEXT377)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY378
	(DESC "378")
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

<ROOM STORY379
	(DESC "379")
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

<ROOM STORY380
	(DESC "380")
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

<ROOM STORY381
	(DESC "381")
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

<ROOM STORY382
	(DESC "382")
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

<ROOM STORY383
	(DESC "383")
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

<ROOM STORY384
	(DESC "384")
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

<ROOM STORY385
	(DESC "385")
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

<ROOM STORY386
	(DESC "386")
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

<ROOM STORY387
	(DESC "387")
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

<ROOM STORY388
	(DESC "388")
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

<ROOM STORY389
	(DESC "389")
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

<ROOM STORY390
	(DESC "390")
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

<ROOM STORY391
	(DESC "391")
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

<ROOM STORY392
	(DESC "392")
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

<CONSTANT TEXT393 "If only you had taken the time to bandage your wound and staunch the flow of blood. The leg of your breeches is soaked and you are leaving red telltale footprints behind as you try to sidle past the line of guard. They could follow you as easily as if you had left chalk ar;rows on the ground. One of them sees the blood, shouts and points in your direction. They all fire their bows at you. It is a mercifully sudden death. There is no one left now to save the Judain. They will all perish and be wiped from the face of the earth.">

<ROOM STORY393
	(DESC "393")
	(STORY TEXT393)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY394
	(DESC "394")
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

<ROOM STORY395
	(DESC "395")
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

<CONSTANT TEXT396 "All you have in the way of weaponry to defeat Hate is the Jade Warrior's sword. It is a potent magical weapon but it is perhaps a forlorn hope that it will allow you to vanquish the monster. Still, it is all the hope you have. You lead your doomed people in a final stand against Hate. The monster carries all before it. You lose the sword inside its flesh and soon you are all partners in the eternal orgy of despair. The city crumbles and is lost for ever beneath the waves. Hate has completed its work.">

<ROOM STORY396
	(DESC "396")
	(STORY TEXT396)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY397
	(DESC "397")
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

<CONSTANT TEXT398 "You offer one of the gate guards money, but he just says, \"It's more than my life's worth to open the gate when the bell tolls. You'd best come with me ...\"||He lays a calloused hand on your shoulder, then turns to call to his fellow guards: \"Got one here -- a Judain! Tried to bribe me.\"||He steps back as ifto let you go but it is only to move away from you, the target of the other guards' crossbows. Your body is peppered with crossbow bolts and you fall to the ground.||\"That's one less ofthose scum,\" says another guard as you die.">

<ROOM STORY398
	(DESC "398")
	(STORY TEXT398)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY399
	(DESC "399")
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

<CONSTANT TEXT400 "You disappear through the jaws of Hate. As it absorbs you into its being, it begins to be wracked by spasms of pain. It cannot tolerate the presence of goodness within its very being. Shuddering, Hate tries to flee back to the sewers, but it is rotting away by the moment. The people come out of hiding to watch as it dwindles. They take up rocks and sticks and pelt the dying monster. The Overlord's men stand shoulder to shoulder with Judain resistance fighters, smiting their common enemy. At last Hate gives a forlorn screech and dies, turning to dust which is carried off by the wind.||You lost your life, but you died a martyr's death, bringing salvation to your people and your city.">

<ROOM STORY400
	(DESC "400")
	(STORY TEXT400)
	(VICTORY T)
	(FLAGS LIGHTBIT)>

<ROOM STORY401
	(DESC "401")
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

<ROOM STORY402
	(DESC "402")
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

<ROOM STORY403
	(DESC "403")
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

<ROOM STORY404
	(DESC "404")
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

<CONSTANT TEXT405 "There is no way out. The crossbows of the guards pepper your body with quarrels and you fall dead to the cobbled street in a pool of blood. The old egg-seller steals your purse and goes on her way. There is no one left now to save the Judain. Hate will subdue all.">

<ROOM STORY405
	(DESC "405")
	(STORY TEXT405)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY406
	(DESC "406")
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

<ROOM STORY407
	(DESC "407")
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

<CONSTANT TEXT408 "Your leadership has so inspired your people that they are prepared to man the barricade against Hate itself. They pelt it with missiles and arrows and hack at it with swords, cleavers and boathooks but all to no avail. Hate dines well today as it rolls over the barricade crushing everything there to a pulp. You could not desert your people now and you too are flattened and drawn in to the eternal orgy of despair. Hate will conquer all.">

<ROOM STORY408
	(DESC "408")
	(STORY TEXT408)
	(DEATH T)
	(FLAGS LIGHTBIT)>

<ROOM STORY409
	(DESC "409")
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

<ROOM STORY410
	(DESC "410")
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

<ROOM STORY411
	(DESC "411")
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

<ROOM STORY412
	(DESC "412")
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

<ROOM STORY413
	(DESC "413")
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

<ROOM STORY414
	(DESC "414")
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

<ROOM STORY415
	(DESC "415")
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

<CONSTANT TEXT416 "Then there is a murmuring from the catacombs: a sound that grows and swells from a hum to a roar. The lost souls are free once more and they climb into the streets to hail you as their saviour. You are a hero and you will be feted for a hundred days. Now is the time for the banquet at the Overlord's palace that you have promised your people. Together you will rebuild Godorno and make it once more the jewel of the east. You are carried aloft to the palace and set on the throne despite all your protestations. The city is yours. At last the Judain need have no fear.">

<ROOM STORY416
	(DESC "416")
	(STORY TEXT416)
	(VICTORY T)
	(FLAGS LIGHTBIT)>
