---------------------------------------
-----  Basic English descriptions -----
---------------------------------------

-- FORMAT: Item ID | Name | Description

-- Special character markup:
-- ↑ = Up Arrow  |  ↓ = Down Arrow  |  # = Starts a new line
-- More can be found here: https://github.com/wofsauge/External-Item-Descriptions/wiki/Markup

local languageCode = "en_us"

-- init en_us table
EID.descriptions[languageCode] = {}
EID.descriptions[languageCode].custom = {} -- table for custom entity descriptions
EID.descriptions[languageCode].languageName = "English"

-- Fonts to be used with this language pack
EID.descriptions[languageCode].fonts = {{name="default"}, {name="inverted"}, {name="borderless"}}

---------- Collectibles ----------

EID.descriptions[languageCode].collectibles={
	{"1", "The Sad Onion", ""}, -- The Sad Onion
	{"2", "The Inner Eye", ""}, -- The Inner Eye
	{"3", "Spoon Bender", ""}, -- Spoon Bender
	{"4", "Cricket's Head", ""}, -- Cricket's Head
	{"5", "My Reflection", ""}, -- My Reflection
	{"6", "Number One", ""}, -- Number One
	{"7", "Blood of the Martyr", ""}, -- Blood of the Martyr
	{"8", "Brother Bobby", ""}, -- Brother Bobby
	{"9", "Skatole", ""}, -- Skatole
	{"10", "Halo of Flies", ""}, -- Halo of Flies
	{"11", "1up!", ""}, -- 1up!
	{"12", "Magic Mushroom", ""}, -- Magic Mushroom
	{"13", "The Virus", ""}, -- The Virus
	{"14", "Roid Rage", ""}, -- Roid Rage
	{"15", "<3", ""}, -- <3
	{"16", "Raw Liver", ""}, -- Raw Liver
	{"17", "Skeleton Key", ""}, -- Skeleton Key
	{"18", "A Dollar", ""}, -- A Dollar
	{"19", "Boom!", ""}, -- Boom!
	{"20", "Transcendence", ""}, -- Transcendence
	{"21", "The Compass", ""}, -- The Compass
	{"22", "Lunch", ""}, -- Lunch
	{"23", "Dinner", ""}, -- Dinner
	{"24", "Dessert", ""}, -- Dessert
	{"25", "Breakfast", ""}, -- Breakfast
	{"26", "Rotten Meat", ""}, -- Rotten Meat
	{"27", "Wooden Spoon", ""}, -- Wooden Spoon
	{"28", "The Belt", ""}, -- The Belt
	{"29", "Mom's Underwear", ""}, -- Mom's Underwear
	{"30", "Mom's Heels", ""}, -- Mom's Heels
	{"31", "Mom's Lipstick", ""}, -- Mom's Lipstick
	{"32", "Wire Coat Hanger", ""}, -- Wire Coat Hanger
	{"33", "The Bible", ""}, -- The Bible
	{"34", "The Book of Belial", ""}, -- The Book of Belial
	{"35", "The Necronomicon", ""}, -- The Necronomicon
	{"36", "The Poop", ""}, -- The Poop
	{"37", "Mr. Boom", ""}, -- Mr. Boom
	{"38", "Tammy's Head", ""}, -- Tammy's Head
	{"39", "Mom's Bra", ""}, -- Mom's Bra
	{"40", "Kamikaze!", ""}, -- Kamikaze!
	{"41", "Mom's Pad", ""}, -- Mom's Pad
	{"42", "Bob's Rotten Head", ""}, -- Bob's Rotten Head
	{"43", "", ""},
	{"44", "Teleport!", ""}, -- Teleport!
	{"45", "Yum Heart", ""}, -- Yum Heart
	{"46", "Lucky Foot", ""}, -- Lucky Foot
	{"47", "Doctor's Remote", ""}, -- Doctor's Remote
	{"48", "Cupid's Arrow", ""}, -- Cupid's Arrow
	{"49", "Shoop da Whoop!", ""}, -- Shoop da Whoop!
	{"50", "Steven", ""}, -- Steven
	{"51", "Pentagram", ""}, -- Pentagram
	{"52", "Dr. Fetus", ""}, -- Dr. Fetus
	{"53", "Magneto", ""}, -- Magneto
	{"54", "Treasure Map", ""}, -- Treasure Map
	{"55", "Mom's Eye", ""}, -- Mom's Eye
	{"56", "Lemon Mishap", ""}, -- Lemon Mishap
	{"57", "Distant Admiration", ""}, -- Distant Admiration
	{"58", "Book of Shadows", ""}, -- Book of Shadows
	{"59", "", ""},
	{"60", "The Ladder", ""}, -- The Ladder
	{"61", "", ""},
	{"62", "Charm of the Vampire", ""}, -- Charm of the Vampire
	{"63", "The Battery", ""}, -- The Battery
	{"64", "Steam Sale", ""}, -- Steam Sale
	{"65", "Anarchist Cookbook", ""}, -- Anarchist Cookbook
	{"66", "The Hourglass", ""}, -- The Hourglass
	{"67", "Sister Maggy", ""}, -- Sister Maggy
	{"68", "Technology", ""}, -- Technology
	{"69", "Chocolate Milk", ""}, -- Chocolate Milk
	{"70", "Growth Hormones", ""}, -- Growth Hormones
	{"71", "Mini Mush", ""}, -- Mini Mush
	{"72", "Rosary", ""}, -- Rosary
	{"73", "Cube of Meat", ""}, -- Cube of Meat
	{"74", "A Quarter", ""}, -- A Quarter
	{"75", "PHD", ""}, -- PHD
	{"76", "X-Ray Vision", ""}, -- X-Ray Vision
	{"77", "My Little Unicorn", ""}, -- My Little Unicorn
	{"78", "Book of Revelations", ""}, -- Book of Revelations
	{"79", "The Mark", ""}, -- The Mark
	{"80", "The Pact", ""}, -- The Pact
	{"81", "Dead Cat", ""}, -- Dead Cat
	{"82", "Lord of the Pit", ""}, -- Lord of the Pit
	{"83", "The Nail", ""}, -- The Nail
	{"84", "We Need To Go Deeper!", ""}, -- We Need To Go Deeper!
	{"85", "Deck of Cards", ""}, -- Deck of Cards
	{"86", "Monstro's Tooth", ""}, -- Monstro's Tooth
	{"87", "Loki's Horns", ""}, -- Loki's Horns
	{"88", "Little Chubby", ""}, -- Little Chubby
	{"89", "Spider Bite", ""}, -- Spider Bite
	{"90", "The Small Rock", ""}, -- The Small Rock
	{"91", "Spelunker Hat", ""}, -- Spelunker Hat
	{"92", "Super Bandage", ""}, -- Super Bandage
	{"93", "The Gamekid", ""}, -- The Gamekid
	{"94", "Sack of Pennies", ""}, -- Sack of Pennies
	{"95", "Robo-Baby", ""}, -- Robo-Baby
	{"96", "Little C.H.A.D.", ""}, -- Little C.H.A.D.
	{"97", "The Book of Sin", ""}, -- The Book of Sin
	{"98", "The Relic", ""}, -- The Relic
	{"99", "Little Gish", ""}, -- Little Gish
	{"100", "Little Steven", ""}, -- Little Steven
	{"101", "The Halo", ""}, -- The Halo
	{"102", "Mom's Bottle of Pills", ""}, -- Mom's Bottle of Pills
	{"103", "The Common Cold", ""}, -- The Common Cold
	{"104", "The Parasite", ""}, -- The Parasite
	{"105", "The D6", ""}, -- The D6
	{"106", "Mr. Mega", ""}, -- Mr. Mega
	{"107", "The Pinking Shears", ""}, -- The Pinking Shears
	{"108", "The Wafer", ""}, -- The Wafer
	{"109", "Money = Power", ""}, -- Money = Power
	{"110", "Mom's Contacts", ""}, -- Mom's Contacts
	{"111", "The Bean", ""}, -- The Bean
	{"112", "Guardian Angel", ""}, -- Guardian Angel
	{"113", "Demon Baby", ""}, -- Demon Baby
	{"114", "Mom's Knife", ""}, -- Mom's Knife
	{"115", "Ouija Board", ""}, -- Ouija Board
	{"116", "9 Volt", ""}, -- 9 Volt
	{"117", "Dead Bird", ""}, -- Dead Bird
	{"118", "Brimstone", ""}, -- Brimstone
	{"119", "Blood Bag", ""}, -- Blood Bag
	{"120", "Odd Mushroom (Thin)", ""}, -- Odd Mushroom (Thin)
	{"121", "Odd Mushroom (Large)", ""}, -- Odd Mushroom (Large)
	{"122", "Whore of Babylon", ""}, -- Whore of Babylon
	{"123", "Monster Manual", ""}, -- Monster Manual
	{"124", "Dead Sea Scrolls", ""}, -- Dead Sea Scrolls
	{"125", "Bobby-Bomb", ""}, -- Bobby-Bomb
	{"126", "Razor Blade", ""}, -- Razor Blade
	{"127", "Forget Me Now", ""}, -- Forget Me Now
	{"128", "Forever Alone", ""}, -- Forever Alone
	{"129", "Bucket of Lard", ""}, -- Bucket of Lard
	{"130", "A Pony", ""}, -- A Pony
	{"131", "Bomb Bag", ""}, -- Bomb Bag
	{"132", "A Lump of Coal", ""}, -- A Lump of Coal
	{"133", "Guppy's Paw", ""}, -- Guppy's Paw
	{"134", "Guppy's Tail", ""}, -- Guppy's Tail
	{"135", "IV Bag", ""}, -- IV Bag
	{"136", "Best Friend", ""}, -- Best Friend
	{"137", "Remote Detonator", ""}, -- Remote Detonator
	{"138", "Stigmata", ""}, -- Stigmata
	{"139", "Mom's Purse", ""}, -- Mom's Purse
	{"140", "Bob's Curse", ""}, -- Bob's Curse
	{"141", "Pageant Boy", ""}, -- Pageant Boy
	{"142", "Scapular", ""}, -- Scapular
	{"143", "Speed Ball", ""}, -- Speed Ball
	{"144", "Bum Friend", ""}, -- Bum Friend
	{"145", "Guppy's Head", ""}, -- Guppy's Head
	{"146", "Prayer Card", ""}, -- Prayer Card
	{"147", "Notched Axe", ""}, -- Notched Axe
	{"148", "Infestation", ""}, -- Infestation
	{"149", "Ipecac", ""}, -- Ipecac
	{"150", "Tough Love", ""}, -- Tough Love
	{"151", "The Mulligan", ""}, -- The Mulligan
	{"152", "Technology 2", ""}, -- Technology 2
	{"153", "Mutant Spider", ""}, -- Mutant Spider
	{"154", "Chemical Peel", ""}, -- Chemical Peel
	{"155", "The Peeper", ""}, -- The Peeper
	{"156", "Habit", ""}, -- Habit
	{"157", "Bloody Lust", ""}, -- Bloody Lust
	{"158", "Crystal Ball", ""}, -- Crystal Ball
	{"159", "Spirit of the Night", ""}, -- Spirit of the Night
	{"160", "Crack the Sky", ""}, -- Crack the Sky
	{"161", "Ankh", ""}, -- Ankh
	{"162", "Celtic Cross", ""}, -- Celtic Cross
	{"163", "Ghost Baby", ""}, -- Ghost Baby
	{"164", "The Candle", ""}, -- The Candle
	{"165", "Cat-o-nine-tails", ""}, -- Cat-o-nine-tails
	{"166", "D20", ""}, -- D20
	{"167", "Harlequin Baby", ""}, -- Harlequin Baby
	{"168", "Epic Fetus", ""}, -- Epic Fetus
	{"169", "Polyphemus", ""}, -- Polyphemus
	{"170", "Daddy Longlegs", ""}, -- Daddy Longlegs
	{"171", "Spider Butt", ""}, -- Spider Butt
	{"172", "Sacrificial Dagger", ""}, -- Sacrificial Dagger
	{"173", "Mitre", ""}, -- Mitre
	{"174", "Rainbow Baby", ""}, -- Rainbow Baby
	{"175", "Dad's Key", ""}, -- Dad's Key
	{"176", "Stem Cells", ""}, -- Stem Cells
	{"177", "Portable Slot", ""}, -- Portable Slot
	{"178", "Holy Water", ""}, -- Holy Water
	{"179", "Fate", ""}, -- Fate
	{"180", "The Black Bean", ""}, -- The Black Bean
	{"181", "White Pony", ""}, -- White Pony
	{"182", "Sacred Heart", ""}, -- Sacred Heart
	{"183", "Tooth Picks", ""}, -- Tooth Picks
	{"184", "Holy Grail", ""}, -- Holy Grail
	{"185", "Dead Dove", ""}, -- Dead Dove
	{"186", "Blood Rights", ""}, -- Blood Rights
	{"187", "Guppy's Hairball", ""}, -- Guppy's Hairball
	{"188", "Abel", ""}, -- Abel
	{"189", "SMB Super Fan", ""}, -- SMB Super Fan
	{"190", "Pyro", ""}, -- Pyro
	{"191", "3 Dollar Bill", ""}, -- 3 Dollar Bill
	{"192", "Telepathy For Dummies", ""}, -- Telepathy For Dummies
	{"193", "MEAT!", ""}, -- MEAT!
	{"194", "Magic 8 Ball", ""}, -- Magic 8 Ball
	{"195", "Mom's Coin Purse", ""}, -- Mom's Coin Purse
	{"196", "Squeezy", ""}, -- Squeezy
	{"197", "Jesus Juice", ""}, -- Jesus Juice
	{"198", "Box", ""}, -- Box
	{"199", "Mom's Key", ""}, -- Mom's Key
	{"200", "Mom's Eyeshadow", ""}, -- Mom's Eyeshadow
	{"201", "Iron Bar", ""}, -- Iron Bar
	{"202", "Midas' Touch", ""}, -- Midas' Touch
	{"203", "Humbleing Bundle", ""}, -- Humbleing Bundle
	{"204", "Fanny Pack", ""}, -- Fanny Pack
	{"205", "Sharp Plug", ""}, -- Sharp Plug
	{"206", "Guillotine", ""}, -- Guillotine
	{"207", "Ball of Bandages", ""}, -- Ball of Bandages
	{"208", "Champion Belt", ""}, -- Champion Belt
	{"209", "Butt Bombs", ""}, -- Butt Bombs
	{"210", "Gnawed Leaf", ""}, -- Gnawed Leaf
	{"211", "Spiderbaby", ""}, -- Spiderbaby
	{"212", "Guppy's Collar", ""}, -- Guppy's Collar
	{"213", "Lost Contact", ""}, -- Lost Contact
	{"214", "Anemic", ""}, -- Anemic
	{"215", "Goat Head", ""}, -- Goat Head
	{"216", "Ceremonial Robes", ""}, -- Ceremonial Robes
	{"217", "Mom's Wig", ""}, -- Mom's Wig
	{"218", "Placenta", ""}, -- Placenta
	{"219", "Old Bandage", ""}, -- Old Bandage
	{"220", "Sad Bombs", ""}, -- Sad Bombs
	{"221", "Rubber Cement", ""}, -- Rubber Cement
	{"222", "Anti-Gravity", ""}, -- Anti-Gravity
	{"223", "Pyromaniac", ""}, -- Pyromaniac
	{"224", "Cricket's Body", ""}, -- Cricket's Body
	{"225", "Gimpy", ""}, -- Gimpy
	{"226", "Black Lotus", ""}, -- Black Lotus
	{"227", "Piggy Bank", ""}, -- Piggy Bank
	{"228", "Mom's Perfume", ""}, -- Mom's Perfume
	{"229", "Monstro's Lung", ""}, -- Monstro's Lung
	{"230", "Abaddon", ""}, -- Abaddon
	{"231", "Ball of Tar", ""}, -- Ball of Tar
	{"232", "Stop Watch", ""}, -- Stop Watch
	{"233", "Tiny Planet", ""}, -- Tiny Planet
	{"234", "Infestation 2", ""}, -- Infestation 2
	{"235", "", ""},
	{"236", "E. Coli", ""}, -- E. Coli
	{"237", "Death's Touch", ""}, -- Death's Touch
	{"238", "Key Piece 1", ""}, -- Key Piece 1
	{"239", "Key Piece 2", ""}, -- Key Piece 2
	{"240", "Experimental Treatment", ""}, -- Experimental Treatment
	{"241", "Contract from Below", ""}, -- Contract from Below
	{"242", "Infamy", ""}, -- Infamy
	{"243", "Trinity Shield", ""}, -- Trinity Shield
	{"244", "Tech.5", ""}, -- Tech.5
	{"245", "20/20", ""}, -- 20/20
	{"246", "Blue Map", ""}, -- Blue Map
	{"247", "BFFS!", ""}, -- BFFS!
	{"248", "Hive Mind", ""}, -- Hive Mind
	{"249", "There's Options", ""}, -- There's Options
	{"250", "Bogo Bombs", ""}, -- Bogo Bombs
	{"251", "Starter Deck", ""}, -- Starter Deck
	{"252", "Little Baggy", ""}, -- Little Baggy
	{"253", "Magic Scab", ""}, -- Magic Scab
	{"254", "Blood Clot", ""}, -- Blood Clot
	{"255", "Screw", ""}, -- Screw
	{"256", "Hot Bombs", ""}, -- Hot Bombs
	{"257", "Fire Mind", ""}, -- Fire Mind
	{"258", "Missing No.", ""}, -- Missing No.
	{"259", "Dark Matter", ""}, -- Dark Matter
	{"260", "Black Candle", ""}, -- Black Candle
	{"261", "Proptosis", ""}, -- Proptosis
	{"262", "Missing Page 2", ""}, -- Missing Page 2
	{"263", "", ""},
	{"264", "Smart Fly", ""}, -- Smart Fly
	{"265", "Dry Baby", ""}, -- Dry Baby
	{"266", "Juicy Sack", ""}, -- Juicy Sack
	{"267", "Robo-Baby 2.0", ""}, -- Robo-Baby 2.0
	{"268", "Rotten Baby", ""}, -- Rotten Baby
	{"269", "Headless Baby", ""}, -- Headless Baby
	{"270", "Leech", ""}, -- Leech
	{"271", "Mystery Sack", ""}, -- Mystery Sack
	{"272", "BBF", ""}, -- BBF
	{"273", "Bob's Brain", ""}, -- Bob's Brain
	{"274", "Best Bud", ""}, -- Best Bud
	{"275", "Lil Brimstone", ""}, -- Lil Brimstone
	{"276", "Isaac's Heart", ""}, -- Isaac's Heart
	{"277", "Lil Haunt", ""}, -- Lil Haunt
	{"278", "Dark Bum", ""}, -- Dark Bum
	{"279", "Big Fan", ""}, -- Big Fan
	{"280", "Sissy Longlegs", ""}, -- Sissy Longlegs
	{"281", "Punching Bag", ""}, -- Punching Bag
	{"282", "How to Jump", ""}, -- How to Jump
	{"283", "D100", ""}, -- D100
	{"284", "D4", ""}, -- D4
	{"285", "D10", ""}, -- D10
	{"286", "Blank Card", ""}, -- Blank Card
	{"287", "Book of Secrets", ""}, -- Book of Secrets
	{"288", "Box of Spiders", ""}, -- Box of Spiders
	{"289", "Red Candle", ""}, -- Red Candle
	{"290", "The Jar", ""}, -- The Jar
	{"291", "Flush!", ""}, -- Flush!
	{"292", "Satanic Bible", ""}, -- Satanic Bible
	{"293", "Head of Krampus", ""}, -- Head of Krampus
	{"294", "Butter Bean", ""}, -- Butter Bean
	{"295", "Magic Fingers", ""}, -- Magic Fingers
	{"296", "Converter", ""}, -- Converter
	-- NOTE FOR LOCALIZERS: There is code to highlight the text of your current floor
	-- For it to work, only use line breaks or semicolons to separate floor details, and use the same order as English
	{"297", "Pandora's Box", ""}, -- Pandora's Box
	{"298", "Unicorn Stump", ""}, -- Unicorn Stump
	{"299", "Taurus", ""}, -- Taurus
	{"300", "Aries", ""}, -- Aries
	{"301", "Cancer", ""}, -- Cancer
	{"302", "Leo", ""}, -- Leo
	{"303", "Virgo", ""}, -- Virgo
	{"304", "Libra", ""}, -- Libra
	{"305", "Scorpio", ""}, -- Scorpio
	{"306", "Sagittarius", ""}, -- Sagittarius
	{"307", "Capricorn", ""}, -- Capricorn
	{"308", "Aquarius", ""}, -- Aquarius
	{"309", "Pisces", ""}, -- Pisces
	{"310", "Eve's Mascara", ""}, -- Eve's Mascara
	{"311", "Judas' Shadow", ""}, -- Judas' Shadow
	{"312", "Maggy's Bow", ""}, -- Maggy's Bow
	{"313", "Holy Mantle", ""}, -- Holy Mantle
	{"314", "Thunder Thighs", ""}, -- Thunder Thighs
	{"315", "Strange Attractor", ""}, -- Strange Attractor
	{"316", "Cursed Eye", ""}, -- Cursed Eye
	{"317", "Mysterious Liquid", ""}, -- Mysterious Liquid
	{"318", "Gemini", ""}, -- Gemini
	{"319", "Cain's Other Eye", ""}, -- Cain's Other Eye
	{"320", "???'s Only Friend", ""}, -- ???'s Only Friend
	{"321", "Samson's Chains", ""}, -- Samson's Chains
	{"322", "Mongo Baby", ""}, -- Mongo Baby
	{"323", "Isaac's Tears", ""}, -- Isaac's Tears
	{"324", "Undefined", ""}, -- Undefined
	{"325", "Scissors", ""}, -- Scissors
	{"326", "Breath of Life", ""}, -- Breath of Life
	{"327", "The Polaroid", ""}, -- The Polaroid
	{"328", "The Negative", ""}, -- The Negative
	{"329", "The Ludovico Technique", ""}, -- The Ludovico Technique
	{"330", "Soy Milk", ""}, -- Soy Milk
	{"331", "Godhead", ""}, -- Godhead
	{"332", "Lazarus' Rags", ""}, -- Lazarus' Rags
	{"333", "The Mind", ""}, -- The Mind
	{"334", "The Body", ""}, -- The Body
	{"335", "The Soul", ""}, -- The Soul
	{"336", "Dead Onion", ""}, -- Dead Onion
	{"337", "Broken Watch", ""}, -- Broken Watch
	{"338", "The Boomerang", ""}, -- The Boomerang
	{"339", "Safety Pin", ""}, -- Safety Pin
	{"340", "Caffeine Pill", ""}, -- Caffeine Pill
	{"341", "Torn Photo", ""}, -- Torn Photo
	{"342", "Blue Cap", ""}, -- Blue Cap
	{"343", "Latch Key", ""}, -- Latch Key
	{"344", "Match Book", ""}, -- Match Book
	{"345", "Synthoil", ""}, -- Synthoil
	{"346", "A Snack", ""}, -- A Snack
	{"347", "Diplopia", ""}, -- Diplopia
	{"348", "Placebo", ""}, -- Placebo
	{"349", "Wooden Nickel", ""}, -- Wooden Nickel
	{"350", "Toxic Shock", ""}, -- Toxic Shock
	{"351", "Mega Bean", ""}, -- Mega Bean
	{"352", "Glass Cannon", ""}, -- Glass Cannon
	{"353", "Bomber Boy", ""}, -- Bomber Boy
	{"354", "Crack Jacks", ""}, -- Crack Jacks
	{"355", "Mom's Pearls", ""}, -- Mom's Pearls
	{"356", "Car Battery", ""}, -- Car Battery
	{"357", "Box of Friends", ""}, -- Box of Friends
	{"358", "The Wiz", ""}, -- The Wiz
	{"359", "8 Inch Nails", ""}, -- 8 Inch Nails
	{"360", "Incubus", ""}, -- Incubus
	{"361", "Fate's Reward", ""}, -- Fate's Reward
	{"362", "Lil Chest", ""}, -- Lil Chest
	{"363", "Sworn Protector", ""}, -- Sworn Protector
	{"364", "Friend Zone", ""}, -- Friend Zone
	{"365", "Lost Fly", ""}, -- Lost Fly
	{"366", "Scatter Bombs", ""}, -- Scatter Bombs
	{"367", "Sticky Bombs", ""}, -- Sticky Bombs
	{"368", "Epiphora", ""}, -- Epiphora
	{"369", "Continuum", ""}, -- Continuum
	{"370", "Mr. Dolly", ""}, -- Mr. Dolly
	{"371", "Curse of the Tower", ""}, -- Curse of the Tower
	{"372", "Charged Baby", ""}, -- Charged Baby
	{"373", "Dead Eye", ""}, -- Dead Eye
	{"374", "Holy Light", ""}, -- Holy Light
	{"375", "Host Hat", ""}, -- Host Hat
	{"376", "Restock", ""}, -- Restock
	{"377", "Bursting Sack", ""}, -- Bursting Sack
	{"378", "No. 2", ""}, -- No. 2
	{"379", "Pupula Duplex", ""}, -- Pupula Duplex
	{"380", "Pay To Play", ""}, -- Pay To Play
	{"381", "Eden's Blessing", ""}, -- Eden's Blessing
	{"382", "Friendly Ball", ""}, -- Friendly Ball
	{"383", "Tear Detonator", ""}, -- Tear Detonator
	{"384", "Lil Gurdy", ""}, -- Lil Gurdy
	{"385", "Bumbo", ""}, -- Bumbo
	{"386", "D12", ""}, -- D12
	{"387", "Censer", ""}, -- Censer
	{"388", "Key Bum", ""}, -- Key Bum
	{"389", "Rune Bag", ""}, -- Rune Bag
	{"390", "Seraphim", ""}, -- Seraphim
	{"391", "Betrayal", ""}, -- Betrayal
	{"392", "Zodiac", ""}, -- Zodiac
	{"393", "Serpent's Kiss", ""}, -- Serpent's Kiss
	{"394", "Marked", ""}, -- Marked
	{"395", "Tech X", ""}, -- Tech X
	{"396", "Ventricle Razor", ""}, -- Ventricle Razor
	{"397", "Tractor Beam", ""}, -- Tractor Beam
	{"398", "God's Flesh", ""}, -- God's Flesh
	{"399", "Maw of the Void", ""}, -- Maw of the Void
	{"400", "Spear of Destiny", ""}, -- Spear of Destiny
	{"401", "Explosivo", ""}, -- Explosivo
	{"402", "Chaos", ""}, -- Chaos
	{"403", "Spider Mod", ""}, -- Spider Mod
	{"404", "Farting Baby", ""}, -- Farting Baby
	{"405", "GB Bug", ""}, -- GB Bug
	{"406", "D8", ""}, -- D8
	{"407", "Purity", ""}, -- Purity
	{"408", "Athame", ""}, -- Athame
	{"409", "Empty Vessel", ""}, -- Empty Vessel
	{"410", "Evil Eye", ""}, -- Evil Eye
	{"411", "Lusty Blood", ""}, -- Lusty Blood
	{"412", "Cambion Conception", ""}, -- Cambion Conception
	{"413", "Immaculate Conception", ""}, -- Immaculate Conception
	{"414", "More Options", ""}, -- More Options
	{"415", "Crown Of Light", ""}, -- Crown Of Light
	{"416", "Deep Pockets", ""}, -- Deep Pockets
	{"417", "Succubus", ""}, -- Succubus
	{"418", "Fruit Cake", ""}, -- Fruit Cake
	{"419", "Teleport 2.0", ""}, -- Teleport 2.0
	{"420", "Black Powder", ""}, -- Black Powder
	{"421", "Kidney Bean", ""}, -- Kidney Bean
	{"422", "Glowing Hour Glass", ""}, -- Glowing Hour Glass
	{"423", "Circle of Protection", ""}, -- Circle of Protection
	{"424", "Sack Head", ""}, -- Sack Head
	{"425", "Night Light", ""}, -- Night Light
	{"426", "Obsessed Fan", ""}, -- Obsessed Fan
	{"427", "Mine Crafter", ""}, -- Mine Crafter
	{"428", "PJs", ""}, -- PJs
	{"429", "Head of the Keeper", ""}, -- Head of the Keeper
	{"430", "Papa Fly", ""}, -- Papa Fly
	{"431", "Multidimensional Baby", ""}, -- Multidimensional Baby
	{"432", "Glitter Bombs", ""}, -- Glitter Bombs
	{"433", "My Shadow", ""}, -- My Shadow
	{"434", "Jar of Flies", ""}, -- Jar of Flies
	{"435", "Lil Loki", ""}, -- Lil Loki
	{"436", "Milk!", ""}, -- Milk!
	{"437", "D7", ""}, -- D7
	{"438", "Binky", ""}, -- Binky
	{"439", "Mom's Box", ""}, -- Mom's Box
	{"440", "Kidney Stone", ""}, -- Kidney Stone
	{"441", "Mega Blast", ""}, -- Mega Blast
	{"442", "Dark Prince's Crown", ""}, -- Dark Princes Crown (apostrophe added to the name in Repentance) -- Dark Prince's Crown
	{"443", "Apple!", ""}, -- Apple!
	{"444", "Lead Pencil", ""}, -- Lead Pencil
	{"445", "Dog Tooth", ""}, -- Dog Tooth
	{"446", "Dead Tooth", ""}, -- Dead Tooth
	{"447", "Linger Bean", ""}, -- Linger Bean
	{"448", "Shard of Glass", ""}, -- Shard of Glass
	{"449", "Metal Plate", ""}, -- Metal Plate
	{"450", "Eye of Greed", ""}, -- Eye of Greed
	{"451", "Tarot Cloth", ""}, -- Tarot Cloth
	{"452", "Varicose Veins", ""}, -- Varicose Veins
	{"453", "Compound Fracture", ""}, -- Compound Fracture
	{"454", "Polydactyly", ""}, -- Polydactyly
	{"455", "Dad's Lost Coin", ""}, -- Dad's Lost Coin
	{"456", "Moldy Bread", ""}, -- Moldy Bread
	{"457", "Cone Head", ""}, -- Cone Head
	{"458", "Belly Button", ""}, -- Belly Button
	{"459", "Sinus Infection", ""}, -- Sinus Infection
	{"460", "Glaucoma", ""}, -- Glaucoma
	{"461", "Parasitoid", ""}, -- Parasitoid
	{"462", "Eye of Belial", ""}, -- Eye of Belial
	{"463", "Sulfuric Acid", ""}, -- Sulfuric Acid
	{"464", "Glyph of Balance", ""}, -- Glyph of Balance
	{"465", "Analog Stick", ""}, -- Analog Stick
	{"466", "Contagion", ""}, -- Contagion
	{"467", "Finger!", ""}, -- Finger!
	{"468", "Shade", ""}, -- Shade
	{"469", "Depression", ""}, -- Depression
	{"470", "Hushy", ""}, -- Hushy
	{"471", "Lil Monstro", ""}, -- Lil Monstro
	{"472", "King Baby", ""}, -- King Baby
	{"473", "Big Chubby", ""}, -- Big Chubby
	{"474", "Tonsil", ""}, -- Tonsil
	{"475", "Plan C", ""}, -- Plan C
	{"476", "D1", ""}, -- D1
	{"477", "Void", ""}, -- Void
	{"478", "Pause", ""}, -- Pause
	{"479", "Smelter", ""}, -- Smelter
	{"480", "Compost", ""}, -- Compost
	{"481", "Dataminer", ""}, -- Dataminer
	{"482", "Clicker", ""}, -- Clicker
	{"483", "Mama Mega!", ""}, -- Mama Mega!
	{"484", "Wait What?", ""}, -- Wait What?
	{"485", "Crooked Penny", ""}, -- Crooked Penny
	{"486", "Dull Razor", ""}, -- Dull Razor
	{"487", "Potato Peeler", ""}, -- Potato Peeler
	{"488", "Metronome", ""}, -- Metronome
	{"489", "D Infinity", ""}, -- D Infinity
	{"490", "Eden's Soul", ""}, -- Eden's Soul
	{"491", "Acid Baby", ""}, -- Acid Baby
	{"492", "YO LISTEN!", ""}, -- YO LISTEN!
	{"493", "Adrenaline", ""}, -- Adrenaline
	{"494", "Jacob's Ladder", ""}, -- Jacob's Ladder
	{"495", "Ghost Pepper", ""}, -- Ghost Pepper
	{"496", "Euthanasia", ""}, -- Euthanasia
	{"497", "Camo Undies", ""}, -- Camo Undies
	{"498", "Duality", ""}, -- Duality
	{"499", "Eucharist", ""}, -- Eucharist
	{"500", "Sack of Sacks", ""}, -- Sack of Sacks
	{"501", "Greed's Gullet", ""}, -- Greed's Gullet
	{"502", "Large Zit", ""}, -- Large Zit
	{"503", "Little Horn", ""}, -- Little Horn
	{"504", "Brown Nugget", ""}, -- Brown Nugget
	{"505", "Poke Go", ""}, -- Poke Go
	{"506", "Backstabber", ""}, -- Backstabber
	{"507", "Sharp Straw", ""}, -- Sharp Straw
	{"508", "Mom's Razor", ""}, -- Mom's Razor
	{"509", "Bloodshot Eye", ""}, -- Bloodshot Eye
	{"510", "Delirious", ""}, -- Delirious
	{"511", "Angry Fly", ""}, -- Angry Fly
	{"512", "Black Hole", ""}, -- Black Hole
	{"513", "Bozo", ""}, -- Bozo
	{"514", "Broken Modem", ""}, -- Broken Modem
	{"515", "Mystery Gift", ""}, -- Mystery Gift
	{"516", "Sprinkler", ""}, -- Sprinkler
	{"517", "Fast Bombs", ""}, -- Fast Bombs
	{"518", "Buddy in a Box", ""}, -- Buddy in a Box
	{"519", "Lil Delirium", ""}, -- Lil Delirium
	{"520", "Jumper Cables", ""}, -- Jumper Cables
	{"521", "Coupon", ""}, -- Coupon
	{"522", "Telekinesis", ""}, -- Telekinesis
	{"523", "Moving Box", ""}, -- Moving Box
	{"524", "Technology Zero", ""}, -- Technology Zero
	{"525", "Leprosy", ""}, -- Leprosy
	{"526", "7 Seals", ""}, -- 7 Seals
	{"527", "Mr. ME!", ""}, -- Mr. ME!
	{"528", "Angelic Prism", ""}, -- Angelic Prism
	{"529", "Pop!", ""}, -- Pop!
	{"530", "Death's List", ""}, -- Death's List
	{"531", "Haemolacria", ""}, -- Haemolacria
	{"532", "Lachryphagy", ""}, -- Lachryphagy
	{"533", "Trisagion", ""}, -- Trisagion
	{"534", "Schoolbag", ""}, -- Schoolbag
	{"535", "Blanket", ""}, -- Blanket
	{"536", "Sacrificial Altar", ""}, -- Sacrificial Altar
	{"537", "Lil Spewer", ""}, -- Lil Spewer
	{"538", "Marbles", ""}, -- Marbles
	{"539", "Mystery Egg", ""}, -- Mystery Egg
	{"540", "Flat Stone", ""}, -- Flat Stone
	{"541", "Marrow", ""}, -- Marrow
	{"542", "Slipped Rib", ""}, -- Slipped Rib
	{"543", "Hallowed Ground", ""}, -- Hallowed Ground
	{"544", "Pointy Rib", ""}, -- Pointy Rib
	{"545", "Book of the Dead", ""}, -- Book of the Dead
	{"546", "Dad's Ring", ""}, -- Dad's Ring
	{"547", "Divorce Papers", ""}, -- Divorce Papers
	{"548", "Jaw Bone", ""}, -- Jaw Bone
	{"549", "Brittle Bones", ""}, -- Brittle Bones
	{"550", "Broken Shovel", ""}, -- Broken Shovel
	{"551", "Broken Shovel", ""}, -- Broken Shovel
	{"552", "Mom's Shovel", ""}, -- Mom's Shovel
}


---------- Trinkets ----------

EID.descriptions[languageCode].trinkets={
	{"1", "Swallowed Penny", ""}, -- Swallowed Penny
	{"2", "Petrified Poop", ""}, -- Petrified Poop
	{"3", "AAA Battery", ""}, -- AAA Battery
	{"4", "Broken Remote", ""}, -- Broken Remote
	{"5", "Purple Heart", ""}, -- Purple Heart
	{"6", "Broken Magnet", ""}, -- Broken Magnet
	{"7", "Rosary Bead", ""}, -- Rosary Bead
	{"8", "Cartridge", ""}, -- Cartridge
	{"9", "Pulse Worm", ""}, -- Pulse Worm
	{"10", "Wiggle Worm", ""}, -- Wiggle Worm
	{"11", "Ring Worm", ""}, -- Ring Worm
	{"12", "Flat Worm", ""}, -- Flat Worm
	{"13", "Store Credit", ""}, -- Store Credit
	{"14", "Callus", ""}, -- Callus
	{"15", "Lucky Rock", ""}, -- Lucky Rock
	{"16", "Mom's Toenail", ""}, -- Mom's Toenail
	{"17", "Black Lipstick", ""}, -- Black Lipstick
	{"18", "Bible Tract", ""}, -- Bible Tract
	{"19", "Paper Clip", ""}, -- Paper Clip
	{"20", "Monkey Paw", ""}, -- Monkey Paw
	{"21", "Mysterious Paper", ""}, -- Mysterious Paper
	{"22", "Daemon's Tail", ""}, -- Daemon's Tail
	{"23", "Missing Poster", ""}, -- Missing Poster
	{"24", "Butt Penny", ""}, -- Butt Penny
	{"25", "Mysterious Candy", ""}, -- Mysterious Candy
	{"26", "Hook Worm", ""}, -- Hook Worm
	{"27", "Whip Worm", ""}, -- Whip Worm
	{"28", "Broken Ankh", ""}, -- Broken Ankh
	{"29", "Fish Head", ""}, -- Fish Head
	{"30", "Pinky Eye", ""}, -- Pinky Eye
	{"31", "Push Pin", ""}, -- Push Pin
	{"32", "Liberty Cap", ""}, -- Liberty Cap
	{"33", "Umbilical Cord", ""}, -- Umbilical Cord
	{"34", "Child's Heart", ""}, -- Child's Heart
	{"35", "Curved Horn", ""}, -- Curved Horn
	{"36", "Rusted Key", ""}, -- Rusted Key
	{"37", "Goat Hoof", ""}, -- Goat Hoof
	{"38", "Mom's Pearl", ""}, -- Mom's Pearl
	{"39", "Cancer", ""}, -- Cancer
	{"40", "Red Patch", ""}, -- Red Patch
	{"41", "Match Stick", ""}, -- Match Stick
	{"42", "Lucky Toe", ""}, -- Lucky Toe
	{"43", "Cursed Skull", ""}, -- Cursed Skull
	{"44", "Safety Cap", ""}, -- Safety Cap
	{"45", "Ace of Spades", ""}, -- Ace of Spades
	{"46", "Isaac's Fork", ""}, -- Isaac's Fork
	{"47", "", ""},
	{"48", "A Missing Page", ""}, -- A Missing Page
	{"49", "Bloody Penny", ""}, -- Bloody Penny
	{"50", "Burnt Penny", ""}, -- Burnt Penny
	{"51", "Flat Penny", ""}, -- Flat Penny
	{"52", "Counterfeit Penny", ""}, -- Counterfeit Penny
	{"53", "Tick", ""}, -- Tick
	{"54", "Isaac's Head", ""}, -- Isaac's Head
	{"55", "Maggy's Faith", ""}, -- Maggy's Faith
	{"56", "Judas' Tongue", ""}, -- Judas' Tongue
	{"57", "???'s Soul", ""}, -- ???'s Soul
	{"58", "Samson's Lock", ""}, -- Samson's Lock
	{"59", "Cain's Eye", ""}, -- Cain's Eye
	{"60", "Eve's Bird Foot", ""}, -- Eve's Bird Foot
	{"61", "The Left Hand", ""}, -- The Left Hand
	{"62", "Shiny Rock", ""}, -- Shiny Rock
	{"63", "Safety Scissors", ""}, -- Safety Scissors
	{"64", "Rainbow Worm", ""}, -- Rainbow Worm
	{"65", "Tape Worm", ""}, -- Tape Worm
	{"66", "Lazy Worm", ""}, -- Lazy Worm
	{"67", "Cracked Dice", ""}, -- Cracked Dice
	{"68", "Super Magnet", ""}, -- Super Magnet
	{"69", "Faded Polaroid", ""}, -- Faded Polaroid
	{"70", "Louse", ""}, -- Louse
	{"71", "Bob's Bladder", ""}, -- Bob's Bladder
	{"72", "Watch Battery", ""}, -- Watch Battery
	{"73", "Blasting Cap", ""}, -- Blasting Cap
	{"74", "Stud Finder", ""}, -- Stud Finder
	{"75", "Error", ""}, -- Error
	{"76", "Poker Chip", ""}, -- Poker Chip
	{"77", "Blister", ""}, -- Blister
	{"78", "Second Hand", ""}, -- Second Hand
	{"79", "Endless Nameless", ""}, -- Endless Nameless
	{"80", "Black Feather", ""}, -- Black Feather
	{"81", "Blind Rage", ""}, -- Blind Rage
	{"82", "Golden Horse Shoe", ""}, -- Golden Horse Shoe
	{"83", "Store Key", ""}, -- Store Key
	{"84", "Rib of Greed", ""}, -- Rib of Greed
	{"85", "Karma", ""}, -- Karma
	{"86", "Lil Larva", ""}, -- Lil Larva
	{"87", "Mom's Locket", ""}, -- Mom's Locket
	{"88", "NO!", ""}, -- NO!
	{"89", "Child Leash", ""}, -- Child Leash
	{"90", "Brown Cap", ""}, -- Brown Cap
	{"91", "Meconium", ""}, -- Meconium
	{"92", "Cracked Crown", ""}, -- Cracked Crown
	{"93", "Used Diaper", ""}, -- Used Diaper
	{"94", "Fish Tail", ""}, -- Fish Tail
	{"95", "Black Tooth", ""}, -- Black Tooth
	{"96", "Ouroboros Worm", ""}, -- Ouroboros Worm
	{"97", "Tonsil", ""}, -- Tonsil
	{"98", "Nose Goblin", ""}, -- Nose Goblin
	{"99", "Super Ball", ""}, -- Super Ball
	{"100", "Vibrant Bulb", ""}, -- Vibrant Bulb
	{"101", "Dim Bulb", ""}, -- Dim Bulb
	{"102", "Fragmented Card", ""}, -- Fragmented Card
	{"103", "Equality!", ""}, -- Equality!
	{"104", "Wish Bone", ""}, -- Wish Bone
	{"105", "Bag Lunch", ""}, -- Bag Lunch
	{"106", "Lost Cork", ""}, -- Lost Cork
	{"107", "Crow Heart", ""}, -- Crow Heart
	{"108", "Walnut", ""}, -- Walnut
	{"109", "Duct Tape", ""}, -- Duct Tape
	{"110", "Silver Dollar", ""}, -- Silver Dollar
	{"111", "Bloody Crown", ""}, -- Bloody Crown
	{"112", "Pay To Win", ""}, -- Pay To Win
	{"113", "Locust of War", ""}, -- Locust of War
	{"114", "Locust of Pestilence", ""}, -- Locust of Pestilence
	{"115", "Locust of Famine", ""}, -- Locust of Famine
	{"116", "Locust of Death", ""}, -- Locust of Death
	{"117", "Locust of Conquest", ""}, -- Locust of Conquest
	{"118", "Bat Wing", ""}, -- Bat Wing
	{"119", "Stem Cell", ""}, -- Stem Cell
	{"120", "Hairpin", ""}, -- Hairpin
	{"121", "Wooden Cross", ""}, -- Wooden Cross
	{"122", "Butter!", ""}, -- Butter!
	{"123", "Filigree Feather", ""}, -- Filigree Feather
	{"124", "Door Stop", ""}, -- Door Stop
	{"125", "Extension Cord", ""}, -- Extension Cord
	{"126", "Rotten Penny", ""}, -- Rotten Penny
	{"127", "Baby-Bender", ""}, -- Baby-Bender
	{"128", "Finger Bone", ""}, -- Finger Bone
}

---------- Cards ----------

EID.descriptions[languageCode].cards={
	{"1", "0 - The Fool", ""}, -- 0 - The Fool
	{"2", "I - The Magician", ""}, -- I - The Magician
	{"3", "II - The High Priestess", ""}, -- II - The High Priestess
	{"4", "III - The Empress", ""}, -- III - The Empress
	{"5", "IV - The Emperor", ""}, -- IV - The Emperor
	{"6", "V - The Hierophant", ""}, -- V - The Hierophant
	{"7", "VI - The Lovers", ""}, -- VI - The Lovers
	{"8", "VII - The Chariot", ""}, -- VII - The Chariot
	{"9", "VIII - Justice", ""}, -- VIII - Justice
	{"10", "IX - The Hermit", ""}, -- IX - The Hermit
	{"11", "X - Wheel of Fortune", ""}, -- X - Wheel of Fortune
	{"12", "XI - Strength", ""}, -- XI - Strength
	{"13", "XII - The Hanged Man", ""}, -- XII - The Hanged Man
	{"14", "XIII - Death", ""}, -- XIII - Death
	{"15", "XIV - Temperance", ""}, -- XIV - Temperance
	{"16", "XV - The Devil", ""}, -- XV - The Devil
	{"17", "XVI - The Tower", ""}, -- XVI - The Tower
	{"18", "XVII - The Stars", ""}, -- XVII - The Stars
	{"19", "XVIII - The Moon", ""}, -- XVIII - The Moon
	{"20", "XIX - The Sun", ""}, -- XIX - The Sun
	{"21", "XX - Judgement", ""}, -- XX - Judgement
	{"22", "XXI - The World", ""}, -- XXI - The World
	{"23", "2 of Clubs", ""}, -- 2 of Clubs
	{"24", "2 of Diamonds", ""}, -- 2 of Diamonds
	{"25", "2 of Spades", ""}, -- 2 of Spades
	{"26", "2 of Hearts", ""}, -- 2 of Hearts
	{"27", "Ace of Clubs", ""}, -- Ace of Clubs
	{"28", "Ace of Diamonds", ""}, -- Ace of Diamonds
	{"29", "Ace of Spades", ""}, -- Ace of Spades
	{"30", "Ace of Hearts", ""}, -- Ace of Hearts
	{"31", "Joker", ""}, -- Joker
	{"32", "Hagalaz", ""}, -- Hagalaz
	{"33", "Jera", ""}, -- Jera
	{"34", "Ehwaz", ""}, -- Ehwaz
	{"35", "Dagaz", ""}, -- Dagaz
	{"36", "Ansuz", ""}, -- Ansuz
	{"37", "Perthro", ""}, -- Perthro
	{"38", "Berkano", ""}, -- Berkano
	{"39", "Algiz", ""}, -- Algiz
	{"40", "Blank Rune", ""}, -- Blank Rune
	{"41", "Black Rune", ""}, -- Black Rune
	{"42", "Chaos Card", ""}, -- Chaos Card
	{"43", "Credit Card", ""}, -- Credit Card
	{"44", "Rules Card", ""}, -- Rules Card
	{"45", "A Card Against Humanity", ""}, -- A Card Against Humanity
	{"46", "Suicide King", ""}, -- Suicide King
	{"47", "Get Out Of Jail Free Card", ""}, -- Get Out Of Jail Free Card
	{"48", "? Card", ""}, -- ? Card
	{"49", "Dice Shard", ""}, -- Dice Shard
	{"50", "Emergency Contact", ""}, -- Emergency Contact
	{"51", "Holy Card", ""}, -- Holy Card
	{"52", "Huge Growth", ""}, -- Huge Growth
	{"53", "Ancient Recall", ""}, -- Ancient Recall
	{"54", "Era Walk", ""}, -- Era Walk
}

---------- Pills ----------

EID.descriptions[languageCode].unidentifiedPill = "Unidentified Pill"

EID.descriptions[languageCode].pills={
	{"0", "Bad Gas", ""}, -- Bad Gas
	{"1", "Bad Trip", ""}, -- Bad Trip
	{"2", "Balls of Steel", ""}, -- Balls of Steel
	{"3", "Bombs are Key", ""}, -- Bombs are Key
	{"4", "Explosive Diarrhea", ""}, -- Explosive Diarrhea
	{"5", "Full Health", ""}, -- Full Health
	{"6", "Health Down", ""}, -- Health Down
	{"7", "Health Up", ""}, -- Health Up
	{"8", "I Found Pills", ""}, -- I Found Pills
	{"9", "Puberty", ""}, -- Puberty
	{"10", "Pretty Fly", ""}, -- Pretty Fly
	{"11", "Range Down", ""}, -- Range Down
	{"12", "Range Up", ""}, -- Range Up
	{"13", "Speed Down", ""}, -- Speed Down
	{"14", "Speed Up", ""}, -- Speed Up
	{"15", "Tears Down", ""}, -- Tears Down
	{"16", "Tears Up", ""}, -- Tears Up
	{"17", "Luck Down", ""}, -- Luck Down
	{"18", "Luck Up", ""}, -- Luck Up
	{"19", "Telepills", ""}, -- Telepills
	{"20", "48 Hour Energy!", ""}, -- 48 Hour Energy!
	{"21", "Hematemesis", ""}, -- Hematemesis
	{"22", "Paralysis", ""}, -- Paralysis
	{"23", "I can see forever!", ""}, -- I can see forever!
	{"24", "Pheromones", ""}, -- Pheromones
	{"25", "Amnesia", ""}, -- Amnesia
	{"26", "Lemon Party", ""}, -- Lemon Party
	{"27", "R U A Wizard?", ""}, -- R U A Wizard?
	{"28", "Percs!", ""}, -- Percs!
	{"29", "Addicted!", ""}, -- Addicted!
	{"30", "Re-Lax", ""}, -- Re-Lax
	{"31", "???", ""}, -- ???
	{"32", "One makes you larger", ""}, -- One makes you larger
	{"33", "One makes you small", ""}, -- One makes you small
	{"34", "Infested!", ""}, -- Infested!
	{"35", "Infested?", ""}, -- Infested?
	{"36", "Power Pill!", ""}, -- Power Pill!
	{"37", "Retro Vision", ""}, -- Retro Vision
	{"38", "Friends Till The End!", ""}, -- Friends Till The End!
	{"39", "X-Lax", ""}, -- X-Lax
	{"40", "Something's wrong...", ""}, -- Something's wrong...
	{"41", "I'm Drowsy...", ""}, -- I'm Drowsy...
	{"42", "I'm Excited!!", ""}, -- I'm Excited!!
	{"43", "Gulp!", ""}, -- Gulp!
	{"44", "Horf!", ""}, -- Horf!
	{"45", "Feels like I'm walking on sunshine!", ""}, -- Feels like I'm walking on sunshine!
	{"46", "Vurp!", ""}, -- Vurp!
}

---------- Character Info ----------
-- These descriptions are shown in the Item Reminder
-- The character names here are also used in getPlayerName to provide localized character names
-- The numbers are provided to make this a quick reference for Player IDs
EID.descriptions[languageCode].CharacterInfo = {
	[0] = {"Isaac", ""},
	[1] = {"Magdalene", ""},
	[2] = {"Cain", ""},
	[3] = {"Judas", ""},
	[4] = {"???", ""},
	[5] = {"Eve", ""},
	[6] = {"Samson", ""},
	[7] = {"Azazel", ""},
	[8] = {"Lazarus", ""},
	[9] = {"Eden", ""},
	[10] = {"The Lost", ""},
	[11] = {"Lazarus Risen", ""},
	[12] = {"Dark Judas", ""},
	[13] = {"Lilith", ""},
	[14] = {"Keeper", ""},
	[15] = {"Apollyon", ""},
	[16] = {"The Forgotten", ""},
	[17] = {"The Forgotten Soul", ""},
}

---------- Dice Room ----------

EID.descriptions[languageCode].diceHeader = "[Dice Room effects]"

EID.descriptions[languageCode].dice={
	{"1", "", ""},
	{"2", "", ""},
	{"3", "", ""},
	{"4", "", ""},
	{"5", "", ""},
	{"6", "", ""},
}

---------- MISC ----------

-- This string will be appended to certain words (like pickup names in glitched item descriptions) to pluralize them, make it "" to not pluralize
EID.descriptions[languageCode].Pluralize = "s"

EID.descriptions[languageCode].VoidText = "If absorbed, gain:"
-- {1} will become the number text (like "{1} Tears" -> "+0.5 Tears")
EID.descriptions[languageCode].VoidNames = {"{1} Speed", "{1} Tears", "{1} Damage", "{1} Range", "{1} Shot speed", "{1} Luck"}

EID.descriptions[languageCode].PurityBoosts = {[0] = "↑ {{Damage}} +4 Damage", "↑ {{Tears}} -4 Tear delay", "↑ {{Speed}} +0.5 Speed", "↑ {{Range}} +7.5 Range#↑ +1 Tear height"}

EID.descriptions[languageCode].CrookedPennyHeads = "Heads"
EID.descriptions[languageCode].CrookedPennyTails = "Tails"

EID.descriptions[languageCode].LuckModifier = "{1}% chance at {2} luck"

EID.descriptions[languageCode].CollectionPageInfo = "This item needs to be picked up for the collection page!"

EID.descriptions[languageCode].MCM = {
	DemoObjectName = "Demo Object Name",
	DemoObjectText = "This text is in english#A very cool and long description to simulate linebreaks caused by EID textbox width!#{{Collectible4}} This is also a cool line#{{Heart}} This line loves you#{{AngelDevilChance}} This line can be your angel or your devil#\1 {{Damage}} +1 Stat Change up",
}

-- the ItemReminder description will predict the abilities of items with a header like "Item Name Result"
EID.descriptions[languageCode].ItemReminder = {
	ResultHeader = "{1} Result",
	InventoryEmpty = "(Player has no items)",
	CategoryNames = {
		Overview = "Inventory Overview",
		Wisps = "Lemegeton Wisps",
		Special = "Special",
		Actives = "Held Active Items",
		Pockets = "Held Pocket Items",
		Trinkets = "Held Trinkets",
		Passives = "Held Passive Items",
		Character = "Character Info",
	}
}

-- https://wofsauge.github.io/IsaacDocs/rep/enums/RoomType.html
-- Includes Repentance room types for localization convenience
EID.descriptions[languageCode].RoomTypeNames = { "Normal Room", "Shop", "I AM ERROR Room", "Treasure Room", "Boss Room", "Miniboss Room", "Secret Room", "Super Secret Room", "Arcade Room", "Curse Room", "Challenge Room", "Library", "Sacrifice Room", "Devil Room", "Angel Room", "Crawlspace Room", "Boss Rush Room", "Isaac's Room", "Barren Room", "Chest Room", "Dice Room", "Black Market", "Exit Room", "Planetarium", "Teleporter Entrance", "Teleporter Exit", "Alt Path Trapdoor", "Blue Key Room", "Ultra Secret Room",
-- Not technically room types but still potentially useful to have localized
[666] = "Devil/Angel Room", [1024] = "Red Room", [1025] = "Special Red Room" }

-- currently used for D1 and Glyph of Balance; contains Rep pickups for ease of localization
EID.descriptions[languageCode].PickupNames = {
	["5.0"] = "None",

	["5.10"] = "{{Heart}} Heart",
	["5.10.1"] = "{{Heart}} Heart", ["5.10.2"] = "{{HalfHeart}} Half Heart", ["5.10.3"] = "{{SoulHeart}} Soul Heart", ["5.10.4"] = "{{EternalHeart}} Eternal Heart", ["5.10.5"] = "{{Heart}} Double Heart", ["5.10.6"] = "{{BlackHeart}} Black Heart", ["5.10.7"] = "{{GoldHeart}} Gold Heart", ["5.10.8"] = "{{HalfSoulHeart}} Half Soul Heart", ["5.10.9"] = "{{Heart}} Scared Heart", ["5.10.10"] = "{{BlendedHeart}} Blended Heart", ["5.10.11"] = "{{EmptyBoneHeart}} Bone Heart", ["5.10.12"] = "{{RottenHeart}} Rotten Heart",

	["5.20"] = "{{Coin}} Coin",
	["5.20.1"] = "{{Crafting8}} Penny", ["5.20.2"] = "{{Crafting9}} Nickel", ["5.20.3"] = "{{Crafting10}} Dime", ["5.20.4"] = "{{Crafting8}} Double Penny", ["5.20.5"] = "{{Crafting11}} Lucky Penny", ["5.20.6"] = "{{Crafting9}} Sticky Nickel", ["5.20.7"] = "{{Crafting26}} Golden Penny",

	["5.30"] = "{{Key}} Key",
	["5.30.1"] = "{{Crafting12}} Key", ["5.30.2"] = "{{Crafting13}} Golden Key", ["5.30.3"] = "{{Crafting12}} Key Ring", ["5.30.4"] = "{{Crafting14}} Charged Key",

	["5.40"] = "{{Bomb}} Bomb",
	["5.40.1"] = "{{Crafting15}} Bomb", ["5.40.2"] = "{{Crafting15}} Double Bomb", ["5.40.3"] = "{{Crafting15}} Troll Bomb", ["5.40.4"] = "{{Crafting16}} Golden Bomb", ["5.40.5"] = "{{Crafting15}} Mega Troll Bomb", ["5.40.7"] = "{{Crafting17}} Giga Bomb",
	
	["5.42"] = "{{Crafting29}} Poop Nugget", ["5.42.1"] = "{{Crafting29}} Big Poop Nugget",

	["5.90"] = "{{Battery}} Battery",
	["5.90.0"] = "{{Crafting19}} Lil' Battery", --AB+ didn't have subtypes for batteries
	["5.90.1"] = "{{Crafting19}} Lil' Battery", ["5.90.2"] = "{{Crafting18}} Micro Battery", ["5.90.3"] = "{{Crafting20}} Mega Battery", ["5.90.4"] = "{{Crafting28}} Golden Battery",

	["5.50"] = "{{Chest}} Chest", ["5.51"] = "{{BombChest}} Bomb Chest", ["5.52"] = "{{SpikedChest}} Spiked Chest", ["5.53"] = "{{EternalChest}} Eternal Chest", ["5.54"] = "{{MimicChest}} Mimic Chest", ["5.55"] = "{{OldChest}} Old Chest", ["5.56"] = "{{WoodenChest}} Wooden Chest", ["5.57"] = "{{MegaChest}} Mega Chest", ["5.58"] = "{{HauntedChest}} Haunted Chest", ["5.60"] = "{{GoldenChest}} Golden Chest", ["5.360"] = "{{RedChest}} Red Chest",

	["5.69"] = "{{GrabBag}} Grab Bag", ["5.69.1"] = "{{GrabBag}} Grab Bag", ["5.69.2"] = "{{BlackSack}} Black Sack",

	["5.70"] = "{{Pill}} Pill",
	["5.300"] = "{{Card}} Card",
	["5.301"] = "{{Rune}} Rune", -- not a real id
	["5.350"] = "{{Trinket}} Trinket",

}

-- Conditional descriptions - DO NOT TRANSLATE THE FIRST PART IN ["BRACKETS"]
-- Strings will be appended to the original description
-- Tables with one entry will completely replace the original description
-- Tables with two or more entries are find-replace pairs (if there's an odd number of entries, the last entry is appended)
-- For collectible/player conditionals, lines will automatically have their bulletpoint, and {1} is replaced with their name
EID.descriptions[languageCode].ConditionalDescs = {
	------ GENERAL STRINGS ------
	["Overridden"] = "Overridden by {1}",
	["Overrides"] = "Overrides {1}",
	["Almost No Effect"] = "Little to no effect for {1}",
	["No Effect"] = "No effect for {1}",
	["No Effect Replace"] = {"No effect for {1}"},
	["No Effect From"] = "No effect from {1}",
	["Can't Charge"] = "Can't charge {1}",
	["Can't Be Charged"] = "Can't be charged by {1}",
	["Can't Be Duplicated"] = "Can't be duplicated",
	["No Effect (Greed)"] = "{{GreedMode}} No effect in Greed Mode",
	["No Effect (Copies)"] = "No additional effect from multiple copies", -- Having the item already, or having Diplopia while looking at a pedestal
	["No Effect (Familiars)"] = "No additional effect on familiars", -- probably just for Hive Mind + BFFS!
	["No Red"] = "No effect for characters that can't have Red Hearts",
	["Different Effect"] = "{{ColorSilver}}Different effect for {1}{{CR}}",
	["Dies on Use"] = "{{Warning}} {1} dies on use", -- for Razor Blade and such as The Lost
	
	
	------ GREED MODE ------
	["Room to Wave"] = {"room", "wave", "room", "wave"}, -- convert room clear effects to wave clear effects
	["No Champion Drops"] = "!!! Champions don't drop pickups in Greed Mode!", -- Champion Belt / Purple Heart
	["5.300.15"] = {"{{DemonBeggar}} Spawns a Devil Beggar"}, -- Temperance (Greed)
	["5.300.19"] = {"Teleports Isaac to the first room of the floor"}, -- The Moon (Greed)
	["5.300.20"] = {"{{HealingRed}} Full health#Deals 100 damage to all enemies"}, -- XIX - The Sun (Greed)
	["5.100.483 (Greed)"] = "{{GreedMode}} Doesn't trigger once per wave, just once per room", -- Mama Mega (Greed)
	["5.100.535"] = "{{GreedMode}} No shield on Boss Waves, only on Ultra Greed", -- Blanket (Greed)
	["5.350.120"] = "{{GreedMode}} No charge on Boss Waves, only on Ultra Greed", -- Hairpin (Greed)
	["5.100.246"] = {"{{SuperSecretRoom}} Reveals the Super Secret Room location on the map"}, -- Blue Map (Greed)
	["5.100.333"] = {"{{SuperSecretRoom}} Reveals the Super Secret Room location on the map"}, -- The Mind (Greed)
	["5.100.514"] = {"Causes some enemies and projectiles to briefly pause at random intervals"}, -- Broken Modem (Greed)
	["5.350.34"] = {"{{Heart}} 33% chance for a bonus heart from chests, tinted rocks, and destroyed machines"}, -- Child's Heart
	["5.350.36"] = {"{{Key}} 33% chance for a bonus key from chests, tinted rocks, and destroyed machines"}, -- Rusted Key
	["5.350.41"] = {"{{Bomb}} 33% chance for a bonus bomb from chests, tinted rocks, and destroyed machines#{{Warning}} Removes {{Trinket53}} Tick"}, -- Match Stick
	["5.350.44"] = {"{{Pill}} 33% chance for a bonus pill from chests, tinted rocks, and destroyed machines"}, -- Safety Cap
	["5.350.45"] = {"{{Card}} 33% chance for a bonus card from chests, tinted rocks, and destroyed machines"}, -- Ace of Spades
	["5.350.72"] = {"{{Battery}} +10% chance for random pickups to be a battery#{{Battery}} 5% chance to add 1 charge to held active item when clearing a wave"}, -- Watch Battery
	["5.100.297 (Greed)"] = {"Spawns rewards based on floor:#Basement: 2{{Bomb}} + 2{{Key}}#Caves: Boss item + 2{{SoulHeart}}#Depths: 20{{Coin}}#Womb: 2 Boss items#Sheol: Devil item + 1{{BlackHeart}}#The Shop/Ultra Greed: 1{{Coin}}"}, -- Pandora's Box
	
	
	------ ACHIEVEMENT CHECKS ------
	["5.350.23"] = "{{Warning}} Dying in a {{SacrificeRoom}} Sacrifice Room while holding this trinket unlocks The Lost", -- Missing Poster (Unlock The Lost)
	["5.100.297"] = {"Unlocks {{Collectible523}} Moving Box", "Nothing"}, -- Pandora's Box unlocking Moving Box
	
	
	------ SPECIFIC CHARACTER SYNERGIES/CHANGES ------
	-- NO RED HEALTH CHARS
	["Super Bandage Soul"] = {"{{SoulHeart}} +3 Soul Hearts"}, -- for Soul Heart chars
	["Super Bandage Black"] = {"{{SoulHeart}} +2 Soul Heart#{{BlackHeart}} +1 Black Heart"}, -- for Black Heart chars
	["Black Lotus Soul"] = {"{{SoulHeart}} +2 Soul Hearts#{{BlackHeart}} +1 Black Heart"}, -- for Soul Heart chars
	["Black Lotus Black"] = {"{{SoulHeart}} +1 Soul Heart#{{BlackHeart}} +2 Black Hearts"}, -- for Black Heart chars
	
	
	["5.100.135 (PHD)"] = "Spawns 2-3 coins if you have {1}", -- IV Bag PHD
	["Keeper 0-1"] = "Spawns 0-1 coin as {1}", -- IV Bag/Piggy Bank Keeper
	["5.100.549"] = "{1} simply gets ↑ {{Tears}} +0.4 Tears on pickup", -- Brittle Bones (Keeper+Lost)
	["5.100.501"] = "{1} can gain additional coin containers", -- Greed's Gullet
	["5.100.230 (Keeper)"] = "{{Warning}} {1} just dies", -- Abaddon
	

	------ DUPLICATE COPIES OF ITEMS ------
	["5.100.2 (Copies)"] = "Isaac fires 3 more tears#No additional stat decrease", -- The Inner Eye
	["5.100.153 (Copies)"] = "Isaac fires 4 more tears#No additional stat decrease", -- Mutant Spider
	["5.100.245 (Copies)"] = "Isaac fires 2 more tears", -- 20/20
	["5.100.358 (Copies)"] = "Isaac fires 2 more tears closer to the center", -- The Wiz
	["5.100.64 (Copies)"] = "Owning this item a second time makes all Shop items free", -- Steam Sale
	["5.100.118 (Copies)"] = "Isaac fires an additional beam", -- Brimstone
	["5.100.224 (Copies)"] = "Additional copies only give -0.2 speed", -- Kidney Stone
	
	
	----- MISC. ITEM CONDITIONS ------
	["Sacrificial Nugget"] = "Brown Nugget turrets count as familiars",
	["Sacrificial Conception"] = "Familiars granted by {1} can be sacrificed, and will respawn",
	["Sacrificial Angels"] = "{1} spawns 2 Black Hearts if sacrificed",
	["Sacrificial Void"] = "Can be used multiple times if absorbed by Void",
	
	["5.100.116 (1 Room)"] = "1 Room recharges become 15 second recharges while in an uncleared room", -- 9 Volt
	["5.100.116 (Timed)"] = "Timed recharges start half full", -- 9 Volt
	["9 Volt 1 Room"] = "15 second recharge while in an uncleared room", -- Actives + 9 Volt
	["9 Volt Timed"] = "Charge starts half full after use", -- Actives + 9 Volt
	["5.100.205 (Wafer)"] = "Reduces the cost to half a heart", -- Sharp Plug + Wafer
	
	["Suicide 1"] = "{1} can't prevent the death", -- Plan C, Damocles, Suicide King
	["Suicide 2"] = "Does not prevent death by {1}", -- Plan C, Damocles, Suicide King
	
	["5.100.7"] = "x1.5 Damage multiplier while {1} effect is active", -- Blood of the Martyr
	["5.100.34"] = "x1.5 Damage multiplier", -- Book of Belial
	["5.300.16"] = "x1.5 Damage multiplier", -- XV - The Devil
	
	["5.100.81"] = "Characters that can't have Red Hearts get set to 1 Soul/Black Heart", -- Dead Cat
	["5.100.316"] = "{1} removes the teleportation effect", -- Cursed Eye
	["5.100.260"] = "Removes the teleportation effect of {1}", -- Black Candle
	["Void Single Use"] = "Single use items are only activated once", -- Single Use Actives + Void
	["? Card Single Use"] = "Single use items will disappear after using ? Card", -- Single Use Actives + ? Card
	["5.300.48"] = "Teleport to I AM ERROR Room#Blank Card and ? Card will be destroyed", -- Blank Card + ? Card
	["? + Blank Pedestal"] = "Using ? Card with Blank Card teleports you to the I AM ERROR room and destroys both cards", -- Looking at Blank Card with ? Card
	["5.100.208"] = {20, 35, 5, 20}, -- Champion Belt + Hard Mode
	["5.100.521"] = "{{Collectible376}} Free items won't be restocked", -- Coupon + Restock/Greed
	["Black Feather"] = "↑ {{Damage}} +0.2 Damage", -- Black Feather items
	
	["Bulb Multiple"] = "Only checks the primary active item", -- Vibrant/Dim Bulb + Schoolbag/Pocket Actives
	["Bulb Zero"] = "Actives with 0 max charges trigger the bulb", -- Vibrant/Dim Bulb + zero charge actives
	["5.350.101 (Timed)"] = "Basically useless with timed recharges", -- Dim Bulb + Timed Recharges
	["5.100.122"] = "Triggers at 1 Red Heart as {1}", -- Whore of Babylon + Eve
	
	["5.70.28"] = "Isaac shoots forward and to the sides instead", -- R U A Wizard + The Wiz
	["5.100.523"] = "Counts as a passive item to {1}", -- Moving Box + Void
	["Mongo Babies"] = "Can be copied by {1}", -- Mongo Baby + Baby Familiars
	["Technology 2 One Eye"] = "With {1}, the laser replaces your tears entirely",
	["Brimstone Proptosis"] = "Beams deal additional 2x damage at point blank range, decreasing with distance",
	["Brimstone Ipecac"] = "Ipecac tears are fired while charging#The +40 damage applies to the laser",
	["Proptosis Anti-Gravity"] = "Tears don't lose damage until they start moving",
	["Epic Fetus Soy Milk"] = "Crosshair time is not shortened, but missile damage is drastically reduced",
	["Eye of Belial Dr. Fetus"] = "Bombs pierce, but don't home or do additional damage",
	["Epic Fetus Brimstone"] = "{1} has priority#Rockets shoot out 10 beams",
	["Epic Fetus Mom's Knife"] = "{1} has priority#Rockets shoot out 10 knives",
	["Haemolacria Brimstone"] = "{1} has priority#Tears split into 4-7 beams",
	["Brimstone Mom's Knife"] = "{1} has priority#A barrage of knives shoot out based on charge amount",
	["Ludovico Ipecac"] = "The tear gets +4 damage but doesn't explode or poison",
	["Technology Ipecac"] = "The laser gets +4 damage and poisons targets",
	["Chocolate Milk Overrides"] = "↑ {{Tears}} x1.25 Tears multiplier",
	["Chocolate Milk Marked"] = "Isaac automatically charges based on distance from the crosshair",
	["Ghost Pepper Fart"] = "Farting causes a flame to shoot out behind Isaac",
	["Damage Multiplier Stack"] = "The damage multiplier doesn't stack",
	["White Poop"] = "Spawns White Poop instead",
	["White Poop Chance"] = "Chance to spawn White Poop",
	["Golden Poop Chance"] = "Chance to spawn Golden Poop",
	["5.100.483"] = "{{GoldenBomb}} Having a golden bomb when using the item consumes it and allows for another use of Mama Mega",
	
	["5.300.5"] = {"{{BossRoom}} Teleports Isaac to a random Boss Room"}, -- IV - The Emperor (in The Void)
	["5.300.18"] = "Teleports Isaac to a random room if there's no Treasure Room", -- XVII - The Stars (Womb and below)
	["5.300.18 (Greed)"] = {"{{TreasureRoom}} Teleports Isaac to a random Treasure Room"}, -- XVII - The Stars (Greed)
	["5.300.18 (Late Greed)"] = {"Teleports Isaac to the first room of the floor"}, -- XVII - The Stars (Greed Last Floors)
	["5.300.10"] = "Teleports Isaac to a random room if there's no Shop", -- IX - The Hermit (Womb and below)
	
}



