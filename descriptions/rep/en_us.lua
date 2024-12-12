---------------------------------------
-----  Basic English descriptions -----
---------------------------------------

-- FORMAT: Item ID | Name | Description

-- Special character markup:
-- ↑ = Up Arrow  |  ↓ = Down Arrow  |  # = Starts a new line
-- More can be found here: https://github.com/wofsauge/External-Item-Descriptions/wiki/Markup

local languageCode = "en_us"

---------- Collectibles ----------

local repCollectibles={
	[2] = {"2", "The Inner Eye", ""}, -- The Inner Eye
	[5] = {"5", "My Reflection", ""}, -- My Reflection
	[6] = {"6", "Number One", ""}, -- Number One
	[12] = {"12", "Magic Mushroom", ""}, -- Magic Mushroom
	[13] = {"13", "The Virus", ""}, -- The Virus
	[14] = {"14", "Roid Rage", ""}, -- Roid Rage
	[18] = {"18", "A Dollar", ""}, -- A Dollar
	[22] = {"22", "Lunch", ""}, -- Lunch
	[23] = {"23", "Dinner", ""}, -- Dinner
	[24] = {"24", "Dessert", ""}, -- Dessert
	[25] = {"25", "Breakfast", ""}, -- Breakfast
	[26] = {"26", "Rotten Meat", ""}, -- Rotten Meat
	[29] = {"29", "Mom's Underwear", ""}, -- Mom's Underwear
	[30] = {"30", "Mom's Heels", ""}, -- Mom's Heels
	[31] = {"31", "Mom's Lipstick", ""}, -- Mom's Lipstick
	[37] = {"37", "Mr. Boom", ""}, -- Mr. Boom
	[40] = {"40", "Kamikaze!", ""}, -- Kamikaze!
	[41] = {"41", "Mom's Pad", ""}, -- Mom's Pad
	[42] = {"42", "Bob's Rotten Head", ""}, -- Bob's Rotten Head
	[46] = {"46", "Lucky Foot", ""}, -- Lucky Foot
	[49] = {"49", "Shoop da Whoop!", ""}, -- Shoop da Whoop!
	[52] = {"52", "Dr. Fetus", ""}, -- Dr. Fetus
	[53] = {"53", "Magneto", ""}, -- Magneto
	[55] = {"55", "Mom's Eye", ""}, -- Mom's Eye
	[59] = {"59", "The Book of Belial", ""}, -- The Book of Belial (Judas' Birthright)
	[62] = {"62", "Charm of the Vampire", ""}, -- Charm of the Vampire
	[67] = {"67", "Sister Maggy", ""}, -- Sister Maggy
	[69] = {"69", "Chocolate Milk", ""}, -- Chocolate Milk
	[70] = {"70", "Growth Hormones", ""}, -- Growth Hormones
	[71] = {"71", "Mini Mush", ""}, -- Mini Mush
	[72] = {"72", "Rosary", ""}, -- Rosary
	[78] = {"78", "Book of Revelations", ""}, -- Book of Revelations
	[79] = {"79", "The Mark", ""}, -- The Mark
	[80] = {"80", "The Pact", ""}, -- The Pact
	[83] = {"83", "The Nail", ""}, -- The Nail
	[84] = {"84", "We Need To Go Deeper!", ""}, -- We Need To Go Deeper!
	[87] = {"87", "Loki's Horns", ""}, -- Loki's Horns
	[91] = {"91", "Spelunker Hat", ""}, -- Spelunker Hat
	[98] = {"98", "The Relic", ""}, -- The Relic
	[101] = {"101", "The Halo", ""}, -- The Halo
	[106] = {"106", "Mr. Mega", ""}, -- Mr. Mega
	[107] = {"107", "The Pinking Shears", ""}, -- The Pinking Shears
	[110] = {"110", "Mom's Contacts", ""}, -- Mom's Contacts
	[114] = {"114", "Mom's Knife", ""}, -- Mom's Knife
	[115] = {"115", "Ouija Board", ""}, -- Ouija Board
	[118] = {"118", "Brimstone", ""}, -- Brimstone
	[121] = {"121", "Odd Mushroom (Large)", ""}, -- Odd Mushroom (Large)
	[123] = {"123", "Monster Manual", ""}, -- Monster Manual
	[126] = {"126", "Razor Blade", ""}, -- Razor Blade
	[129] = {"129", "Bucket of Lard", ""}, -- Bucket of Lard
	[138] = {"138", "Stigmata", ""}, -- Stigmata
	[139] = {"139", "Mom's Purse", ""}, -- Mom's Purse
	[140] = {"140", "Bob's Curse", ""}, -- Bob's Curse
	[142] = {"142", "Scapular", ""}, -- Scapular
	[147] = {"147", "Notched Axe", ""}, -- Notched Axe
	[148] = {"148", "Infestation", ""}, -- Infestation
	[149] = {"149", "Ipecac", ""}, -- Ipecac
	[152] = {"152", "Technology 2", ""}, -- Technology 2
	[153] = {"153", "Mutant Spider", ""}, -- Mutant Spider
	[155] = {"155", "The Peeper", ""}, -- The Peeper
	[158] = {"158", "Crystal Ball", ""}, -- Crystal Ball
	[169] =	{"169", "Polyphemus", ""}, -- Polyphemus
	[171] = {"171", "Spider Butt", ""}, -- Spider Butt
	[172] = {"172", "Sacrificial Dagger", ""}, -- Sacrificial Dagger
	[173] = {"173", "Mitre", ""}, -- Mitre
	[176] = {"176", "Stem Cells", ""}, -- Stem Cells
	[178] = {"178", "Holy Water", ""}, -- Holy Water
	[180] = {"180", "The Black Bean", ""}, -- The Black Bean
	[182] = {"182", "Sacred Heart", ""}, -- Sacred Heart
	[184] = {"184", "Holy Grail", ""}, -- Holy Grail
	[186] = {"186", "Blood Rights", ""}, -- Blood Rights
	[189] = {"189", "SMB Super Fan", ""}, -- SMB Super Fan
	[192] = {"192", "Telepathy for Dummies", ""}, -- Telepathy for Dummies
	[193] = {"193", "MEAT!", ""}, -- MEAT!
	[194] = {"194", "Magic 8 Ball", ""}, -- Magic 8 Ball
	[197] = {"197", "Jesus Juice", ""}, -- Jesus Juice
	[203] = {"203", "Humbleing Bundle", ""}, -- Humbleing Bundle
	[205] = {"205", "Sharp Plug", ""}, -- Sharp Plug
	[206] = {"206", "Guillotine", ""}, -- Guillotine
	[211] = {"211", "Spiderbaby", ""}, -- Spiderbaby
	[214] = {"214", "Anemic", ""}, -- Anemic
	[218] = {"218", "Placenta", ""}, -- Placenta
	[219] = {"219", "Old Bandage", ""}, -- Old Bandage
	[222] =	{"222", "Anti-Gravity", ""}, -- Anti-Gravity
	[223] = {"223", "Pyromaniac", ""}, -- Pyromaniac
	[224] = {"224", "Cricket's Body", ""}, -- Cricket's Body
	[225] = {"225", "Gimpy", ""}, -- Gimpy
	[226] = {"226", "Black Lotus", ""}, -- Black Lotus
	[228] = {"228", "Mom's Perfume", ""}, -- Mom's Perfume
	[229] =	{"229", "Monstro's Lung", ""}, -- Monstro's Lung
	[230] = {"230", "Abaddon", ""}, -- Abaddon
	[232] = {"232", "Stop Watch", ""}, -- Stop Watch
	[233] = {"233", "Tiny Planet", ""}, -- Tiny Planet
	[245] = {"245", "20/20", ""}, -- 20/20
	[248] = {"248", "Hive Mind", ""}, -- Hive Mind
	[253] = {"253", "Magic Scab", ""}, -- Magic Scab
	[254] = {"254", "Blood Clot", ""}, -- Blood Clot
	[256] = {"256", "Hot Bombs", ""}, -- Hot Bombs
	[261] = {"261", "Proptosis", ""}, -- Proptosis
	[262] = {"262", "Missing Page 2", ""}, -- Missing Page 2
	[263] = {"263", "Clear Rune", ""}, -- Clear Rune (Repentance item)
	[264] = {"264", "Smart Fly", ""}, -- Smart Fly
	[272] = {"272", "BBF", ""}, -- BBF
	[273] = {"273", "Bob's Brain", ""}, -- Bob's Brain
	[274] = {"274", "Best Bud", ""}, -- Best Bud
	[275] = {"275", "Lil Brimstone", ""}, -- Lil Brimstone
	[276] = {"276", "Isaac's Heart", ""}, -- Isaac's Heart
	[278] = {"278", "Dark Bum", ""}, -- Dark Bum
	[280] = {"280", "Sissy Longlegs", ""}, -- Sissy Longlegs
	[283] = {"283", "D100", ""}, -- D100
	[285] = {"285", "D10", ""}, -- D10
	[286] = {"286", "Blank Card", ""}, -- Blank Card
	[287] = {"287", "Book of Secrets", ""}, -- Book of Secrets
	[288] = {"288", "Box of Spiders", ""}, -- Box of Spiders
	[289] = {"289", "Red Candle", ""}, -- Red Candle
	[291] = {"291", "Flush!", ""}, -- Flush!
	[292] = {"292", "Satanic Bible", ""}, -- Satanic Bible
	[293] = {"293", "Head of Krampus", ""}, -- Head of Krampus
	[294] = {"294", "Butter Bean", ""}, -- Butter Bean
	[295] = {"295", "Magic Fingers", ""}, -- Magic Fingers
	[296] = {"296", "Converter", ""}, -- Converter
	-- NOTE FOR LOCALIZERS: There is code to highlight the text of your current floor
	-- For it to work, only use line breaks or semicolons to separate floor details, and use the same order as English
	[297] = {"297", "Pandora's Box", ""}, -- Pandora's Box
	[300] = {"300", "Aries", ""}, -- Aries
	[307] = {"307", "Capricorn", ""}, -- Capricorn
	[308] = {"308", "Aquarius", ""}, -- Aquarius
	[309] =	{"309", "Pisces", ""}, -- Pisces
	[310] =	{"310", "Eve's Mascara", ""}, -- Eve's Mascara
	[314] = {"314", "Thunder Thighs", ""}, -- Thunder Thighs
	[315] = {"315", "Strange Attractor", ""}, -- Strange Attractor
	[316] = {"316", "Cursed Eye", ""}, -- Cursed Eye
	[319] = {"319", "Cain's Other Eye", ""}, -- Cain's Other Eye
	[320] = {"320", "???'s Only Friend", ""}, -- ???'s Only Friend
	[323] = {"323", "Isaac's Tears", ""}, -- Isaac's Tears
	[325] = {"325", "Scissors", ""}, -- Scissors
	[326] = {"326", "Breath of Life", ""}, -- Breath of Life
	[328] = {"328", "The Negative", ""}, -- The Negative
	[330] = {"330", "Soy Milk", ""}, -- Soy Milk
	[331] = {"331", "Godhead", ""}, -- Godhead
	[336] = {"336", "Dead Onion", ""}, -- Dead Onion
	[339] = {"339", "Safety Pin", ""}, -- Safety Pin
	[342] = {"342", "Blue Cap", ""}, -- Blue Cap
	[344] = {"344", "Match Book", ""}, -- Match Book
	[345] = {"345", "Synthoil", ""}, -- Synthoil
	[346] = {"346", "A Snack", ""}, -- A Snack
	[349] = {"349", "Wooden Nickel", ""}, -- Wooden Nickel
	[352] = {"352", "Glass Cannon", ""}, -- Glass Cannon
	[354] = {"354", "Crack Jacks", ""}, -- Crack Jacks
	[355] = {"355", "Mom's Pearls", ""}, -- Mom's Pearls
	[360] = {"360", "Incubus", ""}, -- Incubus
	[365] = {"365", "Lost Fly", ""}, -- Lost Fly
	[366] = {"366", "Scatter Bombs", ""}, -- Scatter Bombs
	[367] = {"367", "Sticky Bombs", ""}, -- Sticky Bombs
	[368] =	{"368", "Epiphora", ""}, -- Epiphora
	[369] = {"369", "Continuum", ""}, -- Continuum
	[370] = {"370", "Mr. Dolly", ""}, -- Mr. Dolly
	[374] = {"374", "Holy Light", ""}, -- Holy Light
	[375] = {"375", "Host Hat", ""}, -- Host Hat
	[376] = {"376", "Restock", ""}, -- Restock
	[380] = {"380", "Pay To Play", ""}, -- Pay To Play
	[382] = {"382", "Friendly Ball", ""}, -- Friendly Ball
	[384] = {"384", "Lil Gurdy", ""}, -- Lil Gurdy
	[386] = {"386", "D12", ""}, -- D12
	[389] = {"389", "Rune Bag", ""}, -- Rune Bag
	[391] = {"391", "Betrayal", ""}, -- Betrayal
	[393] = {"393", "Serpent's Kiss", ""}, -- Serpent's Kiss
	[394] = {"394", "Marked", ""}, -- Marked
	[395] = {"395", "Tech X", ""}, -- Tech X
	[397] = {"397", "Tractor Beam", ""}, -- Tractor Beam
	[399] = {"399", "Maw of the Void", ""}, -- Maw of the Void
	[401] = {"401", "Explosivo", ""}, -- Explosivo
	[404] = {"404", "Farting Baby", ""}, -- Farting Baby
	[405] = {"405", "GB Bug", ""}, -- GB Bug
	[407] = {"407", "Purity", ""}, -- Purity
	[408] = {"408", "Athame", ""}, -- Athame
	[415] = {"415", "Crown Of Light", ""}, -- Crown Of Light
	[416] = {"416", "Deep Pockets", ""}, -- Deep Pockets
	[417] = {"417", "Succubus", ""}, -- Succubus
	[419] = {"419", "Teleport 2.0", ""}, -- Teleport 2.0
	[421] = {"421", "Kidney Bean", ""}, -- Kidney Bean
	[422] = {"422", "Glowing Hourglass", ""}, -- Glowing Hourglass
	[426] = {"426", "Obsessed Fan", ""}, -- Obsessed Fan
	[430] = {"430", "Papa Fly", ""}, -- Papa Fly
	[431] = {"431", "Multidimensional Baby", ""}, -- Multidimensional Baby
	[432] = {"432", "Glitter Bombs", ""}, -- Glitter Bombs
	[433] = {"433", "My Shadow", ""}, -- My Shadow
	[437] = {"437", "D7", ""}, -- D7
	[440] = {"440", "Kidney Stone", ""}, -- Kidney Stone
	[442] = {"442", "Dark Prince's Crown", ""}, -- Dark Prince's Crown
	[444] = {"444", "Lead Pencil", ""}, -- Lead Pencil
	[448] = {"448", "Shard of Glass", ""}, -- Shard of Glass
	[450] = {"450", "Eye of Greed", ""}, -- Eye of Greed
	[451] = {"451", "Tarot Cloth", ""}, -- Tarot Cloth
	[453] = {"453", "Compound Fracture", ""}, -- Compound Fracture
	[455] = {"455", "Dad's Lost Coin", ""}, -- Dad's Lost Coin
	[456] = {"456", "Midnight Snack", ""}, -- Midnight Snack
	[459] = {"459", "Sinus Infection", ""}, -- Sinus Infection
	[462] = {"462", "Eye of Belial", ""}, -- Eye of Belial
	[464] = {"464", "Glyph of Balance", ""}, -- Glyph of Balance
	[468] = {"468", "Shade", ""}, -- Shade
	[472] = {"472", "King Baby", ""}, -- King Baby
	[474] = {"474", "Broken Glass Cannon", ""}, -- Broken Glass Cannon
	[476] =	{"476", "D1", ""}, -- D1
	[477] = {"477", "Void", ""}, -- Void
	[487] = {"487", "Potato Peeler", ""}, -- Potato Peeler
	[489] = {"489", "D Infinity", ""}, -- D Infinity
	[491] = {"491", "Acid Baby", ""}, -- Acid Baby
	[493] = {"493", "Adrenaline", ""}, -- Adrenaline
	[494] = {"494", "Jacob's Ladder", ""}, -- Jacob's Ladder
	[495] = {"495", "Ghost Pepper", ""}, -- Ghost Pepper
	[496] = {"496", "Euthanasia", ""}, -- Euthanasia
	[497] = {"497", "Camo Undies", ""}, -- Camo Undies
	[500] = {"500", "Sack of Sacks", ""}, -- Sack of Sacks
	[501] = {"501", "Greed's Gullet", ""}, -- Greed's Gullet
	[503] = {"503", "Little Horn", ""}, -- Little Horn
	[504] = {"504", "Brown Nugget", ""}, -- Brown Nugget
	[506] = {"506", "Backstabber", ""}, -- Backstabber
	[507] = {"507", "Sharp Straw", ""}, -- Sharp Straw
	[508] = {"508", "Mom's Razor", ""}, -- Mom's Razor
	[509] = {"509", "Bloodshot Eye", ""}, -- Bloodshot Eye
	[514] = {"514", "Broken Modem", ""}, -- Broken Modem
	[517] = {"517", "Fast Bombs", ""}, -- Fast Bombs
	[522] = {"522", "Telekinesis", ""}, -- Telekinesis
	[523] = {"523", "Moving Box", ""}, -- Moving Box
	[524] = {"524", "Technology Zero", ""}, -- Technology Zero
	[531] = {"531", "Haemolacria", ""}, -- Haemolacria
	[543] = {"543", "Hallowed Ground", ""}, -- Hallowed Ground
	[549] =	{"549", "Brittle Bones", ""}, -- Brittle Bones
	[552] = {"552", "Mom's Shovel", ""}, -- Mom's Shovel
	[553] = {"553", "Mucormycosis", ""}, -- Mucormycosis
	[554] = {"554", "2Spooky", ""}, -- 2Spooky
	[555] = {"555", "Golden Razor", ""}, -- Golden Razor
	[556] = {"556", "Sulfur", ""}, -- Sulfur
	[557] = {"557", "Fortune Cookie", ""}, -- Fortune Cookie
	[558] = {"558", "Eye Sore", ""}, -- Eye Sore
	[559] = {"559", "120 Volt", ""}, -- 120 Volt
	[560] = {"560", "It Hurts", ""}, -- It Hurts
	[561] = {"561", "Almond Milk", ""}, -- Almond Milk
	[562] = {"562", "Rock Bottom", ""}, -- Rock Bottom
	[563] = {"563", "Nancy Bombs", ""}, -- Nancy Bombs
	[564] = {"564", "A Bar of Soap", ""}, -- A Bar of Soap
	[565] = {"565", "Blood Puppy", ""}, -- Blood Puppy
	[566] = {"566", "Dream Catcher", ""}, -- Dream Catcher
	[567] = {"567", "Paschal Candle", ""}, -- Paschal Candle
	[568] = {"568", "Divine Intervention", ""}, -- Divine Intervention
	[569] = {"569", "Blood Oath", ""}, -- Blood Oath
	[570] = {"570", "Playdough Cookie", ""}, -- Playdough Cookie
	[571] = {"571", "Orphan Socks", ""}, -- Orphan Socks
	[572] = {"572", "Eye of the Occult", ""}, -- Eye of the Occult
	[573] = {"573", "Immaculate Heart", ""}, -- Immaculate Heart
	[574] = {"574", "Monstrance", ""}, -- Monstrance
	[575] = {"575", "The Intruder", ""}, -- The Intruder
	[576] = {"576", "Dirty Mind", ""}, -- Dirty Mind
	[577] = {"577", "Damocles", ""}, -- Damocles
	[578] = {"578", "Free Lemonade", ""}, -- Free Lemonade
	[579] = {"579", "Spirit Sword", ""}, -- Spirit Sword
	[580] = {"580", "Red Key", ""}, -- Red Key
	[581] = {"581", "Psy Fly", ""}, -- Psy Fly
	[582] = {"582", "Wavy Cap", ""}, -- Wavy Cap
	[583] = {"583", "Rocket in a Jar", ""}, -- Rocket in a Jar
	[584] = {"584", "Book of Virtues", ""}, -- Book of Virtues
	[585] = {"585", "Alabaster Box", ""}, -- Alabaster Box
	[586] = {"586", "The Stairway", ""}, -- The Stairway
	[587] = {"587", "", ""},
	[588] = {"588", "Sol", ""}, -- Sol
	[589] = {"589", "Luna", ""}, -- Luna
	[590] = {"590", "Mercurius", ""}, -- Mercurius
	[591] = {"591", "Venus", ""}, -- Venus
	[592] = {"592", "Terra", ""}, -- Terra
	[593] = {"593", "Mars", ""}, -- Mars
	[594] = {"594", "Jupiter", ""}, -- Jupiter
	[595] = {"595", "Saturnus", ""}, -- Saturnus
	[596] = {"596", "Uranus", ""}, -- Uranus
	[597] = {"597", "Neptunus", ""}, -- Neptunus
	[598] = {"598", "Pluto", ""}, -- Pluto
	[599] = {"599", "Voodoo Head", ""}, -- Voodoo Head
	[600] = {"600", "Eye Drops", ""}, -- Eye Drops
	[601] = {"601", "Act of Contrition", ""}, -- Act of Contrition
	[602] = {"602", "Member Card", ""}, -- Member Card
	[603] = {"603", "Battery Pack", ""}, -- Battery Pack
	[604] = {"604", "Mom's Bracelet", ""}, -- Mom's Bracelet
	[605] = {"605", "The Scooper", ""}, -- The Scooper
	[606] = {"606", "Ocular Rift", ""}, -- Ocular Rift
	[607] = {"607", "Boiled Baby", ""}, -- Boiled Baby
	[608] = {"608", "Freezer Baby", ""}, -- Freezer Baby
	[609] = {"609", "Eternal D6", ""}, -- Eternal D6
	[610] = {"610", "Bird Cage", ""}, -- Bird Cage
	[611] = {"611", "Larynx", ""}, -- Larynx
	[612] = {"612", "Lost Soul", ""}, -- Lost Soul
	[613] = {"613", "", ""},
	[614] = {"614", "Blood Bombs", ""}, -- Blood Bombs
	[615] = {"615", "Lil Dumpy", ""}, -- Lil Dumpy
	[616] = {"616", "Bird's Eye", ""}, -- Bird's Eye
	[617] = {"617", "Lodestone", ""}, -- Lodestone
	[618] = {"618", "Rotten Tomato", ""}, -- Rotten Tomato
	[619] = {"619", "Birthright", ""}, -- Birthright
	[620] = {"620", "", ""},
	[621] = {"621", "Red Stew", ""}, -- Red Stew
	[622] = {"622", "Genesis", ""}, -- Genesis
	[623] = {"623", "Sharp Key", ""}, -- Sharp Key
	[624] = {"624", "Booster Pack", ""}, -- Booster Pack
	[625] = {"625", "Mega Mush", ""}, -- Mega Mush
	[626] = {"626", "Knife Piece 1", ""}, -- Knife Piece 1
	[627] = {"627", "Knife Piece 2", ""}, -- Knife Piece 2
	[628] = {"628", "Death Certificate", ""}, -- Death Certificate
	[629] = {"629", "Bot Fly", ""}, -- Bot Fly
	[630] = {"630", "", ""},
	[631] = {"631", "Meat Cleaver", ""}, -- Meat Cleaver
	[632] = {"632", "Evil Charm", ""}, -- Evil Charm
	[633] = {"633", "Dogma", ""}, -- Dogma
	[634] = {"634", "Purgatory", ""}, -- Purgatory
	[635] = {"635", "Stitches", ""}, -- Stitches
	[636] = {"636", "R Key", ""}, -- R Key
	[637] = {"637", "Knockout Drops", ""}, -- Knockout Drops
	[638] = {"638", "Eraser", ""}, -- Eraser
	[639] = {"639", "Yuck Heart", ""}, -- Yuck Heart
	[640] = {"640", "Urn of Souls", ""}, -- Urn of Souls
	[641] = {"641", "Akeldama", ""}, -- Akeldama
	[642] = {"642", "Magic Skin", ""}, -- Magic Skin
	[643] = {"643", "Revelation", ""}, -- Revelation
	[644] = {"644", "Consolation Prize", ""}, -- Consolation Prize
	[645] = {"645", "Tinytoma", ""}, -- Tinytoma
	[646] = {"646", "Brimstone Bombs", ""}, -- Brimstone Bombs
	[647] = {"647", "4.5 Volt", ""}, -- 4.5 Volt
	[648] = {"648", "", ""},
	[649] = {"649", "Fruity Plum", ""}, -- Fruity Plum
	[650] = {"650", "Plum Flute", ""}, -- Plum Flute
	[651] = {"651", "Star of Bethlehem", ""}, -- Star of Bethlehem
	[652] = {"652", "Cube Baby", ""}, -- Cube Baby
	[653] = {"653", "Vade Retro", ""}, -- Vade Retro
	[654] = {"654", "False PHD", ""}, -- False PHD
	[655] = {"655", "Spin to Win", ""}, -- Spin to Win
	[656] = {"656", "Damocles", ""}, -- Damocles (hidden passive version)
	[657] = {"657", "Vasculitis", ""}, -- Vasculitis
	[658] = {"658", "Giant Cell", ""}, -- Giant Cell
	[659] = {"659", "Tropicamide", ""}, -- Tropicamide
	[660] = {"660", "Card Reading", ""}, -- Card Reading
	[661] = {"661", "Quints", ""}, -- Quints
	[662] = {"662", "", ""},
	[663] = {"663", "Tooth and Nail", ""}, -- Tooth and Nail
	[664] = {"664", "Binge Eater", ""}, -- Binge Eater
	[665] = {"665", "Guppy's Eye", ""}, -- Guppy's Eye
	[666] = {"666", "", ""},
	[667] = {"667", "Strawman", ""}, -- Strawman
	[668] = {"668", "Dad's Note", ""}, -- Dad's Note
	[669] = {"669", "Sausage", ""}, -- Sausage
	[670] = {"670", "Options?", ""}, -- Options?
	[671] = {"671", "Candy Heart", ""}, -- Candy Heart
	[672] = {"672", "A Pound of Flesh", ""}, -- A Pound of Flesh
	[673] = {"673", "Redemption", ""}, -- Redemption
	[674] = {"674", "Spirit Shackles", ""}, -- Spirit Shackles
	[675] = {"675", "Cracked Orb", ""}, -- Cracked Orb
	[676] = {"676", "Empty Heart", ""}, -- Empty Heart
	[677] = {"677", "Astral Projection", ""}, -- Astral Projection
	[678] = {"678", "C Section", ""}, -- C Section
	[679] = {"679", "Lil Abaddon", ""}, -- Lil Abaddon
	[680] = {"680", "Montezuma's Revenge", ""}, -- Montezuma's Revenge
	[681] = {"681", "Lil Portal", ""}, -- Lil Portal
	[682] = {"682", "Worm Friend", ""}, -- Worm Friend
	[683] = {"683", "Bone Spurs", ""}, -- Bone Spurs
	[684] = {"684", "Hungry Soul", ""}, -- Hungry Soul
	[685] = {"685", "Jar of Wisps", ""}, -- Jar of Wisps
	[686] = {"686", "Soul Locket", ""}, -- Soul Locket
	[687] = {"687", "Friend Finder", ""}, -- Friend Finder
	[688] = {"688", "Inner Child", ""}, -- Inner Child
	[689] = {"689", "Glitched Crown", ""}, -- Glitched Crown
	[690] = {"690", "Belly Jelly", ""}, -- Belly Jelly
	[691] = {"691", "Sacred Orb", ""}, -- Sacred Orb
	[692] = {"692", "Sanguine Bond", ""}, -- Sanguine Bond
	[693] = {"693", "The Swarm", ""}, -- The Swarm
	[694] = {"694", "Heartbreak", ""}, -- Heartbreak
	[695] = {"695", "Bloody Gust", ""}, -- Bloody Gust
	[696] = {"696", "Salvation", ""}, -- Salvation
	[697] = {"697", "Vanishing Twin", ""}, -- Vanishing Twin
	[698] = {"698", "Twisted Pair", ""}, -- Twisted Pair
	[699] = {"699", "Azazel's Rage", ""}, -- Azazel's Rage
	[700] = {"700", "Echo Chamber", ""}, -- Echo Chamber
	[701] = {"701", "Isaac's Tomb", ""}, -- Isaac's Tomb
	[702] = {"702", "Vengeful Spirit", ""}, -- Vengeful Spirit
	[703] = {"703", "Esau Jr.", ""}, -- Esau Jr.
	[704] = {"704", "Berserk!", ""}, -- Berserk!
	[705] = {"705", "Dark Arts", ""}, -- Dark Arts
	[706] = {"706", "Abyss", ""}, -- Abyss
	[707] = {"707", "Supper", ""}, -- Supper
	[708] = {"708", "Stapler", ""}, -- Stapler
	[709] = {"709", "Suplex!", ""}, -- Suplex!
	[710] = {"710", "Bag of Crafting", ""}, -- Bag of Crafting
	[711] = {"711", "Flip", ""}, -- Flip
	[712] = {"712", "Lemegeton", ""}, -- Lemegeton
	[713] = {"713", "Sumptorium", ""}, -- Sumptorium
	[714] = {"714", "Recall", ""}, -- Recall
	[715] = {"715", "Hold", ""}, -- Hold
	[716] = {"716", "Keeper's Sack", ""}, -- Keeper's Sack
	[717] = {"717", "Keeper's Kin", ""}, -- Keeper's Kin
	[718] = {"718", "", ""},
	[719] = {"719", "Keeper's Box", ""}, -- Keeper's Box
	[720] = {"720", "Everything Jar", ""}, -- Everything Jar
	[721] = {"721", "TMTRAINER", ""}, -- TMTRAINER
	[722] = {"722", "Anima Sola", ""}, -- Anima Sola
	[723] = {"723", "Spindown Dice", ""}, -- Spindown Dice
	[724] = {"724", "Hypercoagulation", ""}, -- Hypercoagulation
	[725] = {"725", "IBS", ""}, -- IBS
	[726] = {"726", "Hemoptysis", ""}, -- Hemoptysis
	[727] = {"727", "Ghost Bombs", ""}, -- Ghost Bombs
	[728] = {"728", "Gello", ""}, -- Gello
	[729] = {"729", "Decap Attack", ""}, -- Decap Attack
	[730] = {"730", "Glass Eye", ""}, -- Glass Eye
	[731] = {"731", "Stye", ""}, -- Stye
	[732] = {"732", "Mom's Ring", ""}, -- Mom's Ring
}
EID:updateDescriptionsViaTable(repCollectibles, EID.descriptions[languageCode].collectibles)

---------- Trinkets ----------

local repTrinkets={
	[10] = {"10", "Wiggle Worm", ""}, -- Wiggle Worm
	[11] = {"11", "Ring Worm", ""}, -- Ring Worm
	[15] = {"15", "Lucky Rock", ""},-- Lucky Rock
	[16] = {"16", "Mom's Toenail", ""}, -- Mom's Toenail
	[24] = {"24", "Butt Penny", ""}, -- Butt Penny
	[26] = {"26", "Hook Worm", ""}, -- Hook Worm
	[32] = {"32", "Liberty Cap", ""}, -- Liberty Cap
	[33] = {"33", "Umbilical Cord", ""}, -- Umbilical Cord
	[39] = {"39", "Cancer", ""}, -- Cancer
	[48] = {"48", "A Missing Page", ""}, -- A Missing Page
	[49] = {"49", "Bloody Penny", ""}, -- Bloody Penny
	[50] = {"50", "Burnt Penny", ""}, -- Burnt Penny
	[51] = {"51", "Flat Penny", ""}, -- Flat Penny
	[65] = {"65", "Tape Worm", ""}, -- Tape Worm
	[66] = {"66", "Lazy Worm", ""}, -- Lazy Worm
	[67] = {"67", "Cracked Dice", ""}, -- Cracked Dice
	[69] = {"69", "Faded Polaroid", ""}, -- Faded Polaroid
	[80] = {"80", "Black Feather", ""}, -- Black Feather
	[92] = {"92", "Cracked Crown", ""}, -- Cracked Crown
	[96] = {"96", "Ouroboros Worm", ""}, -- Ouroboros Worm
	[98] = {"98", "Nose Goblin", ""}, -- Nose Goblin
	[101] = {"101", "Dim Bulb", ""}, -- Dim Bulb
	[107] = {"107", "Crow Heart", ""}, -- Crow Heart
	[110] = {"110", "Silver Dollar", ""}, -- Silver Dollar
	[111] = {"111", "Bloody Crown", ""}, -- Bloody Crown
	[119] = {"119", "Stem Cell", ""}, -- Stem Cell
	[125] = {"125", "Extension Cord", ""}, -- Extension Cord
	[128] = {"128", "Finger Bone", ""}, -- Finger Bone
	[129] = {"129", "Jawbreaker", ""}, -- Jawbreaker
	[130] = {"130", "Chewed Pen", ""}, -- Chewed Pen
	[131] = {"131", "Blessed Penny", ""}, -- Blessed Penny
	[132] = {"132", "Broken Syringe", ""}, -- Broken Syringe
	[133] = {"133", "Short Fuse", ""}, -- Short Fuse
	[134] = {"134", "Gigante Bean", ""}, -- Gigante Bean
	[135] = {"135", "A Lighter", ""}, -- A Lighter
	[136] = {"136", "Broken Padlock", ""}, -- Broken Padlock
	[137] = {"137", "Myosotis", ""}, -- Myosotis
	[138] = {"138", "'M", ""}, -- 'M
	[139] = {"139", "Teardrop Charm", ""}, -- Teardrop Charm
	[140] = {"140", "Apple of Sodom", ""}, -- Apple of Sodom
	[141] = {"141", "Forgotten Lullaby", ""}, -- Forgotten Lullaby
	[142] = {"142", "Beth's Faith", ""}, -- Beth's Faith
	[143] = {"143", "Old Capacitor", ""}, -- Old Capacitor
	[144] = {"144", "Brain Worm", ""}, -- Brain Worm
	[145] = {"145", "Perfection", ""}, -- Perfection
	[146] = {"146", "Devil's Crown", ""}, -- Devil's Crown
	[147] = {"147", "Charged Penny", ""}, -- Charged Penny
	[148] = {"148", "Friendship Necklace", ""}, -- Friendship Necklace
	[149] = {"149", "Panic Button", ""}, -- Panic Button
	[150] = {"150", "Blue Key", ""}, -- Blue Key
	[151] = {"151", "Flat File", ""}, -- Flat File
	[152] = {"152", "Telescope Lens", ""}, -- Telescope Lens
	[153] = {"153", "Mom's Lock", ""}, -- Mom's Lock
	[154] = {"154", "Dice Bag", ""}, -- Dice Bag
	[155] = {"155", "Holy Crown", ""}, -- Holy Crown
	[156] = {"156", "Mother's Kiss", ""}, -- Mother's Kiss
	[157] = {"157", "Torn Card", ""}, -- Torn Card
	[158] = {"158", "Torn Pocket", ""}, -- Torn Pocket
	[159] = {"159", "Gilded Key", ""}, -- Gilded Key
	[160] = {"160", "Lucky Sack", ""}, -- Lucky Sack
	[161] = {"161", "Wicked Crown", ""}, -- Wicked Crown
	[162] = {"162", "Azazel's Stump", ""}, -- Azazel's Stump
	[163] = {"163", "Dingle Berry", ""}, -- Dingle Berry
	[164] = {"164", "Ring Cap", ""}, -- Ring Cap
	[165] = {"165", "Nuh Uh!", ""}, -- Nuh Uh!
	[166] = {"166", "Modeling Clay", ""}, -- Modeling Clay
	[167] = {"167", "Polished Bone", ""}, -- Polished Bone
	[168] = {"168", "Hollow Heart", ""}, -- Hollow Heart
	[169] = {"169", "Kid's Drawing", ""}, -- Kid's Drawing
	[170] = {"170", "Crystal Key", ""}, -- Crystal Key
	[171] = {"171", "Keeper's Bargain", ""}, -- Keeper's Bargain
	[172] = {"172", "Cursed Penny", ""}, -- Cursed Penny
	[173] = {"173", "Your Soul", ""}, -- Your Soul
	[174] = {"174", "Number Magnet", ""}, -- Number Magnet
	[175] = {"175", "Strange Key", ""}, -- Strange Key
	[176] = {"176", "Lil Clot", ""}, -- Lil Clot
	[177] = {"177", "Temporary Tattoo", ""}, -- Temporary Tattoo
	[178] = {"178", "Swallowed M80", ""}, -- Swallowed M80
	[179] = {"179", "RC Remote", ""}, -- RC Remote
	[180] = {"180", "Found Soul", ""}, -- Found Soul
	[181] = {"181", "Expansion Pack", ""}, -- Expansion Pack
	[182] = {"182", "Beth's Essence", ""}, -- Beth's Essence
	[183] = {"183", "The Twins", ""}, -- The Twins
	[184] = {"184", "Adoption Papers", ""}, -- Adoption Papers
	[185] = {"185", "Cricket Leg", ""}, -- Cricket Leg
	[186] = {"186", "Apollyon's Best Friend", ""}, -- Apollyon's Best Friend
	[187] = {"187", "Broken Glasses", ""}, -- Broken Glasses
	[188] = {"188", "Ice Cube", ""}, -- Ice Cube
	[189] = {"189", "Sigil of Baphomet", ""}, -- Sigil of Baphomet
}
EID:updateDescriptionsViaTable(repTrinkets, EID.descriptions[languageCode].trinkets)

EID.descriptions[languageCode].goldenTrinket = "Effect doubled!"
EID.descriptions[languageCode].tripledTrinket = "Effect tripled!"
EID.descriptions[languageCode].quadrupledTrinket = "Effect quadrupled!"

-- Most trinkets that can be doubled or tripled just have the numbers in their description multiplied
-- A few trinkets have odd edge cases where their effect completely changes, or is different depending on if it's Mom's Box or Golden
EID.descriptions[languageCode].goldenTrinketEffects = {
	-- Broken Remote (replace with Teleport 2.0 info)
	[4] = { "{{Collectible419}} Using an active item teleports Isaac to {{ColorGold}}a room that has not been cleared yet{{CR}}#Hierarchy: {{Room}}>{{BossRoom}}>{{SuperSecretRoom}}>{{Shop}}>{{TreasureRoom}}>{{SacrificeRoom}}> {{DiceRoom}}>{{Library}}>{{CursedRoom}}>{{MiniBoss}}>{{ChallengeRoom}}{{BossRushRoom}}>{{IsaacsRoom}}{{BarrenRoom}}> {{ArcadeRoom}}>{{ChestRoom}}>{{Planetarium}}>{{SecretRoom}}>{{DevilRoom}}{{AngelRoom}}>{{ErrorRoom}}"}, -- Teleport 2.0
	-- Broken Magnet (find+replace): find Phrase #1 in the localized description, change it to Phrase #2 for doubled
	[6] = { "coins", "pickups" },
	-- Rosary Bead append
	[7] = { "{{Collectible72}} Rosary is added to all item pools" },
	-- Golden Store Credit: full replace
	[13] = { "{{Shop}} {{ColorGold}}Allows Isaac to take Shop items for free{{CR}}#Chance to turn into a regular {{Trinket13}} Store Credit after each purchase" },
	-- Lucky Rock append (Gold / Mom's Box / Both)
	[15] = { "Rocks may drop 2 coins", "Rocks may drop 2 coins", "Rocks may drop 3 coins" },
	-- Golden Mysterious Candy makes Golden Poop
	[25] = { "poop", "golden poop" },
	-- Isaac's Fork (find+replace): find Phrase #1 in the localized description, change it to Phrase #2 or 3 for doubled/tripled
	[46] = { "half a heart", "a heart", "one and a half hearts" },
	-- Tick (replace): A full replacement for Golden / Mom's Box / Both, as the Golden version can be removed and only one effect is tripled
	[53] = {
		"{{HealingRed}} Heals {{ColorGold}}2{{CR}} hearts when entering a {{BossRoom}}Boss Room#-{{ColorGold}}30{{CR}}% boss health#{{ColorGold}}Removable!",
		"{{HealingRed}} Heals {{ColorGold}}2{{CR}} hearts when entering a {{BossRoom}}Boss Room#-{{ColorGold}}30{{CR}}% boss health#{{Warning}} Once picked up, it can't be removed#Only removeable with {{Trinket41}}Match Stick or gulping",
		"{{HealingRed}} Heals {{ColorGold}}3{{CR}} hearts when entering a {{BossRoom}}Boss Room#-{{ColorGold}}30{{CR}}% boss health#{{ColorGold}}Removable!",
	},
	-- Rainbow Worm (append): With Mom's Box, it gives 2 copies of the temp worm, and doubles 1 of those copies, for triple effect
	[64] = { "Worm's stat boosts are doubled", "Worm's stat boosts are tripled", "Worm's stat boosts are quadrupled", },
	-- Error (append): Same behavior as Rainbow Worm
	[75] = { "Trinket effect is doubled if possible", "Trinket effect is tripled if possible", "Trinket effect is quadrupled if possible", },
	-- NO!
	[88] = { "Prevents Quality {{Quality0}} items from spawning" },
	-- Gilded Key (Golden version only): it doesn't give a key. bug that might get fixed (maybe it'll give a Golden Key?)
	[159] = { "Replaces all chests (except Old/Mega) with golden chests#Golden chests can contain extra cards, pills or trinkets" },
	-- The Twins
	[183] = { "May copy/grant 2 familiars", "May copy/grant 2 familiars", "May copy/grant 3 familiars" },
}

--[[
Localizations may choose to overwrite specific data from EID.GoldenTrinketData in this table. For advanced users only.
Example: If French uses "Double" instead of "2x" for Purple Heart, they can do:
EID.descriptions[languageCode].goldenTrinketData = {
	[5] = {findReplace = true, mult = 2},
}
and then place
	[5] = { "Double", "Quadruple" },
in their goldenTrinketEffects
]]
EID.descriptions[languageCode].goldenTrinketData = { }

---------- Cards ----------

local repCards={
	[2] = {"2", "I - The Magician", ""}, -- I - The Magician
	[12] = {"12", "XI - Strength", ""}, -- XI - Strength
	[16] = {"16", "XV - The Devil", ""}, -- XV - The Devil
	[18] = {"18", "XVII - The Stars", ""}, -- XVII - The Stars
	[27] = {"27", "Ace of Clubs", ""}, -- Ace of Clubs
	[28] = {"28", "Ace of Diamonds", ""}, -- Ace of Diamonds
	[29] = {"29", "Ace of Spades", ""}, -- Ace of Spades
	[30] = {"30", "Ace of Hearts", ""}, -- Ace of Hearts
	[34] = {"34", "Ehwaz", ""}, -- Ehwaz
	[39] = {"39", "Algiz", ""}, -- Algiz
	[42] = {"42", "Chaos Card", ""}, -- Chaos Card
	[51] = {"51", "Holy Card", ""}, -- Holy Card
	[52] = {"52", "Huge Growth", ""}, -- Huge Growth
	[55] = {"55", "Rune Shard", ""}, -- Rune Shard
	[56] = {"56", "0 - The Fool?", ""}, -- 0 - The Fool?
	[57] = {"57", "I - The Magician?", ""}, -- I - The Magician?
	[58] = {"58", "II - The High Priestess?", ""}, -- II - The High Priestess?
	[59] = {"59", "III - The Empress?", ""}, -- III - The Empress?
	[60] = {"60", "IV - The Emperor?", ""}, -- IV - The Emperor?
	[61] = {"61", "V - The Hierophant?", ""}, -- V - The Hierophant?
	[62] = {"62", "VI - The Lovers?", ""}, -- VI - The Lovers?
	[63] = {"63", "VII - The Chariot?", ""}, -- VII - The Chariot?
	[64] = {"64", "VIII - Justice?", ""}, -- VIII - Justice?
	[65] = {"65", "IX - The Hermit?", ""}, -- IX - The Hermit?
	[66] = {"66", "X - Wheel of Fortune?", ""}, -- X - Wheel of Fortune?
	[67] = {"67", "XI - Strength?", ""}, -- XI - Strength?
	[68] = {"68", "XII - The Hanged Man?", ""}, -- XII - The Hanged Man?
	[69] = {"69", "XIII - Death?", ""}, -- XIII - Death?
	[70] = {"70", "XIV - Temperance?", ""}, -- XIV - Temperance?
	[71] = {"71", "XV - The Devil?", ""}, -- XV - The Devil?
	[72] = {"72", "XVI - The Tower?", ""}, -- XVI - The Tower?
	[73] = {"73", "XVII - The Stars?", ""}, -- XVII - The Stars?
	[74] = {"74", "XVIII - The Moon?", ""}, -- XVIII - The Moon?
	[75] = {"75", "XIX - The Sun?", ""}, -- XIX - The Sun?
	[76] = {"76", "XX - Judgement?", ""}, -- XX - Judgement?
	[77] = {"77", "XXI - The World?", ""}, -- XXI - The World?
	[78] = {"78", "Cracked Key", ""}, -- Cracked Key
	[79] = {"79", "Queen of Hearts", ""}, -- Queen of Hearts
	[80] = {"80", "Wild Card", ""}, -- Wild Card
	[81] = {"81", "Soul of Isaac", ""}, -- Soul of Isaac
	[82] = {"82", "Soul of Magdalene", ""}, -- Soul of Magdalene
	[83] = {"83", "Soul of Cain", ""}, -- Soul of Cain
	[84] = {"84", "Soul of Judas", ""}, -- Soul of Judas
	[85] = {"85", "Soul of ???", ""}, -- Soul of ???
	[86] = {"86", "Soul of Eve", ""}, -- Soul of Eve
	[87] = {"87", "Soul of Samson", ""}, -- Soul of Samson
	[88] = {"88", "Soul of Azazel", ""}, -- Soul of Azazel
	[89] = {"89", "Soul of Lazarus", ""}, -- Soul of Lazarus
	[90] = {"90", "Soul of Eden", ""}, -- Soul of Eden
	[91] = {"91", "Soul of the Lost", ""}, -- Soul of the Lost
	[92] = {"92", "Soul of Lilith", ""}, -- Soul of Lilith
	[93] = {"93", "Soul of the Keeper", ""}, -- Soul of the Keeper
	[94] = {"94", "Soul of Apollyon", ""}, -- Soul of Apollyon
	[95] = {"95", "Soul of the Forgotten", ""}, -- Soul of the Forgotten
	[96] = {"96", "Soul of Bethany", ""}, -- Soul of Bethany
	[97] = {"97", "Soul of Jacob and Esau", ""}, -- Soul of Jacob and Esau
}
EID:updateDescriptionsViaTable(repCards, EID.descriptions[languageCode].cards)

---------- Pills ----------

local repPills={
	[4] = {"3", "Bombs are Key", ""}, -- Bombs are Key
	[12] = {"11", "Range Down", ""}, -- Range Down
	[13] = {"12", "Range Up", ""}, -- Range Up
	[38] = {"37", "Retro Vision", ""},
	[42] = {"41", "I'm Drowsy...", ""}, -- I'm Drowsy...
	[43] = {"42", "I'm Excited!!", ""}, -- I'm Excited!!
	[48] = {"47", "Shot speed Down", ""}, -- Shot speed Down
	[49] = {"48", "Shot speed Up", ""}, -- Shot speed Up
	[50] = {"49", "Experimental Pill", ""}, -- Experimental Pill
	[9999] = {"", "Golden Pill", ""}, -- golden Pill
}
EID:updateDescriptionsViaTable(repPills, EID.descriptions[languageCode].pills)

EID.descriptions[languageCode].horsepills={
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
	{"27", "R U a Wizard?", ""}, -- R U a Wizard?
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
	{"42", "I'm Excited!!", ""}, --I'm Excited!!
	{"43", "Gulp!", ""}, -- Gulp!
	{"44", "Horf!", ""}, -- Horf!
	{"45", "Feels like I'm walking on sunshine!", ""}, -- Feels like I'm walking on sunshine!
	{"46", "Vurp!", ""}, -- Vurp!
	{"47", "Shot speed Down", ""}, -- Shot speed Down
	{"48", "Shot speed Up", ""}, -- Shot speed Up
	{"49", "Experimental Pill", ""}, -- Experimental Pill
	[9999] = {"", "Golden Pill", ""}, -- Golden Pill
}

---------- Character Info ----------
local repCharacterInfo = {
	[4] = {"???", "Can't have Red Hearts#{{SoulHeart}} Health ups grant Soul Hearts#{{DevilRoom}} Devil deals that would cost 1 or 2 Red Hearts will cost 1 or 2 Soul Hearts instead#Destroying poop spawns 1 blue fly"},
	[8] = {"Lazarus", "Once per floor, when you die:#Resurrect as Lazarus Risen#Lose 1 Red Heart container#↑ {{Damage}} 0.5 Damage up"},
	[11] = {"Lazarus Risen", "Increased stats and x1.4 damage multiplier#When entering a new floor, turn back into Lazarus"},
	[12] = {"Dark Judas", "{{Damage}} x2 Damage multiplier#Can't have Red Hearts#{{BlackHeart}} Health ups grant Black Hearts#{{Player3}} Counts as Judas for completion marks"},
	[14] = {"Keeper", "{{CoinHeart}} Heal by picking up coins#Maximum of 3 Coin Hearts#Heart pickups are turned into Blue Flies#{{DevilRoom}} Devil deals cost 15 or 30 coins"},
	[18] = {"Bethany", "{{SoulHeart}} Use Soul Hearts to charge your active item#Can't use Soul Hearts as health"},
	[19] = {"Jacob", "Control Jacob and Esau at the same time#Both characters drop a bomb when one is used#Esau stays in place while holding {{ButtonRT}}#{{ButtonLT}} uses Jacob's active, {{ButtonRB}} uses Esau's active, hold {{ButtonRT}} to use their card/pill#When there's a choice between items, Jacob and Esau can grab two simultaneously"},
	[20] = {"Esau", "Control Jacob and Esau at the same time#Both characters drop a bomb when one is used#Esau stays in place while holding {{ButtonRT}}#{{ButtonLT}} uses Jacob's active, {{ButtonRB}} uses Esau's active, hold {{ButtonRT}} to use their card/pill#When there's a choice between items, Jacob and Esau can grab two simultaneously"},
	
	[21] = {"Tainted Isaac", "Item pedestals cycle between 2 options#You can only carry 8 passive items#Change which item will be dropped for a 9th item with {{ButtonRT}}"},
	[22] = {"Tainted Magdalene", "Health above 2 Red Hearts will slowly drain#On contact, do a melee swing for 6x damage#{{HalfRedHeart}} Chance for enemies to drop Half Red Hearts that disappear in 2 seconds#Drop is guaranteed on melee kill#{{Collectible45}} Heal twice as much from non-pickup sources#{{AngelDevilChance}} Damage taken to draining hearts doesn't affect Devil Deal chance"},
	[23] = {"Tainted Cain", "Touching an item pedestal turns it into a variety of pickups"},
	[24] = {"Tainted Judas", "Can't have Red Hearts#{{BlackHeart}} Health ups grant Black Hearts"},
	[25] = {"Tainted ???", "Bombs are replaced with Poop Spells#{{Crafting29}} Doing damage spawns poop pickups#{{Collectible715}} You can store the next spell for later by using Hold"},
	[26] = {"Tainted Eve", "Holding Fire converts your hearts into Clot familiars#Different Heart types spawn Clots with more health and tear effects#Clots lose health over time#Clots stay in place while holding {{ButtonRT}}#At half a heart left with no Clots, you gain a Mom's Knife-like attack until you heal and leave the room"},
	[27] = {"Tainted Samson", "Dealing or taking damage builds up Berserk mode#{{Timer}} When you go berserk, receive for 5 seconds:#↑ {{Speed}} +0.4 Speed#↓ {{Tears}} x0.5 Fire rate multiplier#↑ {{Tears}} +2 Fire rate#↑ {{Damage}} +3 Damage#Restricts attacks to a melee that reflects shots#{{Timer}} Each kill increases the duration by 1 second and grants brief invincibility"},
	[28] = {"Tainted Azazel", "When you start charging, you sneeze blood#Hitting an enemy with the sneeze halves your charge time#The sneeze deals 1.5x Azazel's damage#{{BrimstoneCurse}} Affected enemies take extra damage from Brimstone beams#On death, cursed enemies explode and pass on the curse to nearby enemies"},
	[29] = {"Tainted Lazarus", "Lazarus has two states, each with their own items and health#Clearing a room/wave or using Flip switches to the other state"},
	[30] = {"Tainted Eden", "When you take damage, reroll your stats, items, trinket, and consumables#Items reroll into an item from the same item pool#Self-damage doesn't reroll"},
	[31] = {"Tainted Lost", "{{Card51}} Cards that spawn have a 10% chance to be Holy Card#Quality {{Quality2}} or less items have a 20% chance to be rerolled#Only \"offensive\" items can spawn"},
	[32] = {"Tainted Lilith", "Pressing Fire launches a short-range fetus melee attack that does 3x damage#Holding Fire keeps the fetus out shooting tears towards the nearest enemy"},
	[33] = {"Tainted Keeper", "Maximum of 2 Coin Hearts#Enemies drop coins that disappear in 2 seconds#Most item pedestals cost 15 coins#Devil deals and Angel items cost 15 or 30 coins#Shops don't require a key and have increased stock"},
	[34] = {"Tainted Apollyon", ""},
	[35] = {"Tainted Forgotten", "The Forgotten is an immobile bone pile that is picked up and thrown by The Soul for 3x damage#Only The Soul can take damage#Bombs are placed at Forgotten's location#Can't have Red Hearts#{{SoulHeart}} Health ups grant Soul Hearts"},
	[36] = {"Tainted Bethany", "{{Heart}} Use Red Hearts to charge your active item#Can't have Red Hearts#{{SoulHeart}} Health ups grant Soul Hearts and blood charges#Stat increases are only 75% effective"},
	[37] = {"Tainted Jacob", "Dark Esau chases you, charging towards you when close#The charge does a lot of damage to enemies#If he hits you, you turn into a ghost that dies in one hit for the rest of the floor#While a ghost, one devil deal per room can be taken for free"},
	[38] = {"Dead Tainted Lazarus", "Lazarus has two states, each with their own items and health#Clearing a room/wave or using Flip switches to the other state"},
	[39] = {"Tainted Jacob's Soul", "Flight#Spectral tears#{{Warning}} No health#{{Warning}} Die if hit by Dark Esau#{{DevilRoom}} One devil deal per room can be taken for free#Turn back into Tainted Jacob in the next floor"},
	[40] = {"Tainted Forgotten Soul", "The Forgotten is an immobile bone pile that is picked up and thrown by The Soul for 3x damage#Only The Soul can take damage#Bombs are placed at Forgotten's location#Can't have Red Hearts#{{SoulHeart}} Health ups grant Soul Hearts"},
}
EID:updateDescriptionsViaTable(repCharacterInfo, EID.descriptions[languageCode].CharacterInfo)

---------- Misc. Text ----------

EID.descriptions[languageCode].ResultsWithX = "(Results with {1})"
EID.descriptions[languageCode].VariableCharge = "{1} charge:"

EID.descriptions[languageCode].poopSpells = {
	{"Poop", "Normal poop that can drop pickups"},
	{"Corny Poop", "Spawns blue flies while intact"},
	{"Burning Poop", "Deals contact damage while intact#Leaves a fire behind when destroyed"},
	{"Stone Poop", "Can deal damage 3 times when thrown#Takes a lot of hits to destroy"},
	{"Stinky Poop", "Emits a toxic cloud#{{Warning}} The cloud explodes if it touches fire!"},
	{"Black Poop", "{{Slow}} Creates slowing creep#{{Confusion}} Deals 10 damage and confuses all enemies when destroyed"},
	{"Holy Poop", "{{Collectible543}} Create a white poop#While inside the poop's aura:#↑ {{Damage}} x1.2 Damage multiplier#↑ {{Tears}} x2.5 Fire rate multiplier#Homing tears#Chance to block damage"},
	{"Brown Creep", "Leave a trail of creep#Standing on the creep increases Isaac's fire rate and damage#If the creep is touching other poops, it gains their attribute"},
	{"Fart", "Push nearby enemies and bullets back, and spawn a toxic cloud#{{Warning}} The cloud explodes if it touches fire!"},
	{"Bomb", "Normal throwable bomb"},
	{"Explosive Diarrhea", "Isaac quickly spawns 5 lit bombs"},

	--Undetected poop, for Poop API
	--[Poop name in code] = {Icon, Name, Description}
	["Unknown"] = {"{{PoopSpell1}}", "Unknown Poop", ""}
}

EID.descriptions[languageCode].itemPoolFor = "Pool for Item:"
EID.descriptions[languageCode].itemPoolNames = {
	[0] = "Treasure", "Shop", "Boss", "Devil", "Angel", "Secret", "Library", "Shell Game", "Golden Chest", "Red Chest", "Beggar", "Demon Beggar", "Curse", "Key Master", "Battery Bum", "Mom's Chest", "Greed Treasure", "Greed Boss", "Greed Shop", "Greed Devil", "Greed Angel", "Greed Curse", "Greed Secret", "Crane Game", "Ultra Secret", "Bomb Bum", "Planetarium", "Old Chest", "Baby Shop", "Wooden Chest", "Rotten Beggar",
}

EID.descriptions[languageCode].VoidShopText = "If absorbed right after pickup, gain:"
EID.descriptions[languageCode].VoidOptionText = " will be absorbed instead"
EID.descriptions[languageCode].VoidNames[2] = "{1} Fire rate"

EID.descriptions[languageCode].PurityBoosts = {[0] = "↑ {{Damage}} +4 Damage", "↑ {{Tears}} +2 Fire rate", "↑ {{Speed}} +0.5 Speed", "↑ {{Range}} +3 Range"}

EID.descriptions[languageCode].spindownError = "Item disappears"

EID.descriptions[languageCode].BlankCardEffect = "Blank Card effect:"

EID.descriptions[languageCode].FalsePHDHeart = "Spawns 1 {{BlackHeart}} Black Heart"
EID.descriptions[languageCode].FalsePHDDamage = "↑ {{Damage}} +0.6 Damage"
EID.descriptions[languageCode].FalsePHDHorseDamage = "↑ {{Damage}} +1.2 Damage"

EID.descriptions[languageCode].ExperimentalPillPHD = "No stat decrease"
EID.descriptions[languageCode].ExperimentalPillFalsePHD = "No random stat increase"

EID.descriptions[languageCode].PandorasBoxStrangeKeyEffect = "Instead, consumes the key and spawns 6 items from random pools"

EID.descriptions[languageCode].AchievementWarningTitle = "{{ColorYellow}}{{Warning}} WARNING {{Warning}}"
EID.descriptions[languageCode].AchievementWarningText = "Achievements are disabled!#In order to enable progression and achievements, you first need to kill Mom (Depths II) without any mods enabled.#(If you've defeated Mom, this message is a bug and can be ignored)#(This warning can be disabled in the config)"
EID.descriptions[languageCode].OldGameVersionWarningText = "EID is updated for the newest Steam version#Your game version is not officially supported, so some descriptions and features will be inaccurate#(This warning can be disabled in the config)"
EID.descriptions[languageCode].ModdedRecipesWarningText = "Modded items could make the crafting recipe calculation inaccurate!#Install REPENTOGON for improved modded recipe support#(This warning can be disabled in the config)"


-- Conditional descriptions - DO NOT TRANSLATE THE FIRST PART IN ["BRACKETS"]
-- Strings will be appended to the original description
-- Tables with one entry will completely replace the original description
-- Tables with two or more entries are find-replace pairs (if there's an odd number of entries, the last entry is appended)
-- For collectible/player conditionals, lines will automatically have their bulletpoint, and {1} is replaced with their name
local repConditions = {
	------ GENERAL STRINGS ------
	["Tainted Revive"] = "{1} simply revives",
	["Ice Tears"] = "Freezing an enemy doesn't count as killing", -- Uranus Anti-Synergy
	
	------ GREED MODE ------
	["5.100.344"] = {"{{BlackHeart}} +1 Black Heart#{{Bomb}} Spawns 3 bombs"}, -- Match Book (Greed)
	["5.300.74"] = {"Teleports Isaac to the first room of the floor"}, -- The Moon? (Greed)
	["5.100.416"] = {"{{Coin}} Increases the coin cap to 999"}, -- Deep Pockets (Greed)
	["5.100.566"] = {"{{HalfSoulHeart}} +1 half Soul Heart when entering a new floor#!!! The stage transition nightmare shows the wrong items in Greed Mode"}, -- Dream Catcher (Greed)
	["5.100.580"] = "{{GreedMode}} Can only rarely make special rooms in Greed Mode#{{SuperSecretRoom}} Can still help find the Super Secret Room", -- Red Key (Greed)
	["5.300.83"] = "{{GreedMode}} Can only rarely make special rooms in Greed Mode#{{SuperSecretRoom}} Can still help find the Super Secret Room", -- Soul of Cain (Greed)
	["5.100.514"] = {"Causes some enemies and projectiles to briefly pause at random intervals#Paused projectiles disappear"}, -- Broken Modem (Greed)
	["5.350.162"] = {"{{Player7}} Clearing a wave has a 50% chance to turn the player into Azazel#{{Timer}} Effect lasts until clearing another wave"}, -- Azazel's Stump (Greed)
	
	
	------ ACHIEVEMENT CHECKS ------
	-- todo...
	
	
	------ SPECIFIC CHARACTER SYNERGIES/CHANGES ------
	["5.100.642"] = {"!!! SINGLE USE !!!#Spawns an item from the current room's item pool"}, -- Magic Skin + Lost
	["5.100.240"] = "{1} keeps the stat changes when he drops it", -- Experimental Treatment + Tainted Isaac
	["5.100.644"] = "{1} keeps the stat increase when he drops it", -- Consolation Prize + Tainted Isaac
	["5.100.549"] = {"↑ {{Tears}} +0.4 Fire rate"}, -- Brittle Bones (Keeper+Lost)
	["5.100.694"] = "Works for {1}, letting him survive 4 hits", -- Heartbreak + Losts
	["5.100.694 (Keeper)"] = {"↑ {{Damage}} +0.25 Damage for each Broken Heart#{{BrokenHeart}} +1 Broken Heart#{{BrokenHeart}} Every fatal hit grants +1 Broken Heart#{{Warning}} Keeper dies at 3 Broken Hearts"}, -- Heartbreak + Normal Keeper
	["5.100.694 (Tainted Keeper)"] = {"{{Warning}} {1} will die in one hit after taking this item#↑ {{Damage}} +0.25 Damage for each Broken Heart#{{BrokenHeart}} +1 Broken Heart#{{BrokenHeart}} Every fatal hit grants +1 Broken Heart#Tainted Keeper dies at 2 Broken Hearts"}, -- Heartbreak + Tainted Keeper
	["5.100.501"] = "{1} can gain additional coin containers#Health up items can grant an extra container per 25 coins", -- Greed's Gullet + Keeper
	["5.100.188"] = "Deals 7.5 damage as {1}", -- Cain + Abel
	["5.100.360"] = "Deals 100% damage as {1}", -- Lilith + Incubus
	["5.100.728"] = "Deals 100% damage as {1}", -- Lilith + Gello
	["5.100.230 (Keeper)"] = "{1} is left with 1 coin container", -- Abaddon
	["5.100.230 (Bethany)"] = "{1} is left with half a heart", -- Abaddon
	["5.100.230 (Tainted Bethany)"] = "{1} doesn't lose her blood charges", -- Abaddon
	["5.100.245 (Keeper)"] = {"↑ {{Tears}} Increased tear rate#↑ Decreased tear spread#↓ {{Damage}} x0.8 Damage multiplier"}, -- 20/20 + Keeper
	["5.100.205 (Tainted Magdalene)"] = "Allows infinite usage of Yum Heart", -- Sharp Plug + Tainted Magdalene
	
	["5.100.705"] = "Temporary +1 damage up for each bullet/enemy", -- Dark Arts + Dark/Tainted Judas
	["5.100.722"] = {"Chains down Dark Esau#After 5 seconds or upon using Anima Sola again, he breaks free and dashes towards Jacob"}, -- TJacob + Anima Sola
	["5.100.713"] = {"Recalls all clots to Eve's health bar#Excess clots are simply moved to her location#{{Timer}} 1 second recharge time"}, --Teve + Sumptorium
	["5.100.711"] = {"Entering", "{{Player38}} Flips Lazarus to the other state#Entering"}, -- Tlaz + Flip
	["5.100.710"] = {"Upon use, attacking swipes the bag in the chosen direction#Swiping at a pickup puts it in the bag#The Bag's contents can be shifted with {{ButtonRT}} to replace specific pickups when full#Holding the Use key when the bag is full crafts the previewed item#Item quality is based on the quality of the pickups"}, -- Tcain Bag of Crafting
	
	["Mother's Kiss Soul"] = {"{{SoulHeart}} +1 Soul Heart while held"},
	["Mother's Kiss Bone"] = {"{{BoneHeart}} +1 Bone Heart while held"},
	["Mother's Kiss Coin"] = {"{{CoinHeart}} +1 Coin Heart while held#Increases Coin Heart cap by 1"},
	
	-- Vibrant/Dim Bulb
	["5.350.100 (Bethany)"] = "Works with {1}'s soul charges",
	["5.350.100 (Tainted Bethany)"] = "Works with {1}'s blood charges",
	["5.350.101 (Bethany)"] = "Ignores {1}'s soul charges",
	["5.350.101 (Tainted Bethany)"] = "Ignores {1}'s blood charges",
	["Health Up Soul Charges"] = "+{1} soul charges",
	["Health Up Blood Charges"] = "+{1} blood charges",
	
	-- Tainted Bethany stuff
	["2 of Hearts Blood Charges"] = "Doubles {1}'s blood charges",
	["Vampire Blood Charges"] = {"↑ {{Damage}} +0.3 Damage#Killing 13 enemies adds 1 blood charge"},
	["Fork Blood Charges"] = {"Clearing a room has a 10% chance to add 1 blood charge"},
	["Stem Cell Blood Charges"] = {"Entering a new floor adds 1 blood charge"},
	
	["Salvaging Bonus"] = {"and destroyed machines", "destroyed machines, and salvaged items"},
	["Salvaging Lucky Toe"] = "66% chance for an extra pickup from salvaged items",
	
	
	------ DUPLICATE COPIES OF ITEMS ------
	["5.100.2 (Copies)"] = "Isaac fires 1 more tear#No additional stat decrease", -- The Inner Eye
	["5.100.153 (Copies)"] = "Isaac fires 2 more tears#No additional stat decrease", -- Mutant Spider
	["5.100.245 (Copies)"] = "Isaac fires 1 more tear#No additional stat decrease", -- 20/20
	["5.100.358 (Copies)"] = "Isaac fires 1 more tear in the center", -- The Wiz
	["5.100.64 (Copies)"] = "Owning this item multiple times reduces the price further", -- Steam Sale
	["5.100.118 (Copies)"] = "Multiple Brimstones grant increased damage and a larger beam", -- Brimstone
	["5.100.531 (Copies)"] = "Additional copies only give +1 damage", -- Haemolacria
	["5.100.224 (Copies)"] = "Additional copies only give +0.5 fire rate", -- Cricket's Body
	
	
	----- MISC. ITEM CONDITIONS ------
	["Sacrificial Nugget"] = "Turns Brown Nugget turrets into coins",
	["Sacrificial Item Wisps"] = "Familiars created by Lemegeton can be sacrificed#Turns all Lemegeton wisps into {{HalfSoulHeart}} half Soul Hearts",
	["Sacrificial Plum"] = "The summoned Plum counts as a familiar, and doesn't remove Plum Flute",
	["Sacrificial Quints"] = "If a Quints familiar is sacrificed, you lose Quints",
	["Sacrificial Abyss"] = "Abyss Locusts count as familiars",
	["Sacrificial Star"] = "Star of Bethlehem counts as a familiar",
	["Sacrificial Clots"] = "Turns Clots into coins",
	
	["1000.76.1"] = "{{Warning}} Only rerolls the character that activates the dice", -- Dice Room 1 (Co-op)
	["1000.76.6"] = "{{Warning}} All characters' items will be rerolled in co-op!", -- Dice Room 6 (Co-op)
	["5.100.45"] = "Heals other players for half a heart", -- Yum Heart (Co-Op)
	["5.350.125"] = "Beams also arc between players", -- Extension Cord (Co-Op)
	
	["5.100.245"] = "Removes the fire rate penalty of {1}", -- 20/20 + Mutant Spider, The Inner Eye, Polyphemus
	["20/20"] = "No fire rate penalty with {1}", -- 20/20 + Mutant Spider, The Inner Eye, Polyphemus
	
	["5.100.135 (Hard Mode)"] = {""}, -- IV Bag Hard Mode (modify the PHD text too)
	["5.100.201"] = "Refills {1}'s charge on pickup", -- Iron Bar + Notched Axe
	["5.350.172"] = "{1} removes the teleportation effect", -- Cursed Penny + Black Candle
	["5.100.501 (Deep Pockets)"] = "+1 container for every 100 coins past 99", -- Greed's Gullet + Deep Pockets
	["? Card Single Use"] = "Single use items can be used multiple times with ? Card", -- Single Use Actives + ? Card
	["Both Peppers"] = "With {1}, base chance to shoot a flame is 12.5%, up to 100% at 7 luck", -- Ghost Pepper + Bird's Eye
	["Black Feather"] = "↑ {{Damage}} +0.5 Damage", -- Black Feather items
	["Hemoptysis"] = "Works with {1}", -- Hemoptysis + Brimstone items
	["5.100.600"] = "x1.2 Fire rate multiplier for {1}", -- Eye Drops (items and some players)
	["5.100.482"] = "Tainted characters change into other tainted characters", -- Clicker
	
	["4.5 Volt Timed"] = "No effect on timed recharges", -- 4.5 Volt + Timed Recharges
	["4.5 Volt Multiple"] = "Secondary active items only gain charge if the primary active is fully charged", -- 4.5 Volt + Schoolbag/Pocket Actives
	["Bulb Zero"] = "Actives with 0 max charges don't count", -- Vibrant/Dim Bulb + zero charge actives
	
	["Brimstone Proptosis"] = "Beams deal 6x damage at point blank range, decreasing with distance",
	["Brimstone Ipecac"] = "The laser gets +2 damage and explodes on enemies and obstacles",
	["Brimstone Pop!"] = "Shorter beam that shoots {1} tears at the end",
	["Eye of Belial Dr. Fetus"] = "Bombs pierce, doing 2.5x damage, but don't home or do additional blast damage",
	["Spirit Sword C Section"] = "{1} has priority#Fetuses hold swords and do spin attacks",
	["Spirit Sword Mom's Knife"] = "{1} has priority#The spin attack throws the sword forward",
	["Spirit Sword Technology"] = "The sword becomes a lightsaber that can reflect enemy shots",
	["Spirit Sword Ipecac"] = "The sword gets +6 damage and poisons but doesn't explode#Sword beams do explode",
	["Ludovico Ipecac"] = "The tear gets +2 damage but doesn't explode or poison",
	["Technology Ipecac"] = "The laser gets +2 damage and explodes on targets",
	["Eye of the Occult Beam"] = "Isaac automatically shoots with a crosshair that alters the beam's path",
	
	["Lullaby Clots"] = "(Including clots)",
	["Lullaby Incubus"] = "(Including Incubus)",
	
	-- Jacob's Ladder / 120 Volt battery synergies
	["Sparks Damage"] = "Sparks deal 50% more damage",
	["Sparks Arc Length"] = "Sparks have longer arc distance",
	["Sparks Arc Count"] = "Sparks can arc to 2 more enemies",
	["Sparks Arc Back"] = "Sparks can arc back to the same enemy",
	
	["White Poop Jar"] = "Spawns White Poop on 1 charge use",
	["Golden Poop Jar"] = "Chance to spawn Golden Poop on 1 charge use",
	
	["Binge Eater Healing"] = {""},
}
EID:updateDescriptionsViaTable(repConditions, EID.descriptions[languageCode].ConditionalDescs)




-- If Debug enabled, add overwrite tables to the languagepack in order for the language completion script to be able to compare them
if EID.enableDebug then
	EID.descriptions[languageCode].repCollectibles = repCollectibles
	EID.descriptions[languageCode].repTrinkets = repTrinkets
	EID.descriptions[languageCode].repCards = repCards
	EID.descriptions[languageCode].repPills = repPills
end

if REPENTOGON then
	EID.descriptions[languageCode].custom["6.8.0"] = {"0", "Donation Machine", ""}
	EID.descriptions[languageCode].custom["6.11.0"] = {"0", "Greed Donation Machine", ""}
end
