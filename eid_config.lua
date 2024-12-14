EID.UserConfig = {
	-------GENERAL---------
	-- Change the language of the mod
	-- Currently Supported: automatic = "auto"				(Default) Chooses the mod language based on your game's language settings(Rep), or defaults to English for ab+ users.
	--						English = "en_us"				SPECIAL THANKS TO everyone!
	--
	["Language"] = "auto",
	-- Change if item names should be displayed in English, your translated language or both
	-- States: 1 = English , 2 = translated,  3 = both
	-- Default = 2
	["TranslateItemName"] = 2,
	-- Change font type. Values are [default, borderless, inverted]
	-- Default = "default"
	["FontType"] = "default",
	-- Change the width of the info boxes (in characters).
	-- Default = 130
	["TextboxWidth"] = 130,
	-- Change the size of the info boxes. Range: [0,...,1]
	-- Default = 1
	["Size"] = 1,
	-- Press or hold the key to change scale. Keyboard.KEY_F5 is recommended
	-- Default = none
	["SizeHotkey"] = -1,
	-- Set the background transparency. Range: [0,...,1]
	-- Default = 0.75
	["Transparency"] = 0.75,
	-- Set the HUD offset of the descriptions
	-- This should be set to the same number of "strokes" set in the in-game options for the "hud offset" value (range is 0 to 10)
	-- Default = 10
	["HUDOffset"] = 10,
	-- Set the X Position (width) of the description texts
	-- Default = 60
	["XPosition"] = 60,
	-- Set the Y Position (height) of the description texts
	-- Default = 45
	["YPosition"] = 45,
	-- Set the height of a line, effectivly changing the distance between two lines of text
	-- Default = 11
	["LineHeight"] = 11,
	-- Set the distance between an item and its information display (in tiles)
	-- Default = 5
	["MaxDistance"] = 5,
	-- Select the type of the indicator that highlights the currently inspected object
	-- Options: ["arrow", "blink", "border", "highlight", "none"].
	-- Arrow = Moving arrow pointing at the item | Blink = The whole sprite blinks white | Border = Blinking white border around the sprite | Highlight = White border around the sprite |  None = No indicator
	-- Default = "none"
	["Indicator"] = "arrow",
	-- Set the keybind to toggle the description display
	-- Look into the AB+ or Repentance documentation for the key names here: https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html
	-- Default = Keyboard.KEY_F2
	["HideKey"] = Keyboard.KEY_F2,
	-- Set the keybind to edit the description of the currently selected item
	-- Look into the AB+ or Repentance documentation for the key names here: https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html
	-- Default = Keyboard.KEY_F3
	["EditKey"] = Keyboard.KEY_F3,
	-- Set the keybind to toggle the display of the owned items
	-- Look into the AB+ or Repentance documentation for the key names here: https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html
	-- Default = Keyboard.KEY_F4
	["ItemOverviewKey"] = Keyboard.KEY_F4,
	-- Set the controller binding to toggle the description display
	-- Use the controller names here: https://github.com/wofsauge/External-Item-Descriptions/blob/master/mod_config_menu.lua#L1 or a number
	-- Controller.STICK_LEFT and Controller.STICK_RIGHT (pushing the sticks in), which aren't used in-game with default controls
	-- Default = none (-1)
	["HideButton"] = -1,
	-- Initial display state. Can be used to change the toggle behavior of the "Hide Key" event
	-- Default = false
	["InitiallyHidden"] = false,
	-- Hide the descriptions when in battle
	-- Default = false
	["HideInBattle"] = true,
	-- How many times a second that EID checks for what objects are close to the player
	-- Lowering this number can help if you experience frame drops while descriptions are on-screen
	-- Please use a factor of 60! (1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30, 60)
	-- Default: 30
	["RefreshRate"] = 30,
	-- Toggle obstruction based hiding, when the player has flight
	-- Default = true
	["DisableObstructionOnFlight"] = true,
	-- If set to true, the mod will no longer display critical warnings during the start of a new game
	-- Current warnings are: Achievements are locked and outdated game version
	-- Default = false
	["DisableStartOfRunWarnings"] = false,
	-- ColorblindMode
	-- Values: 0 = Off, 1 = Protanopia (red weak), 2 = Deuteranopia (green weak), 3 = Tritanopia (blue weak)
	-- Default = 0
	["ColorblindMode"] = 0,

	---------- Co-op / Multiple Descriptions -----------

	-- Allow P2/P3/P4 to display descriptions when in Co-op mode
	-- Default = true
	["CoopDescriptions"] = true,
	-- Allow the paired player of certain characters in Repentance (Esau, Tainted Forgotten's bone pile) to display descriptions
	-- Default = false
	["PairedPlayerDescriptions"] = false,
	-- Display a description for every object within range of you, instead of just the closest
	-- Default = false
	["DisplayAllNearby"] = false,
	-- Any descriptions displayed beyond the first one will use the "Local" display mode

	-- Set the max number of descriptions to display per frame
	-- Set to 1 if you don't want any Local Mode descriptions printed in co-op
	-- Default = 99
	["MaxDescriptionsToDisplay"] = 99,

	---------- Display Modes -----------

	-- Sets the display mode of the description text
	-- Possible values: default, local
	--	"default": text will be displayed in the top left of the screen
	--	"local": text will be displayed under the described object
	-- Default = "default"
	["DisplayMode"] = "local",
	-- Change the size of the info boxes for local mode
	-- Default = 0.5
	["LocalModeSize"] = 0.5,
	-- Changes the position of the text in local mode, relative to the described object to be centered. Set to false to make it left-aligned
	-- Default = true
	["LocalModeCentered"] = true,

	---------- Icons -----------

	-- Change the size of icons if available
	-- Possible values: "default", "big", "small"
	-- Default = "default"
	["MarkupSize"] = "default",

	-- If true, print the icon of the stat being affected in a stat change after the up/down arrow
	-- For example, "↑ {{Speed}} +0.3 Speed up"
	-- Default = false
	["StatChangeIcons"] = false,

	-- If true, stat and basic pickup bulletpoint icons will be drawn when relevant
	-- For example, "{{Battery}} +1 charge when you get hit"
	-- Default = true
	["StatAndPickupBulletpoints"] = true,

	---------- Curses ----------

	-- Disable descriptions when the floor has Curse of the Blind
	-- Default = true
	["DisableOnCurse"] = true,
	-- Disable descriptions for the second Treasure Room item on the alt path
	-- REPENTANCE ONLY!!!
	-- Default = true
	["DisableOnAltPath"] = true,
	-- Disable descriptions for the April Fools challenge
	-- Default = true
	["DisableOnAprilFoolsChallenge"] = true,

	---------- Item Names ----------

	-- Toggle display of collectible or Card and Pill names
	-- Default = true
	["ShowItemName"] = true,
	-- Toggle display of item type and maximum charge icons
	-- Default = true
	["ShowItemType"] = true,
	-- Toggle display of collectible or trinket icons next to the item name
	-- Default = true
	["ShowItemIcon"] = true,
	-- Toggle display of collectible or Card and Pill descriptions
	-- Default = true
	["ShowItemDescription"] = true,
	-- Toggle display of collectible descriptions
	-- Default = true
	["DisplayItemInfo"] = true,
	-- Toggle display of trinket descriptions
	-- Default = true
	["DisplayTrinketInfo"] = true,
	-- Set the color of the item name text
	-- Color names are defined in "eid_data.lua" (line 300)
	-- Default = "ColorEIDObjName"
	["ItemNameColor"] = "ColorEIDObjName",
	-- Set the mod indicator display
	-- Default = "Both"
	["ModIndicatorDisplay"] = "None",
	-- Set the mod indicator text color
	-- Default = "ColorLightOrange"
	["ModIndicatorTextColor"] = "ColorLightOrange",

	---------- Cards ----------

	-- Toggle display of Card or Rune descriptions
	-- Default = true
	["DisplayCardInfo"] = true,
	-- Toggle display of Card or Rune descriptions when they're sold in shops
	-- Default = false
	["DisplayCardInfoShop"] = false,
	-- Toggle display of Soul Stone descriptions when they're sold in shops
	-- REPENTANCE ONLY!!!
	-- Default = true
	["DisplaySoulstoneInfoShop"] = true,
	-- Toggle display of Card or Rune descriptions when they're not accessible without flight, e.g. when they are behind rocks, blocks, spikes, etc.
	-- Default = false
	["DisplayObstructedCardInfo"] = false,
	-- Toggle display of Soul Stone descriptions when they're not accessible without flight, e.g. when they are behind rocks, blocks, spikes, etc.
	-- REPENTANCE ONLY!!!
	-- Default = true
	["DisplayObstructedSoulstoneInfo"] = true,
	-- Toggle display of Card or Rune descriptions when they spawn from the Options? item
	-- REPENTANCE ONLY!!!
	-- Default = false
	["DisplayCardInfoOptions?"] = false,

	---------- Pills ----------

	-- Toggle display of Pill descriptions
	-- Default = true
	["DisplayPillInfo"] = true,
	-- Toggle display of Pill descriptions when they're a shop item
	-- Default = true
	["DisplayPillInfoShop"] = true,
	-- Toggle display of Pill descriptions when they're not accessible without flight, e.g. when they are behind rocks, blocks, spikes, etc.
	-- Default = false
	["DisplayObstructedPillInfo"] = false,
	-- Toggle display of Pill descriptions when they spawn from the Options? item
	-- REPENTANCE ONLY!!!
	-- Default = true
	["DisplayPillInfoOptions?"] = true,
	-- Keeps pilleffect descriptions unidentified, until the player has used the pill at least once in the run.
	-- This ignores effects caused by PHD and False PHD
	-- Default = false
	["OnlyShowPillWhenUsedAtLeastOnce"] = false,
	-- Toggle display of description for Pills that haven't been identified yet
	-- Default = false
	["ShowUnidentifiedPillDescriptions"] = false,


	---------- Dice Room ----------

	-- Toggle display of Dice Room descriptions
	-- Default = true
	["DisplayDiceInfo"] = true,

	---------- Item Reminder Description ------------
	-- Enable/Disable item reminder feature.
	-- Hold Map (or the button action chosen below) to show a description of your active item's effect, recently picked up items, and things like Teleport 2.0's destination and Void's absorbed items
	["ItemReminderEnabled"] = true,
	-- Changes the display mode of the item reminder feature.
	-- Options: "All" (Overview + scrollable item categories), "NoOverview" (Only scrollable item categories), "Classic" (only overview page)
	-- Default = "All"
	["ItemReminderDisplayMode"] = "All",
	-- Disable inputs while Item Reminder is visible
	-- Default = false
	["ItemReminderDisableInputs"] = false,
	-- Set the keybinding that's held to show the Item Reminder description
	-- Look into the AB+ or Repentance documentation for the key names here: https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html
	-- Default = ButtonAction.ACTION_MAP
	["EIDToggleKey"] = ButtonAction.ACTION_MAP,
	-- Set the keybinding that is used to scroll thru the categories in the left direction
	-- Look into the AB+ or Repentance documentation for the key names here: https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html
	-- Default = ButtonAction.ACTION_SHOOTLEFT
	["ItemReminderNavigateLeftButton"] = ButtonAction.ACTION_SHOOTLEFT,
	-- Set the keybinding that is used to scroll thru the categories in the right direction
	-- Look into the AB+ or Repentance documentation for the key names here: https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html
	-- Default = ButtonAction.ACTION_SHOOTLEFT
	["ItemReminderNavigateRightButton"] = ButtonAction.ACTION_SHOOTRIGHT,
	-- Set the keybinding that is used to scroll thru the players or item entries in the left direction
	-- Look into the AB+ or Repentance documentation for the key names here: https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html
	-- Default = ButtonAction.ACTION_SHOOTUP
	["ItemReminderNavigateUpButton"] = ButtonAction.ACTION_SHOOTUP,
	-- Set the keybinding that is used to scroll thru the players or item entries in the right direction
	-- Look into the AB+ or Repentance documentation for the key names here: https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html
	-- Default = ButtonAction.ACTION_SHOOTDOWN
	["ItemReminderNavigateDownButton"] = ButtonAction.ACTION_SHOOTDOWN,
	-- Limits the number of description bullet points to be displayed on the overview page for each item
	-- Default = 2
	["ItemReminderOverviewHideAfterRows"] = 2,
	-- Number of entries to display per category of the item description.
	-- Default = 3
	["ItemReminderMaxEntriesCount"] = 1,


	 ---------- Save Game Options ------------

	 -- Savegame which should be used for savegame specific features (for example: Item Collection page progress)
	 -- Possible values: 0,1,2,3
	 -- Default: 0   (Deactivate all Savegame features)
	 ["SaveGameNumber"] = 0,

	 -- Hides descriptions of items, if they are not collected in the collection page
	 -- Default: false
	 ["HideUncollectedItemDescriptions"] = false,

	 -- Highlight items, if they need to be collected for the collection page
	 -- Default: true
	 ["ItemCollectionIndicator"] = true,

	 -- Color in which the name of an item should be highlighted, which needs to be collected for the collection page
	-- Color names are defined in "eid_data.lua" (line 365)
	 -- Default: "ColorFade"
	 ["ItemCollectionColor"] = "ColorFade",


	 ---------- Mouse Controls ------------

	-- Toggles HUD descriptions based on the mouse position
	-- Default = false
	["EnableMouseControls"] = false,
	-- Toggles the custom mouse cursor
	-- Default = false
	["ShowCursor"] = false,


	---------- Repentogon ----------
	-- The following options only affect features that require the API extention "Repentogon" to be installed.
	-- Website: https://repentogon.com/index.html 

	-- Toggles descriptions to be visible, when using the item collection page in the main menu.
	-- Default = true
	["RGON_ShowOnCollectionPage"] = true,

	-- Toggles achievement progress descriptions for donation machines
	-- Default = true
	["RGON_DonationMachineDescriptions"] = true,


	---------- Misc ----------


	-- Error message displayed when an error occurs
	-- Default = [Effect not defined]
	["ErrorMessage"] = "[Effect not defined]",
	-- Set the color of the default description text
	-- Color names are defined in "eid_data.lua" (line 365)
	-- Default = "ColorEIDText"
	["TextColor"] = "ColorEIDText",
	-- Set the color of the error description text
	-- Color names are defined in "eid_data.lua" (line 365)
	-- Default = "ColorEIDError"
	["ErrorColor"] = "ColorEIDError",
	-- Enables or disables custom descriptions for entities
	-- Default = true
	["EnableEntityDescriptions"] = true
}

-- END CONFIG --
----------------
----------------

--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
-------- DO NOT EDIT FROM THIS POINT!!!!! --------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------
--------------------------------------------------

EID.DefaultConfig = {
	["Language"] = "auto",
	["TranslateItemName"] = 2,
	["FontType"] = "default",
	["TextboxWidth"] = 130,
	["Size"] = 1,
	["SizeHotkey"] = -1,
	["Transparency"] = 0.75,
	["HUDOffset"] = 10,
	["XPosition"] = 60,
	["YPosition"] = 45,
	["LineHeight"] = 11,
	["DisplayMode"] = "local",
	["ColorblindMode"] = 0,
	["LocalModeSize"] = 0.5,
	["LocalModeCentered"] = true,
	["MarkupSize"] = "default",
	["StatChangeIcons"] = false,
	["StatAndPickupBulletpoints"] = true,
	["MaxDistance"] = 5,
	["Indicator"] = "arrow",
	["HideKey"] = Keyboard.KEY_F2,
	["EditKey"] = Keyboard.KEY_F3,
	["ItemOverviewKey"] = Keyboard.KEY_F4,
	["HideButton"] = -1,
	["InitiallyHidden"] = false,
	["HideInBattle"] = true,
	["RefreshRate"] = 30,
	["DisableObstructionOnFlight"] = true,
	["DisableStartOfRunWarnings"] = false,
	["CoopDescriptions"] = true,
	["PairedPlayerDescriptions"] = false,
	["DisplayAllNearby"] = false,
	["MaxDescriptionsToDisplay"] = 99,
	["DisableOnCurse"] = true,
	["DisableOnAltPath"] = true,
	["DisableOnAprilFoolsChallenge"] = true,
	["ShowItemName"] = true,
	["ShowItemType"] = true,
	["ShowItemIcon"] = true,
	["ShowItemDescription"] = true,
	["DisplayItemInfo"] = true,
	["DisplayTrinketInfo"] = true,
	["ItemNameColor"] = "ColorEIDObjName",
	["ModIndicatorDisplay"] = "None",
	["ModIndicatorTextColor"] = "ColorLightOrange",
	["ShowObjectID"] = false,
	["DisplayCardInfo"] = true,
	["DisplayCardInfoShop"] = false,
	["DisplaySoulstoneInfoShop"] = true,
	["DisplayObstructedCardInfo"] = false,
	["DisplayObstructedSoulstoneInfo"] = true,
	["DisplayCardInfoOptions?"] = false,
	["DisplayPillInfo"] = true,
	["DisplayPillInfoShop"] = true,
	["DisplayPillInfoOptions?"] = true,
	["DisplayObstructedPillInfo"] = false,
	["OnlyShowPillWhenUsedAtLeastOnce"] = false,
	["ShowUnidentifiedPillDescriptions"] = false,
	["DisplayDiceInfo"] = true,

	["ItemReminderEnabled"] = true,
	["ItemReminderDisplayMode"] = "All",
	["ItemReminderDisableInputs"] = false,
	["EIDToggleKey"] = ButtonAction.ACTION_MAP,
	["ItemReminderNavigateLeftButton"] = ButtonAction.ACTION_SHOOTLEFT,
	["ItemReminderNavigateRightButton"] = ButtonAction.ACTION_SHOOTRIGHT,
	["ItemReminderNavigateUpButton"] = ButtonAction.ACTION_SHOOTUP,
	["ItemReminderNavigateDownButton"] = ButtonAction.ACTION_SHOOTDOWN,
	["ItemReminderOverviewHideAfterRows"] = 2,
	["ItemReminderMaxEntriesCount"] = 1,
	
	["SaveGameNumber"] = 0,
	["HideUncollectedItemDescriptions"] = false,
	["ItemCollectionIndicator"] = true,
	["ItemCollectionColor"] = "ColorFade",
	["EnableMouseControls"] = false,
	["ShowCursor"] = false,

	["RGON_ShowOnCollectionPage"] = true,
	["RGON_DonationMachineDescriptions"] = true,

	["ErrorMessage"] = "[Effect not defined]",
	["TextColor"] = "ColorEIDText",
	["ErrorColor"] = "ColorEIDError",
	["EnableEntityDescriptions"] = true
}
