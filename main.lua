if EID and EID.Name then print("Error: Two instances of EID found! Please uninstall one of them!") return end -- If EID is already loaded, warn the user and dont load the second one.
EID = RegisterMod("Manual Item Descriptions", 1)
-- important variables
EID.GameVersion = "ab+"
EID.Languages = {"en_us"}
EID.descriptions = {} -- Table that holds all translation strings
EID.enableDebug = false
local game = Game()
EID.isRepentancePlus = REPENTANCE_PLUS or FontRenderSettings ~= nil -- Repentance+ adds FontRenderSettings() class. We use this to check if the DLC is enabled. V1.9.7.7 added REPENTANCE_PLUS variable
EID.isRepentance = REPENTANCE or EID.isRepentancePlus -- REPENTANCE variable can be altered by any mod, so we save the value before anyone can alter it. V1.9.7.7 removed REPENTANCE variable, so we additionally check for Rep+

require("features.eid_keyboardmapping")

require("eid_config")
EID.Config = EID.UserConfig
EID.Config.Version = "3.2" -- note: changing this will reset everyone's settings to default!
EID.ModVersion = 4.88
EID.ModVersionCommit = "b275d168"
EID.DefaultConfig.Version = EID.Config.Version
EID.isHidden = false
EID.isEditing = false
EID.wasEditing = false
EID.isSummaryPermanentlyOpen = false
EID.isShowingReminder = false
EID.currentEditingIndex = 0
EID.currentCursorPosition = 0
EID.editingKeyboardActions = {
	[Keyboard.KEY_BACKSPACE] = {
		action = function(descriptionObj)
			descriptionObj.Description = descriptionObj.Description:sub(1, math.max(EID.currentCursorPosition - 1, 0)) .. descriptionObj.Description:sub(EID.currentCursorPosition + 1)
			EID.currentCursorPosition = math.max(EID.currentCursorPosition - 1, 0)
		end,
		nextPossibleTick = 0
	},
	[Keyboard.KEY_DELETE] = {
		action = function(descriptionObj)
			descriptionObj.Description = descriptionObj.Description:sub(1, EID.currentCursorPosition) .. descriptionObj.Description:sub(EID.currentCursorPosition + 2)
		end,
		nextPossibleTick = 0
	},
	[Keyboard.KEY_LEFT] = {
		action = function()
			EID.currentCursorPosition = math.max(EID.currentCursorPosition - 1, 0)
		end,
		nextPossibleTick = 0
	},
	[Keyboard.KEY_RIGHT] = {
		action = function(descriptionObj)
			EID.currentCursorPosition = math.min(EID.currentCursorPosition + 1, #descriptionObj.Description + 1)
		end,
		nextPossibleTick = 0
	},
	[Keyboard.KEY_UP] = {
		action = function(descriptionObj)
			local descriptionLength = #descriptionObj.Description
			local backwardsSearchMatch = descriptionObj.Description:reverse():find("#", descriptionLength - EID.currentCursorPosition + 1)
			if backwardsSearchMatch ~= nil then
				EID.currentCursorPosition = descriptionLength - backwardsSearchMatch
			end
		end,
		nextPossibleTick = 0
	},
	[Keyboard.KEY_DOWN] = {
		action = function(descriptionObj)
			local startOfNextLineMatch = descriptionObj.Description:find("#", EID.currentCursorPosition + 1)
			if startOfNextLineMatch ~= nil then
				local startOfLineAfterMatch = descriptionObj.Description:find("#", startOfNextLineMatch + 1)
				if startOfLineAfterMatch ~= nil then
					EID.currentCursorPosition = startOfLineAfterMatch - 1
				else
					EID.currentCursorPosition = #descriptionObj.Description
				end
			end
		end,
		nextPossibleTick = 0
	},
	[Keyboard.KEY_HOME] = {
		action = function(descriptionObj)
			local descriptionLength = #descriptionObj.Description
			local backwardsSearchMatch = descriptionObj.Description:reverse():find("#", descriptionLength - EID.currentCursorPosition + 1)
			if backwardsSearchMatch ~= nil then
				EID.currentCursorPosition = descriptionLength - backwardsSearchMatch + 1
			else
				EID.currentCursorPosition = 0
			end
		end,
		nextPossibleTick = 0
	},
	[Keyboard.KEY_END] = {
		action = function(descriptionObj)
			local startOfNextLineMatch = descriptionObj.Description:find("#", EID.currentCursorPosition + 1)
			if startOfNextLineMatch ~= nil then
				EID.currentCursorPosition = startOfNextLineMatch - 1
			else
				EID.currentCursorPosition = #descriptionObj.Description
			end
		end,
		nextPossibleTick = 0
	}
}
EID.player = nil -- The primary Player Entity of Player 1
EID.players = {} -- Both Player Entities of Player 1 if applicable (includes Esau, T.Forgotten)
EID.coopMainPlayers = {} -- The primary Player Entity for each controller being used
EID.coopAllPlayers = {} -- Every Player Entity (includes Esau, T.Forgotten)
EID.controllerIndexes = {} -- A table to map each controller index to their player number for coloring indicators
EID.isMultiplayer = false -- Used to color P1's highlight/outline indicators (single player just uses white)
EID.isOnlineMultiplayer = false -- Set to true to disable code functions that might cause desyncs

-- general variables
EID.PositionModifiers = {}
EID.DescModifiers = {}
EID.UsedPosition = Vector(EID.Config["XPosition"], EID.Config["YPosition"])
EID.Scale = EID.Config["Size"]
EID.isDisplaying = false
EID.isDisplayingPermanent = false
EID.permanentDisplayTextObj = nil
EID.lastDescriptionEntity = nil
EID.lineHeight = 11
EID.itemConfig = Isaac.GetItemConfig()
EID.itemUnlockStates = {}
EID.itemAvailableStates = {}
EID.absorbedItems = {}
EID.CollectedItems = {}
EID.IgnoredEntities = {}
EID.CurrentRoomGridEntities = {}
EID.UnidentifyablePillEffects = {} -- List of pilleffects that are always unidentifyable
EID.UsedPillColors = {} -- Colors of pills that have been eaten during this game
local pathsChecked = {}
local altPathItemChecked = {}
local alwaysUseLocalMode = false -- set to true after drawing a non-local mode description this frame
EID.ForceRefreshCache = false -- set to true to force-refresh descriptions, currently used for potential transformation text changes
EID.holdTabPlayer = 0
EID.holdTabCounter = 0
local forgottenDropTimer = 0
local preHourglassStatus = {}

EID.GameUpdateCount = 0
EID.GameRenderCount = 0

-- Sprite inits
EID.IconSprite = Sprite()
EID.IconSprite:Load("gfx/eid_transform_icons.anm2", true)

EID.InlineIconSprite = Sprite()
EID.InlineIconSprite:Load("gfx/eid_inline_icons.anm2", true)
EID.InlineIconSprite2 = Sprite()
EID.InlineIconSprite2:Load("gfx/eid_inline_icons.anm2", true)

EID.CardPillSprite = Sprite()
EID.CardPillSprite:Load("gfx/eid_cardspills.anm2", true)

EID.ItemSprite = Sprite()
EID.ItemSprite:Load("gfx/005.100_collectible.anm2", true)

EID.PlayerSprite = Sprite()
EID.PlayerSprite:Load("gfx/eid_player_icons.anm2", true)

local ArrowSprite = Sprite()
ArrowSprite:Load("gfx/eid_transform_icons.anm2", true)
ArrowSprite:Play("Arrow", false)

EID.CursorSprite = Sprite()
EID.CursorSprite:Load("gfx/eid_transform_icons.anm2", true)
EID.CursorSprite:Play("Cursor")

local hudBBSprite = Sprite()
hudBBSprite:Load("gfx/eid_transform_icons.anm2", true)
hudBBSprite:Play("boundingBox")


EID.ModIndicator = { }
-- Overwriting "RegisterMod" to track which mods are loading
-- Useful to associate items to mods
EID._currentMod = ""
local OldRegisterMod = RegisterMod
RegisterMod = function (modName, apiVersion, ...)
	EID._currentMod = modName
	EID.ModIndicator[modName] = { Name = modName, Icon = nil }
	return OldRegisterMod(modName, apiVersion, ...)
end

------- Load all modules and other stuff ------

--languages
for _,lang in ipairs(EID.Languages) do
	require("descriptions."..EID.GameVersion.."."..lang)
end
table.sort(EID.Languages)

pcall(require,"scripts.eid_savegames")
require("features.eid_mcm")
require("features.eid_data")
if EID.isRepentancePlus then
	require("features.eid_xmldata_rep+")
else
	require("features.eid_xmldata")
end
require("features.eid_api")
require("features.eid_conditionals")
require("features.eid_modifiers")
require("features.eid_holdmapdesc")

-- load Repentence descriptions
if EID.isRepentance then
	EID.GameVersion = "rep"
	for _,lang in ipairs(EID.Languages) do
		local wasSuccessful, err = pcall(require,"descriptions."..EID.GameVersion.."."..lang)
		if not wasSuccessful and not string.find(err, "not found") then
			Isaac.ConsoleOutput("Load rep "..lang.." failed: "..tostring(err))
		end
	end

	-- Load Repentance+ DLC data 
	if EID.isRepentancePlus then
		EID.GameVersion = "rep+"
		for _,lang in ipairs(EID.Languages) do
			local wasSuccessful, err = pcall(require,"descriptions."..EID.GameVersion.."."..lang)
			if not wasSuccessful and not string.find(err, "not found") then
				Isaac.ConsoleOutput("Load rep+ "..lang.." failed: "..tostring(err))
			end
		end
	end
end

EID.LastRenderCallColor = EID:getTextColor()
local nullVector = Vector(0,0)

---------------------------------------------------------------------------
------------------------------- Load Font ---------------------------------
local modfolder ='manual-item-descriptions_3378810576' --release mod folder name

function EID:GetCurrentModPath()
	if debug then
		return string.sub(debug.getinfo(EID.GetCurrentModPath).source,2) .. "/../"
	end
	--use some very hacky trickery to get the path to this mod
	local _, err = pcall(require, "")
	local _, basePathStart = string.find(err, "no file '", 1)
	local _, modPathStart = string.find(err, "no file '", basePathStart)
	local modPathEnd, _ = string.find(err, ".lua'", modPathStart)
	local modPath = string.sub(err, modPathStart+1, modPathEnd-1)
	modPath = string.gsub(modPath, "\\", "/")
	modPath = string.gsub(modPath, "//", "/")
	modPath = string.gsub(modPath, ":/", ":\\")

	return modPath
end
EID.modPath = EID:GetCurrentModPath()

EID.font = Font() -- init font object
EID:fixDefinedFont()
local fontFile = EID.Config["FontType"] or "default"
local success = EID:loadFont(EID.modPath .. "resources/font/eid_"..fontFile..".fnt")
if not success then
	if EID.isRepentance then
		success = EID:loadFont("../mods/"..modfolder.."/resources/font/eid_"..fontFile..".fnt")
		if not success then
			Isaac.ConsoleOutput("EID WAS NOT ABLE TO LOAD THE FONT!!!!!!!! Please contact the mod creator!\n")
			Isaac.ConsoleOutput("File not found (absolute path): "..EID.modPath .. "resources/font/eid_"..fontFile..".fnt\n")
			Isaac.ConsoleOutput("File not found (relative path): ../mods/"..modfolder.."/resources/font/eid_"..fontFile..".fnt")
			return
		else
			EID.modPath = "../mods/"..modfolder.."/"
		end
	else
		Isaac.ConsoleOutput("EID WAS NOT ABLE TO LOAD THE FONT!!!!!!!! Please contact the mod creator!\n")
		Isaac.ConsoleOutput("File does not exist: "..EID.modPath .. "resources/font/eid_"..fontFile..".fnt")
		return
	end
end

function EID:handleEditing(entity, descriptionObj)
	local adjustedID = EID:getAdjustedSubtype(entity.Type, entity.Variant, entity.SubType)
	local tableName = EID:getTableName(entity.Type, entity.Variant, entity.SubType)
	
	if not EID.wasEditing then
		EID.currentCursorPosition = #descriptionObj.Description
	end
	
	for keyCode, mappedResult in pairs(EID.KeyboardMapping) do
		if Input.IsButtonTriggered(keyCode, 0) then
			local isShiftPressed = Input.IsButtonPressed(Keyboard.KEY_LEFT_SHIFT, 0) or Input.IsButtonPressed(Keyboard.KEY_RIGHT_SHIFT, 0)
			local isRightAltPressed = Input.IsButtonPressed(Keyboard.KEY_RIGHT_ALT, 0)
			local mappedString = mappedResult(isShiftPressed, isRightAltPressed)
			descriptionObj.Description = descriptionObj.Description:sub(1, EID.currentCursorPosition) .. mappedString .. descriptionObj.Description:sub(EID.currentCursorPosition + 1)

			EID.currentCursorPosition = EID.currentCursorPosition + #mappedString

			local editingAction = EID.editingKeyboardActions[keyCode]
			if editingAction ~= nil then
				editingAction.action(descriptionObj)
				EID.editingKeyboardActions[keyCode].nextPossibleTick = Isaac.GetTime() + 500
			end

			if keyCode == Keyboard.KEY_F4 then
				descriptionObj.Description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.#Integer euismod quis nunc at finibus.#In nulla sem, hendrerit in consequat quis##congue eu dui.#Curabitur efficitur mi a orci venenatis dapibus."
			end
		end
	end
	
	for keyCode, actionObject in pairs(EID.editingKeyboardActions) do
		if actionObject.nextPossibleTick <= Isaac.GetTime() and Input.IsButtonPressed(keyCode, 0) then
			actionObject.action(descriptionObj)
			EID.editingKeyboardActions[keyCode].nextPossibleTick = Isaac.GetTime() + 50
		end
	end
	
	-- save back to keep things persistent
	EID.descriptions["en_us"][tableName][adjustedID][3] = descriptionObj.Description
	EID.Config.DescriptionData = EID.descriptions

	return descriptionObj
end

function EID:enableEditMode()
	EID.isEditing = true

	if ModConfigMenu then
		ModConfigMenu.ControlsEnabled = false
	end
end

function EID:disableEditMode()
	EID.isEditing = false

	if ModConfigMenu then
		ModConfigMenu.ControlsEnabled = true
	end
end

function EID:onActionTriggeredOverride(entity, hook, action)
	-- This is important to not block opening the menu which would be quite disrupting
	-- While this could possibly be checked in the update loop, checking it here seems safer to avoid any override of pause press
	if 
		Input.IsButtonTriggered(Keyboard.KEY_ESCAPE, 0) or
		Input.IsActionTriggered(ButtonAction.ACTION_PAUSE, 1) or
		Input.IsActionTriggered(ButtonAction.ACTION_PAUSE, 2) or
		Input.IsActionTriggered(ButtonAction.ACTION_PAUSE, 3)
	then
		EID:disableEditMode()
		EID.isSummaryPermanentlyOpen = false
	end

	if EID.isEditing then
		return false
	end

	if EID.isSummaryPermanentlyOpen and action ~= ButtonAction.ACTION_DROP then -- allow drop action for switching active or pocket item
		return false
	end

	return nil
end
EID:AddCallback(ModCallbacks.MC_INPUT_ACTION, EID.onActionTriggeredOverride, InputHook.IS_ACTION_TRIGGERED)


function EID:onActionPressedOverride(entity, hook, action)
	if EID.isEditing or EID.isSummaryPermanentlyOpen then
		return false
	end

	return nil
end
EID:AddCallback(ModCallbacks.MC_INPUT_ACTION, EID.onActionPressedOverride, InputHook.IS_ACTION_PRESSED)


function EID:getActionValueOverride(entity, hook, action)
	if EID.isEditing then
		return 0.0
	end

	return nil
end
EID:AddCallback(ModCallbacks.MC_INPUT_ACTION, EID.getActionValueOverride, InputHook.GET_ACTION_VALUE)

---------------------------------------------------------------------------
-------------Handle Resetting Floor Trackers--------------
function EID:onNewFloor()
	pathsChecked = {}
	if EID.isRepentance then
		altPathItemChecked = {}
	end
end
EID:AddCallback(ModCallbacks.MC_POST_NEW_LEVEL, EID.onNewFloor)

---------------------------------------------------------------------------
------------------------Handle ALT FLOOR CHOICE----------------------------

local questionMarkSprite = Sprite()
questionMarkSprite:Load("gfx/005.100_collectible.anm2",true)
questionMarkSprite:ReplaceSpritesheet(1,"gfx/items/collectibles/questionmark.png")
questionMarkSprite:LoadGraphics()

function EID:IsAltChoice(pickup)
	-- do not run this while Curse of the Blind is active, since this function is really just a "is collectible pedestal a red question mark" check
	if not EID.isRepentance or EID:hasCurseBlind() then
		return false
	end
	if altPathItemChecked[pickup.InitSeed] ~= nil then
		return altPathItemChecked[pickup.InitSeed]
	end
	if game:GetRoom():GetType() ~= RoomType.ROOM_TREASURE then
		altPathItemChecked[pickup.InitSeed] = false
		return false
	end

	local entitySprite = pickup:GetSprite()
	local name = entitySprite:GetAnimation()

	if name ~= "Idle" and name ~= "ShopIdle" then
		-- Collectible can be ignored. It's definitely not hidden
		altPathItemChecked[pickup.InitSeed] = false
		return false
	end

	questionMarkSprite:SetFrame(name,entitySprite:GetFrame())
	-- Quickly check some points in entitySprite to not need to check the whole sprite
	-- We check the range from Y -40 to 10 in 3 pixel steps and also X -1 to 1.  GetTexel() gets the color value of a sprite at a given location. the center of the sprite is here in the Pivot point of the sprite in the anm2 file.
	-- therefore we go negative 40 pixels up to read the sprite as it is on a pedestal. We also look 10 pixel down to make comparing shop items more accurate

	for i = -1,1,1 do
		for j = -40,10,3 do
			local qcolor = questionMarkSprite:GetTexel(Vector(i,j),nullVector,1,1)
			local ecolor = entitySprite:GetTexel(Vector(i,j),nullVector,1,1)
			if qcolor.Red ~= ecolor.Red or qcolor.Green ~= ecolor.Green or qcolor.Blue ~= ecolor.Blue then
				-- it is not same with question mark sprite
				altPathItemChecked[pickup.InitSeed] = false
				return false
			end
		end
	end

	altPathItemChecked[pickup.InitSeed] = true
	return true
end

---------------------------------------------------------------------------
--------------------------Handle Scale Shortcut----------------------------

local scaleMin = 0.1
local scaleMax = 2
local scaleSpeed = 0.01 -- scale size per frame
local scaleToBigger = true
EID.CurrentScaleType = "Size" -- Size or LocalModeSize; checked by EID:getTextPosition() to not apply modifiers in local mode
local scaleHoldFrame = 0
local function handleScaleKey()
	local scaleKey = EID.Config["SizeHotkey"]

	-- press and hold ScaleKey
	if Input.IsButtonPressed(scaleKey, 0) then
		if scaleHoldFrame > 60 then
			EID.MCM_OptionChanged = true
			local newScale
			if scaleToBigger then
				newScale = EID.Scale + scaleSpeed
				if newScale > scaleMax then
					scaleToBigger = false
				end
			else
				newScale = EID.Scale - scaleSpeed
				if newScale < scaleMin then
					scaleToBigger = true
				end
			end
			EID.Scale = newScale
			EID.Config[EID.CurrentScaleType] = newScale
		else
			scaleHoldFrame = scaleHoldFrame + 1
		end
	end
	-- press ScaleKey
	if Input.IsButtonTriggered(scaleKey, 0) then
		EID.MCM_OptionChanged = true
		scaleHoldFrame = 0
		local scale = EID.Scale

		-- switch between 1, 1.5 and 0.5
		if math.abs(scale - 1) < 0.01 then
			scale = 1.5
		elseif math.abs(scale - 1.5) < 0.01 then
			scale = 0.5
		else
			scale = 1
		end

		EID.Config[EID.CurrentScaleType] = scale
		EID.Scale = scale
	end
end

---------------------------------------------------------------------------
---------------------------Printing Functions------------------------------

EID.previousDescs = {}
EID.CachingDescription = false
EID.CachedIcons = {}
EID.CachedStrings = {}
EID.CachedIndicators = {}
EID.CachedRenderPoses = {}
EID.descriptionsToPrint = {}
EID.entitiesToPrint = {}

function EID:ResetDescCache()
	EID.CachedIcons = {}
	EID.CachedStrings = {}
	EID.CachedRenderPoses = {}
	-- EID.CachedIndicators = {}
	EID.previousDescs = {}
end


function EID:addDescriptionToPrint(desc, insertLoc)
	if desc.Entity and EID.entitiesToPrint[GetPtrHash(desc.Entity)] then return end
	if #EID.descriptionsToPrint == EID.Config["MaxDescriptionsToDisplay"] and not insertLoc then return end
	if insertLoc then table.insert(EID.descriptionsToPrint, insertLoc, desc)
	else table.insert(EID.descriptionsToPrint, desc) end
	-- if we've inserted a desc at the front of a full desc list, pop the last desc out of the table
	if #EID.descriptionsToPrint > EID.Config["MaxDescriptionsToDisplay"] then table.remove(EID.descriptionsToPrint) end
	if desc.Entity then EID.entitiesToPrint[GetPtrHash(desc.Entity)] = true end
end

function EID:addQuestionMarkDescription(entity, description)
	EID:addDescriptionToPrint({ Icon = EID.InlineIcons["QuestionMark"], Description = description or "", Entity = entity})
end

local prevPrintFrame = 0

function EID:printDescriptions(useCached)
	if EID.isEditing then
		useCached = false
	end

	prevPrintFrame = EID.GameRenderCount

	EID.CachingDescription = false
	if not useCached then
		-- Test if we should print our cached descriptions or not
		-- Did an option change, or it's a different number of descriptions?
		if #EID.descriptionsToPrint ~= #EID.previousDescs or EID.OptionChanged or EID.MCM_OptionChanged then
			EID:printNewDescriptions()
			if not EID.isEditing then return end
		end
		-- Do the description entities match, and the description texts match?
		for i,newDesc in ipairs(EID.descriptionsToPrint) do
			local oldDesc = EID.previousDescs[i]
			if newDesc.Description ~= oldDesc.Description or newDesc.Name ~= oldDesc.Name or
			(newDesc.Entity and oldDesc.Entity and GetPtrHash(newDesc.Entity) ~= GetPtrHash(oldDesc.Entity)) then
				EID:printNewDescriptions()
				if not EID.isEditing then return end
			end
		end
	end

	if #EID.previousDescs > 0 then
		EID.isDisplaying = true
	end

	-- Print our cached descriptions
	if not EID.isShowingReminder then 
		for _,indicator in ipairs(EID.CachedIndicators) do
			EID:renderIndicator(indicator[1], indicator[2])
		end
	end
	for i,oldDesc in ipairs(EID.previousDescs) do
		EID:printDescription(oldDesc, i)
	end
end

function EID:printNewDescriptions()
	EID.CachingDescription = true
	EID:ResetDescCache()

	for _,newDesc in ipairs(EID.descriptionsToPrint) do
		if newDesc.Description == "UnidentifiedPill" then
			if EID:renderUnidentifiedPill(newDesc.Entity) ~= false then
				table.insert(EID.previousDescs, newDesc)
			end
		elseif EID:printDescription(newDesc) ~= false then
			table.insert(EID.previousDescs, newDesc)
		end
	end
	EID.CachingDescription = false

	if #EID.previousDescs > 0 then
		EID.isDisplaying = true
	end
end

function EID:printDescription(desc, cachedID)
	EID:PositionLocalMode(desc.Entity)
	-- Do not print this description if it has to be drawn in the top-left and we've already drawn a top-left desc this frame
	if EID.CurrentScaleType == "Size" then
		if alwaysUseLocalMode then return false
		else alwaysUseLocalMode = true end
	end
	EID.isDisplaying = true
	local renderPos = EID:getTextPosition()

	if cachedID and not EID.isEditing then
		local localModeDiff = renderPos - EID.CachedRenderPoses[cachedID]
		-- Drawing our currently saved description
		for _,icon in ipairs(EID.CachedIcons[cachedID]) do
			-- set inline icon to specific frame
			if icon[6] >= 0 then
				icon[1]:SetFrame(icon[5], icon[6])
			-- frame of -1 = it's an animation, let it play
			elseif not icon[1]:IsPlaying(icon[5]) or icon[1]:IsFinished(icon[5]) then
				icon[1]:Play(icon[5],true)
			else
				icon[1]:Update()
			end
			EID:renderIcon(icon[1], icon[2] + localModeDiff.X, icon[3] + localModeDiff.Y, icon[4])
		end
		for _,str in ipairs(EID.CachedStrings[cachedID]) do
			-- check for func (Rainbow, Blink, Fade), reset the color's Alpha to EID.Config["Transparency"] if func
			if str[5] then
				str[4].Alpha = str[6]
				str[4] = str[5](str[4])
			end
			EID.font:DrawStringScaledUTF8(str[1], str[2] + localModeDiff.X, str[3] + localModeDiff.Y, EID.Scale, EID.Scale, str[4], 0, false)
		end
		return
	else
		table.insert(EID.CachedIcons, {})
		table.insert(EID.CachedStrings, {})
		table.insert(EID.CachedRenderPoses, Vector(renderPos.X, renderPos.Y))
	end

	local textScale = Vector(EID.Scale, EID.Scale)
	local offsetX = 0
	EID.lineHeight = EID.Config["LineHeight"]
	if EID.Config["ShowItemIcon"] and desc.Icon then
		offsetX = offsetX + 14
		EID:renderInlineIcons({{desc.Icon,0}}, renderPos.X - 3 * EID.Scale, renderPos.Y - 4 * EID.Scale)
	end

	--Display ItemType / Charge
	if EID.Config["ShowItemType"] and (desc.ItemType == ItemType.ITEM_ACTIVE or desc.ItemType == ItemType.ITEM_FAMILIAR) then
		local offsetY = 2
		local itemTypeAnm2 = EID.ItemTypeAnm2Names[desc.ItemType]
		EID.IconSprite:Play(itemTypeAnm2)
		EID:renderIcon(EID.IconSprite, renderPos.X + offsetX * EID.Scale, renderPos.Y + offsetY * EID.Scale, nil, itemTypeAnm2 , 0)
		if desc.ItemType == ItemType.ITEM_ACTIVE then
		 -- Display Charge
			offsetX = offsetX + 1
			local anim = "numbers"
			local frameNum = desc.Charges or 0
			if desc.ChargeType == (EID.isRepentance and ItemConfig.CHARGE_TIMED or 1) then
				anim = "Misc"; frameNum = 6 -- Timer Icon
			elseif desc.ChargeType == (EID.isRepentance and ItemConfig.CHARGE_SPECIAL or 2) then
				frameNum = 13 -- Question Mark Icon
			end
			EID:renderIcon(EID.InlineIconSprite2, renderPos.X + offsetX * EID.Scale, renderPos.Y + offsetY * EID.Scale, nil, anim, frameNum)
		end
		offsetX = offsetX + 8
	end
	--Display Itemname
	local curName = ""
	if EID.Config["ShowItemName"] and desc.Name then
		curName = desc.Name
		if EID.Config["TranslateItemName"] ~= 2 then
			local curLanguage = EID.Config["Language"]
			if EID:getLanguage() ~= "en_us" then
				EID.Config["Language"] = "en_us"
				local englishName = desc.PermanentTextEnglish or EID:getObjectName(desc.ObjType, desc.ObjVariant, desc.ObjSubType)
				EID.Config["Language"] = curLanguage
				if EID.Config["TranslateItemName"] == 1 then
					curName = englishName
				elseif EID.Config["TranslateItemName"] == 3 and curName ~= englishName then
					curName = curName.." ("..englishName..")"
				end
			end
		end
	end
	-- Display Entity ID
	if EID.Config["ShowObjectID"] and desc.ObjType and desc.ObjType > 0 then
		curName = curName.." {{ColorGray}}"..desc.ObjType.."."..desc.ObjVariant.."."..desc.ObjSubType
	end
	-- Display the mod this item is from
	if desc.ModName then
		curName = curName .. EID:getModNameString(desc)
	end

	EID:renderString(
		curName,
		renderPos + (Vector(offsetX, -3) * EID.Scale),
		textScale,
		EID:getNameColor()
	)

	renderPos.Y = renderPos.Y + EID.lineHeight * EID.Scale

	if EID.Config["ShowItemDescription"] then
		EID:printBulletPoints(desc.Description, renderPos)
	end
end

function EID:printBulletPoints(description, renderPos)
	if EID.isEditing then
		description = description:sub(1, EID.currentCursorPosition) .. "{{ColorCursor}}{{ColorBlink}}|{{CR}}" .. description:sub(EID.currentCursorPosition + 1)
	end

	local textboxWidth = tonumber(EID.Config["TextboxWidth"])
	local textScale = Vector(EID.Scale, EID.Scale)
	description = EID:replaceNameMarkupStrings(description)
	description = EID:replaceShortMarkupStrings(description)
	description = EID:replaceMarkupSize(description)
	
	if #description == 0 then return renderPos end -- skip for completely empty descriptions

	for line in string.gmatch(description, "([^#]*)") do
		local formatedLines = EID:fitTextToWidth(line, textboxWidth, EID.BreakUtf8CharsLanguage[EID:getLanguage()])
		local textColor = EID:getTextColor()
		for i, lineToPrint in ipairs(formatedLines) do
			-- render bulletpoint
			if i == 1 then
				local bpIcon, rejectedIcon = EID:handleBulletpointIcon(lineToPrint)
				if EID:getIcon(bpIcon) ~= EID.InlineIcons["ERROR"] then
					lineToPrint = string.gsub(lineToPrint, bpIcon .. " ?", "", 1)
					textColor =	EID:renderString(bpIcon, renderPos + Vector(-3 * EID.Scale, 0), textScale , textColor, true)
				else
					if rejectedIcon then lineToPrint = string.gsub(lineToPrint, rejectedIcon .. " ", "", 1) end
					textColor =	EID:renderString(bpIcon, renderPos, textScale , textColor)
				end
				EID.LastRenderCallColor = EID:copyKColor(textColor) -- Save line start Color for eventual Color Reset call
			end
			textColor =	EID:renderString(lineToPrint, renderPos + Vector(12 * EID.Scale, 0), textScale, textColor)
				renderPos.Y = renderPos.Y + EID.lineHeight * EID.Scale
		end
	end
	return renderPos
end
---------------------------------------------------------------------------
----------------------------Handle New Room--------------------------------
EID.isMirrorRoom = false
EID.isDeathCertRoom = false
if EID.isRepentance then
	function EID:onNewRoomRep()
		local level = game:GetLevel()
		EID.isMirrorRoom = level:GetCurrentRoom():IsMirrorWorld()
		EID.isDeathCertRoom = EID:GetDimension(level) == 2
	end
	EID:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EID.onNewRoomRep)
end

function EID:onNewRoom()
	EID:CheckCurrentRoomGridEntities()
	-- Store values here to be rewound after using Glowing Hour Glass
	preHourglassStatus = {}
	preHourglassStatus.absorbedItems = EID:CopyTable(EID.absorbedItems)
	preHourglassStatus.PlayerItemInteractions = EID:CopyTable(EID.PlayerItemInteractions)
end
EID:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, EID.onNewRoom)

function EID:onCmd(command, _)
	if command == "netstart" then -- the game somehow propagates that command correctly to the callback...
		EID.isOnlineMultiplayer = true
	end
end 
EID:AddCallback(ModCallbacks.MC_EXECUTE_CMD, EID.onCmd)
---------------------------------------------------------------------------
---------------------------Handle Rendering--------------------------------

function EID:renderUnidentifiedPill(entity)
	EID:PositionLocalMode(entity)
	if EID.CurrentScaleType == "Size" then
		if alwaysUseLocalMode then return false
		else alwaysUseLocalMode = true end
	end
	local pillColor = entity.SubType
	if pillColor >= 2049 then
		pillColor = pillColor - 2048
	end
	local pos = EID:getTextPosition()
	if EID.CachingDescription then
		table.insert(EID.CachedStrings, {})
		table.insert(EID.CachedIcons, {})
		table.insert(EID.CachedRenderPoses, Vector(pos.X, pos.Y))
	end

	local descriptionObj = EID:getDescriptionObj(entity.Type, entity.Variant, entity.SubType, entity, false)
	descriptionObj.Name = EID:getDescriptionEntry("unidentifiedPill")
	descriptionObj.Description = ""
	descriptionObj.ShowWhenUnidentified = false
	descriptionObj = EID:applyDescriptionModifier(descriptionObj, -999)

	if EID.Config["ShowItemIcon"] then
		descriptionObj.Name = "{{Pill"..pillColor.."}} "..descriptionObj.Name
	end
	EID:renderString(descriptionObj.Name, pos + Vector(0,-1), Vector(EID.Scale, EID.Scale), EID:getErrorColor())
	if EID.Config["ShowItemDescription"] and descriptionObj.ShowWhenUnidentified then
		pos.Y = pos.Y + EID.lineHeight * EID.Scale
		EID:printBulletPoints(descriptionObj.Description, pos)
	end
end

-- RGB colors for each player's highlights (Red, Blue, Yellow, Green)
local playerRGB = { {1,0.6,0.6}, {0.5,0.75,1}, {0.9, 0.9, 0.5}, {0.5,1,0.75} }

---@param entity Entity
function EID:renderIndicator(entity, playerNum)
	if EID.Config["Indicator"] == "none" then
		return
	end
	local repDiv = 1
	local entityPos = Isaac.WorldToScreen(entity.PositionOffset and entity.Position + entity.PositionOffset or entity.Position)
	local ArrowOffset = Vector(0, -35)
	if entity.Variant == 100 and not entity:ToPickup():IsShopItem() then
		ArrowOffset = Vector(0, -62)
	end
	local arrowPos = Isaac.WorldToScreen(entity.Position + ArrowOffset)
	entityPos = entityPos + (EID:getEntityData(entity, "EID_RenderOffset") or Vector(0,0))

	local sprite = nil
	if not EID:IsGridEntity(entity) then sprite = entity:GetSprite() end
	if EID.isRepentance then
		repDiv = 255
		if EID.isMirrorRoom then
			local screenCenter = EID:getScreenSize()/2
			entityPos.X = entityPos.X - (entityPos-screenCenter).X * 2
			arrowPos.X = arrowPos.X - (arrowPos-screenCenter).X * 2
			if sprite then sprite.FlipX = true end
		end
	end

	-- Don't apply sprite.Color changes to Effects (Dice Floors, Card Reading Portals), use Arrow instead
	if EID.Config["Indicator"] == "arrow" or entity.Type == 1000 or EID:IsGridEntity(entity) then
		ArrowSprite:RenderLayer(playerNum-1, arrowPos, nullVector, nullVector)
	else
		local colorMult = {1,1,1}
		local framecount = entity.FrameCount or game:GetFrameCount()
		if EID.isMultiplayer then colorMult = playerRGB[playerNum] end
		if EID.Config["Indicator"] == "blink" then
			local c = 255 - math.floor(255 * ((framecount % 40) / 40))
			local r, g, b = math.floor(c*colorMult[1]), math.floor(c*colorMult[2]), math.floor(c*colorMult[3])
			sprite.Color = Color(1, 1, 1, 1, r/repDiv, g/repDiv, b/repDiv)
			EID:RenderEntity(entity, sprite, entityPos)
			sprite.Color = Color(1, 1, 1, 1, 0, 0, 0)
		else
			if EID.Config["Indicator"] == "highlight" then
				local c = 255 - math.floor(255 * ((framecount % 40) / 40))
				local r, g, b = math.floor(c*colorMult[1]), math.floor(c*colorMult[2]), math.floor(c*colorMult[3])
				sprite.Color = Color(1, 1, 1, 1, r/repDiv, g/repDiv, b/repDiv)
			elseif EID.Config["Indicator"] == "border" then
				local c = 255
				local r, g, b = math.floor(c*colorMult[1]), math.floor(c*colorMult[2]), math.floor(c*colorMult[3])
				sprite.Color = Color(1, 1, 1, 1, r/repDiv, g/repDiv, b/repDiv)
			end
			EID:RenderEntity(entity, sprite, entityPos + Vector(0, 1))
			EID:RenderEntity(entity, sprite, entityPos + Vector(0, -1))
			EID:RenderEntity(entity, sprite, entityPos + Vector(1, 0))
			EID:RenderEntity(entity, sprite, entityPos + Vector(-1, 0))
			sprite.Color = Color(1, 1, 1, 1, 0, 0, 0)
			EID:RenderEntity(entity, sprite, entityPos)
		end
	end
	if EID.isMirrorRoom then
		if sprite then sprite.FlipX = false end
	end
end

---@param entity Entity
---@diagnostic disable-next-line: duplicate-set-field
function EID:PositionLocalMode(entity)
	-- don't use Local Mode for descriptions without an entity (or dice floors)
	if (EID.Config["DisplayMode"] == "local" or alwaysUseLocalMode) and entity and entity.Variant ~= EffectVariant.DICE_FLOOR then
		EID.Scale = EID.Config["LocalModeSize"]
		EID.CurrentScaleType = "LocalModeSize"
		local textBoxWidth = EID.Config["LocalModeCentered"] and tonumber(EID.Config["TextboxWidth"])/2 * EID.Scale or -30
		local textPosOffset = Vector(-textBoxWidth, 0)

		local additiveOffset = EID.LocalModePositionOffset.Default
		for _, offsetFunc in pairs(EID.LocalModePositionOffset) do
			if type(offsetFunc) == "function" then
				additiveOffset = offsetFunc(entity) or additiveOffset
				break
			end
		end
		textPosOffset = textPosOffset + additiveOffset

		EID:alterTextPos(Isaac.WorldToScreen(entity.Position + textPosOffset))
		if EID.isMirrorRoom then
			EID:alterTextPos(Isaac.WorldToScreen(entity.Position + textPosOffset * Vector(-1,0)))
			local screenCenter = EID:getScreenSize()/2
			EID.UsedPosition.X = EID.UsedPosition.X - (EID.UsedPosition-screenCenter).X * 2
		end
	else
		EID.Scale = EID.Config["Size"]
		EID.CurrentScaleType = "Size"
		EID.UsedPosition = Vector(EID.Config["XPosition"], EID.Config["YPosition"])
	end
end

function EID:renderHUDLocationIndicators()
	local mousePos = Isaac.WorldToRenderPosition(Input.GetMousePosition(true)) * 2
	Isaac.RenderScaledText("Mouse pos   X:"..mousePos.X.." Y:"..mousePos.Y, 100, 10, 0.5, 0.5, 1 ,1 ,1 ,1 )
	Isaac.RenderScaledText("HUD Adjustment Preview!", 200, 10, 1, 1, 1 ,0.25 ,0.25 ,1 )
	for k, v in pairs(EID.HUDElements) do
		local hudElement = EID:handleHUDElement(v)
		hudBBSprite.Scale = Vector(hudElement.width/2, hudElement.height/2)
		hudBBSprite.Color = Color(1, 1, 1, EID.Config["Transparency"], 0, 0, 0)
		hudBBSprite:Render(Vector(hudElement.x/2, hudElement.y/2), nullVector, nullVector)
		Isaac.RenderScaledText(k, hudElement.x/2, hudElement.y/2, 0.5, 0.5, 1, 1, 1 ,1)
	end
end

local lastMousePos = Vector(0,0)
local lastMouseMove = 0

function EID:handleHoverHUD()
	local mousePos = Isaac.WorldToScreen(Input.GetMousePosition(true)) * 2
	if mousePos:Distance(lastMousePos) > 2 then
		lastMousePos = mousePos
		lastMouseMove = game:GetFrameCount()
	end
	if game:GetFrameCount() - lastMouseMove > 60 * 3 then
		return nil
	end
	if EID.Config["ShowCursor"] then
		EID.CursorSprite:Render(Vector(mousePos.X / 2, mousePos.Y / 2), nullVector, nullVector)
	end
	for _, v in pairs(EID.HUDElements) do
		local hudElement = EID:handleHUDElement(v)
		if hudElement.x <= mousePos.X and (hudElement.x + hudElement.width) >= mousePos.X and hudElement.y <= mousePos.Y and (hudElement.y + hudElement.height) >= mousePos.Y then
			local result = hudElement.descriptionObj()
			if result then return result end
		end
	end
	return nil
end

function EID:setPlayer()
	local numPlayers = game:GetNumPlayers()
	-- Old simple setPlayer, to reduce runtime in single player
	if numPlayers == 1 or not EID.Config["CoopDescriptions"] then
		local p = Isaac.GetPlayer(0)
		if EID.isRepentance and p:GetPlayerType() == PlayerType.PLAYER_THEFORGOTTEN_B then
			EID.player = p:GetOtherTwin() or p
		else
			EID.player = p
		end
		EID.players = { EID.player }
		if EID.isRepentance then EID.players = { EID.player, EID.isRepentance and EID.player:GetOtherTwin() } end
		EID.coopMainPlayers = { EID.player }
		EID.coopAllPlayers = EID.players
		EID.controllerIndexes = {}
		EID.controllerIndexes[p.ControllerIndex] = 1
		EID.isMultiplayer = false
		return
	end

	-- Get our primary player, our list of all players, and a list of the primary player for each controller
	EID.coopAllPlayers = {} -- all player characters in order
	EID.coopMainPlayers = {} -- the primary player character from each controller
	EID.controllerIndexes = {} -- simple table to map each controller index to P1/P2/P3/P4 (since index 0 could be P2)
	local currentPlayerNum = 1
	for i = 0, numPlayers - 1 do
		local player = Isaac.GetPlayer(i)
		-- Don't include player entities with a parent (Strawman / Soul of Jacob and Esau)
		if player.Parent == nil then
			local newIndex = not EID.controllerIndexes[player.ControllerIndex]
			-- Tainted Soul is treated as the primary player for Tainted Forgotten, so swap them
			if EID.isRepentance and (player:GetPlayerType() == PlayerType.PLAYER_THEFORGOTTEN_B
				or player:GetPlayerType() == PlayerType.PLAYER_THESOUL_B) then
				player = player:GetOtherTwin() or player
			end

			table.insert(EID.coopAllPlayers, player)
			if newIndex then
				table.insert(EID.coopMainPlayers, player)
				EID.controllerIndexes[player.ControllerIndex] = currentPlayerNum
				currentPlayerNum = currentPlayerNum + 1
			end
		end
	end
	EID.player = EID.coopAllPlayers[1]
	-- second entry will be nil if no twin or AB+ (REPENTANCE = nil)
	EID.players = { EID.player, EID.isRepentance and EID.player:GetOtherTwin() }
	EID.isMultiplayer = #EID.coopMainPlayers > 1
end

---------------------------------------------------------------------------
---------------------------On Update Function------------------------------
-- Runs 30 times a second; doesn't update while paused

local collSpawned = false

function EID:onGameUpdate()
	EID.GameUpdateCount = EID.GameUpdateCount + 1
	EID:checkPlayersForMissingItems()
	EID:evaluateQueuedItems()
	EID:evaluateHeldPill()
	
	EID.TabHeldLastFrame = EID.TabHeldThisFrame
	EID.TabHeldThisFrame = EID:PlayersActionPressed(EID.Config["EIDToggleKey"])

	if collSpawned then
		collSpawned = false

		local curPositions = {}
		for _, entity in ipairs(Isaac.FindByType(5, 100, -1, true, false)) do
			-- Flag pedestals as being describable on frame 0 (for Tainted Isaac / Glitched Crown type pedestals to not be non-existent for a frame)
			EID:setEntityData(entity, "EID_DescribeOnFirstFrame", true)
			-- Fix Overlapping Pedestals if a collectible spawned this frame (needed for Mega Chest)
			local pos = entity.Position
			for _, otherPos in ipairs(curPositions) do
				if pos:Distance(otherPos[2]) == 0 then
					EID:setEntityData(entity, "EID_RenderOffset", Vector(10,0))
					EID:setEntityData(otherPos[1], "EID_RenderOffset", Vector(-10,0))
				end
			end
			table.insert(curPositions, {entity, entity.Position})
		end

	end
	
	-- Check player items for starting items
	if EID.ShouldCheckStartingItems then
		EID:UpdateAllPlayerPassiveItems()
		EID:SetOldestItemIndex()
		EID.ShouldCheckStartingItems = false
	end
end
EID:AddCallback(ModCallbacks.MC_POST_UPDATE, EID.onGameUpdate)

-- Wait until all collectibles spawning this frame have spawned before checking what we need to check about them
function EID:CollectibleSpawnedThisFrame(_)
	collSpawned = true
end
EID:AddCallback(ModCallbacks.MC_POST_PICKUP_INIT, EID.CollectibleSpawnedThisFrame, PickupVariant.PICKUP_COLLECTIBLE)

-- Pathchecking
local pathCheckerEntity = nil
local lastPathfindFrame = -1

local function attemptPathfind(entity)
	if (EID.Config["DisableObstructionOnFlight"] and EID.player.CanFly) or EID.isOnlineMultiplayer then
		pathsChecked[entity.InitSeed] = true
		return true
	end
	-- Don't reattempt pathfinding more than 3 times a second, unless this is a new entity
	if pathsChecked[entity.InitSeed] == false and EID.GameUpdateCount - lastPathfindFrame < 10 then return false end

	-- Spawn a Fireplace entity to attempt a pathfind to the target pickup, then remove it afterwards
	pathCheckerEntity = game:Spawn(33, 0, EID.player.Position, nullVector, EID.player, 6969, 4354)
	EID:setEntityData(pathCheckerEntity, "EID_Pathfinder", true)
	pathCheckerEntity.Visible = false
	local successful = pathCheckerEntity:ToNPC().Pathfinder:HasPathToPos(entity.Position, false)
	pathsChecked[entity.InitSeed] = successful
	pathCheckerEntity:Remove()
	pathCheckerEntity = nil
	lastPathfindFrame = EID.GameUpdateCount
	return successful
end

local hasShownStartWarning = false
function EID:CheckStartOfRunWarnings()
	if EID.isRepentance and not EID.Config["DisableStartOfRunWarnings"] and game:GetFrameCount() < 10*30 then
		-- Old Repentance version check; update this to check for the existence of the newest mod API function EID uses
		-- 1.7.9b (Dec. 08, 2022): The IsAvailable function was added (checking for Isaac.RunCallback existing instead)
		if Isaac.RunCallback == nil then
			local demoDescObj = EID:getDescriptionObj(-999, -1, 1)
			demoDescObj.Name = EID:getDescriptionEntry("AchievementWarningTitle") or ""
			demoDescObj.Description = EID:getDescriptionEntry("OldGameVersionWarningText") or ""
			EID:displayPermanentText(demoDescObj, "AchievementWarningTitle")
			hasShownStartWarning = true
		else
			if not EID:AreAchievementsAllowed() then
				local demoDescObj = EID:getDescriptionObj(-999, -1, 1)
				demoDescObj.Name = EID:getDescriptionEntry("AchievementWarningTitle") or ""
				demoDescObj.Description = EID:getDescriptionEntry("AchievementWarningText") or ""
				EID:displayPermanentText(demoDescObj, "AchievementWarningTitle")
				hasShownStartWarning = true
			end
		end
	elseif hasShownStartWarning then
		EID:hidePermanentText()
		hasShownStartWarning = false
	end
end

-- Check our position modifiers based on HUD offset and character choice
function EID:CheckPosModifiers()
	-- HUD offset adjustment, done every frame so it looks nice while changing the option
	if Options then
		EID:addTextPosModifier("HudOffset", Vector(((Options.HUDOffset * 10) * 2) - 20, (Options.HUDOffset * 10) - 10))
	else
		EID:addTextPosModifier("HudOffset", Vector((EID.Config["HUDOffset"] * 2) - 20, EID.Config["HUDOffset"] - 10))
	end
	-- the other modifiers don't need to be ran as frequently
	if EID.GameRenderCount % 30 ~= 0 then return end
	-- Greed Mode small right adjustment
	if game:IsGreedMode() then
		EID:addTextPosModifier("Greed Mode Horizontal", Vector(8,0))
	else
		EID:removeTextPosModifier("Greed Mode Horizontal")
	end
	if not EID.isRepentance then
		-- AB+ Schoolbag adjustment
		if EID.player:HasCollectible(CollectibleType.COLLECTIBLE_SCHOOLBAG) then
			EID:addTextPosModifier("Schoolbag", Vector(0,30))
		else
			EID:removeTextPosModifier("Schoolbag")
		end
	else
		-- Tainted Isaac and Tainted ??? unique HUD adjustment
		if EID.player:GetPlayerType() == 21 or EID.player:GetPlayerType() == 25 then
			EID:addTextPosModifier("Tainted HUD", Vector(0,26))
		else
			EID:removeTextPosModifier("Tainted HUD")
		end
		-- Jacob and Esau card/pill adjustment
		if EID.player:GetPlayerType() == 19 then
			EID:addTextPosModifier("J&E HUD", Vector(0,16))
		else
			EID:removeTextPosModifier("J&E HUD")
		end
		-- Magdalene Birthright, Keeper & Tainted Keeper third/fourth row of hearts adjustment
		if EID.player:GetEffectiveMaxHearts() + EID.player:GetSoulHearts() + (EID.player:GetBrokenHearts() * 2) >= 37 then
			EID:removeTextPosModifier("18 Heart HUD")
			EID:addTextPosModifier("24 Heart HUD", Vector(0,20))
		elseif EID.player:GetEffectiveMaxHearts() + EID.player:GetSoulHearts() + (EID.player:GetBrokenHearts() * 2) >= 25 then
			EID:removeTextPosModifier("24 Heart HUD")
			EID:addTextPosModifier("18 Heart HUD", Vector(0,10))
		else
			EID:removeTextPosModifier("18 Heart HUD")
			EID:removeTextPosModifier("24 Heart HUD")
		end
	end
end


---------------------------------------------------------------------------
---------------------------On Render Function------------------------------
local searchPartitions = EntityPartition.FAMILIAR + EntityPartition.ENEMY + EntityPartition.PICKUP + EntityPartition.PLAYER

EID.lastDescriptionEntity = nil
EID.lastDist = 0
EID.OptionChanged = false
EID.bagPlayer = nil

function EID:DrawLegend()
	local screenSize = EID:getScreenSize()
	EID.font:DrawStringScaledUTF8("Left/Right: ", screenSize.X / 2 - 160, screenSize.Y - 20, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("Previous/Next Character", screenSize.X / 2 - 130, screenSize.Y - 20, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("Up/Down: ", screenSize.X / 2 - 160, screenSize.Y - 10, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("Previous/Next Line", screenSize.X / 2 - 130, screenSize.Y - 10, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	
	
	EID.font:DrawStringScaledUTF8("Home/Pos1: ", screenSize.X / 2 - 50, screenSize.Y - 20, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("Start of Line", screenSize.X / 2 - 20, screenSize.Y - 20, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("End: ", screenSize.X / 2 - 50, screenSize.Y - 10, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("End of Line", screenSize.X / 2 - 20, screenSize.Y - 10, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)


	EID.font:DrawStringScaledUTF8("Del: ", screenSize.X / 2 + 30, screenSize.Y - 20, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("Delete Next Character", screenSize.X / 2 + 50, screenSize.Y - 20, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("Enter: ", screenSize.X / 2 + 30, screenSize.Y - 10, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	EID.font:DrawStringScaledUTF8("Add New Line", screenSize.X / 2 + 50, screenSize.Y - 10, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)


	local iconBasePosition = Vector(screenSize.X - 80, screenSize.Y / 2)

	local icons = {
		[0] = {
			"{{Damage}}",
			"{{Speed}}",
			"{{Tears}}",
			"{{Range}}",
			"{{Shotspeed}}",
			"{{Luck}}",
			"{{AngelChance}}",
			"{{DevilChance}}"
		},
		[1] = {
			"{{Heart}}",
			"{{SoulHeart}}",
			"{{BlackHeart}}",
			"{{EmptyHeart}}",
			"{{HealingRed}}",
			"{{Key}}",
			"{{Bomb}}",
			"{{Coin}}",
			"{{Rune}}",
			"{{Card}}",
			"{{Pill}}",
			"{{Battery}}",
			"{{GrabBag}}",
			"{{Chest}}",
			"{{GoldenChest}}"
		},
		[2] = {
			"{{Shop}}",
			"{{SecretRoom}}",
			"{{TreasureRoom}}",
			"{{AngelRoom}}",
			"{{DevilRoom}}",
			"{{BossRoom}}",
		}
	}

	EID:renderString("\1", iconBasePosition + Vector(0, -40), Vector(EID.Scale, EID.Scale), KColor(1, 1, 1, 1))	
	EID.font:DrawStringScaledUTF8("Page Up", iconBasePosition.X + 10, iconBasePosition.Y - 40, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	
	EID:renderString("\1", iconBasePosition + Vector(0, -30), Vector(EID.Scale, EID.Scale), KColor(1, 1, 1, 1))	
	EID.font:DrawStringScaledUTF8("{{ArrowUp}}", iconBasePosition.X + 10, iconBasePosition.Y - 30, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	
	EID:renderString("\2", iconBasePosition + Vector(0, -20), Vector(EID.Scale, EID.Scale), KColor(1, 1, 1, 1))	
	EID.font:DrawStringScaledUTF8("Page Down", iconBasePosition.X + 10, iconBasePosition.Y - 20, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	
	EID:renderString("\2", iconBasePosition + Vector(0, -10), Vector(EID.Scale, EID.Scale), KColor(1, 1, 1, 1))	
	EID.font:DrawStringScaledUTF8("{{ArrowDown}}", iconBasePosition.X + 10, iconBasePosition.Y - 10, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)

	for i, v in ipairs(icons[0]) do
		EID:renderString(v, iconBasePosition + Vector(0, i * 10), Vector(EID.Scale, EID.Scale), KColor(1, 1, 1, 1))	
		EID.font:DrawStringScaledUTF8(v, iconBasePosition.X + 10, iconBasePosition.Y + i * 10, EID.Scale, EID.Scale, KColor(1, 1, 1, 1), 0, false)
	end
end

function EID:OnRender()
	-- Increases by 60 per second, ignores pauses
	EID.GameRenderCount = EID.GameRenderCount + 1
	EID.OptionChanged = EID.MCM_OptionChanged
	EID.MCM_OptionChanged = false
	EID:resumeCoroutines()
	ArrowSprite:Update()
	EID:setPlayer()

	EID.isDisplaying = false
	EID.descriptionsToPrint = {}
	EID.entitiesToPrint = {}
	alwaysUseLocalMode = false

	-- just trigger checks on all inputs to correctly absorb inputs in MC_INPUT_ACTION callback
	-- not needed if EID.isEditing since the editing logic already does it
	if EID.isSummaryPermanentlyOpen and not EID.isEditing then
		for keyCode, _ in pairs(EID.KeyboardMapping) do
			Input.IsButtonTriggered(keyCode, 0)
		end
	end

	-- if frames were skipped (due to EID being hidden / in battle / in options), wipe the desc cache
	if EID.GameRenderCount > prevPrintFrame + 1 then
		EID:ResetDescCache()
		EID.CachedIndicators = {}
	end

	-- Do not check our hide, edit or scale hotkeys while a tab that can modify them is open
	if EID.MCMCompat_isDisplayingEIDTab ~= "General" then
		-- scale key must be handled before resetting to non-local mode
		handleScaleKey()
		if Input.IsButtonTriggered(EID.Config["HideKey"], 0) or Input.IsButtonTriggered(EID.Config["HideButton"], EID.player.ControllerIndex) then
			EID.isHidden = not EID.isHidden
		end
		if Input.IsButtonTriggered(EID.Config["EditKey"], 0) then
			if EID.isEditing then
				EID:disableEditMode()
			else
				EID:enableEditMode()
			end
		end
		if Input.IsButtonTriggered(EID.Config["ItemOverviewKey"], 0) then
			EID.isSummaryPermanentlyOpen = not EID.isSummaryPermanentlyOpen
		end
	end
	EID.TabPreviewID = 0
	EID.TabDescThisFrame = false

	-- If MCM is open, don't show anything unless we are on a tab that explicitely writes its name in the MCMCompat_isDisplayingEIDTab variable
	if ModConfigMenu and ModConfigMenu.IsVisible and ModConfigMenu.Config["Mod Config Menu"].HideHudInMenu and EID.MCMCompat_isDisplayingEIDTab == "" then
		return
	end

	-- Handle descriptions that display regardless of player position
	EID:CheckStartOfRunWarnings()
	EID:CheckPosModifiers()
	EID:renderMCMDummyDescription()

	if EID.isHidden then
		return
	elseif EID.Config["HideInBattle"] then
		if Isaac.CountBosses() > 0 or Isaac.CountEnemies() > 0 then
			return
		end
	end

	if EID.isDisplayingPermanent and EID.permanentDisplayTextObj ~= nil then
		EID:printDescription(EID.permanentDisplayTextObj)
		EID.isDisplaying = true
		return
	end

	-- Check for Tab (or user setting) being held, for the Item Reminder
	local tabHeld, playerNumHoldingTab = EID:PlayersActionPressed(EID.Config["EIDToggleKey"])
	if tabHeld then
		EID.holdTabPlayer = EID.coopMainPlayers[playerNumHoldingTab]
		if EID.holdTabCounter == 0 then -- update item reminder player selection
			EID:ItemReminderHandleInitHoldTab()
		end
		EID.holdTabCounter = EID.holdTabCounter + 1
	else
		EID.holdTabPlayer = nil
		EID.holdTabCounter = 0
	end
	-- Check for Drop being pressed, for Repentance D Infinity tracking
	if EID.isRepentance then
		local dropTriggered, playerNumPressingDrop = EID:PlayersActionPressed(ButtonAction.ACTION_DROP, Input.IsActionTriggered)
		if dropTriggered then
			local playerPressingDrop = EID.coopMainPlayers[playerNumPressingDrop]
			local playerID = EID:getPlayerID(playerPressingDrop, true)
			local playerType = playerPressingDrop:GetPlayerType()
			-- Forgotten's drop requires a double tap to actually count for this
			if (playerType == 16 or playerType == 17) then
				-- technically we should track a forgotten drop timer for each player but forget it
				if EID.GameUpdateCount > forgottenDropTimer then
					-- the actual interval here seems to be 6.5. 7 has false positives, 6 has false negatives
					forgottenDropTimer = EID.GameUpdateCount + 7
					dropTriggered = false
				else
					forgottenDropTimer = 0
				end
			end
		end
	end

	EID:ItemReminderHandleInputs()

	if EID.ForceRefreshCache then
		EID:ResetDescCache()
	end
	-- This is not a frame we should check for new descriptions; just print our cached ones
	if not EID:RefreshThisFrame() and not EID.MCM_OptionChanged and not EID.ForceRefreshCache and not EID.isEditing then
		EID:printDescriptions(true)
		return
	end
	EID.ForceRefreshCache = false

	-- We'll redraw the indicators in the process of determining what's in range, so wipe their cache
	EID.CachedIndicators = {}

	if EID.Config["EnableMouseControls"] then
		local hudDescription = EID:handleHoverHUD()
		if hudDescription then
			EID:addDescriptionToPrint(hudDescription)
		end
	end

	-- Decide how many player entities we're checking
	-- Primary P1 only, P1 + Esau, primary all controllers, or all controllers + Esaus
	local playerSearch = { EID.player }
	if EID.Config["CoopDescriptions"] then
		if EID.Config["PairedPlayerDescriptions"] then playerSearch = EID.coopAllPlayers
		else playerSearch = EID.coopMainPlayers end
	elseif EID.Config["PairedPlayerDescriptions"] then
		playerSearch = EID.players
	end

	local displayedDesc = {}
	
	-- Check for descriptions to print per player
	for playerNum,player in ipairs(playerSearch) do
		if (not displayedDesc[playerNum] or EID.Config["DisplayAllNearby"]) and
			#EID.descriptionsToPrint < EID.Config["MaxDescriptionsToDisplay"] then
			-- Searching for the closest describable entity to this player
			EID.lastDescriptionEntity = nil
			EID.lastDist = 10000
			local searchGroups = {}
			local sourcePos = player.Position
			local inRangeEntities = {}

			table.insert(searchGroups, Isaac.FindInRadius(sourcePos, tonumber(EID.Config["MaxDistance"])*40, searchPartitions))
			for k,_ in pairs(EID.effectList) do
				table.insert(searchGroups, Isaac.FindByType(EntityType.ENTITY_EFFECT, tonumber(k), -1, true, false))
			end

			for _, entitySearch in ipairs(searchGroups) do
				for _, entity in ipairs(entitySearch) do
					if EID:hasDescription(entity) and (entity.FrameCount > 0 or EID:getEntityData(entity, "EID_DescribeOnFirstFrame")) and not EID.entitiesToPrint[GetPtrHash(entity)] then
						table.insert(inRangeEntities, entity)
						local diff = entity.Position:__sub(sourcePos)
						-- break ties with the render offset (for Mega Chest double collectibles)
						local entityDataRenderOffset = EID:getEntityData(entity, "EID_RenderOffset")
						if diff:Length() == EID.lastDist and entityDataRenderOffset then
							diff = diff + entityDataRenderOffset
						end
						if diff:Length() < EID.lastDist then
							EID.lastDescriptionEntity = entity
							EID.lastDist = diff:Length()
						end
					end
				end
			end

			for _, gridEntity in pairs(EID.CurrentRoomGridEntities) do
				if EID:hasDescription(gridEntity) then
					table.insert(inRangeEntities, gridEntity)
					local diff = gridEntity.Position:__sub(sourcePos)
					if diff:Length() < EID.lastDist then
						EID.lastDescriptionEntity = gridEntity
						EID.lastDist = diff:Length()
					end
				end
			end

			if EID.Config["DisplayAllNearby"] then
				-- make the closest entity the first to get drawn
				table.insert(inRangeEntities, 1, EID.lastDescriptionEntity)
			else
				-- we only want to describe the closest entity
				inRangeEntities = { EID.lastDescriptionEntity }
			end
			-- Only display the indicator for the primary (closest / crafting) description
			if EID.lastDescriptionEntity and not EID.isShowingReminder then
				EID:renderIndicator(EID.lastDescriptionEntity, EID.controllerIndexes[player.ControllerIndex] or 1)
				table.insert(EID.CachedIndicators, {EID.lastDescriptionEntity, EID.controllerIndexes[player.ControllerIndex]})
			end

			for i,closest in ipairs(inRangeEntities) do
				if not EID:IsGridEntity(closest) then
					--Handle GetData Entities (specific)
					if EID.Config["EnableEntityDescriptions"] and EID:getEntityData(closest, "EID_Description") then
						
						local desc = EID:getEntityData(closest, "EID_Description")
						local origDesc = EID:getDescriptionObjByEntity(closest)
						if desc ~= nil and type(desc) == "table" then
							origDesc = EID:mergeDescriptionObjects(origDesc, desc)
						else
							origDesc.Description = desc
						end
						EID:addDescriptionToPrint(origDesc)

					-- Handle Glitched Items
					elseif closest.Type == 5 and closest.Variant == 100 and closest.SubType > 4294960000 then
						if EID:IsItemHidden(closest) then
							EID:addQuestionMarkDescription(closest)
						else
							local glitchedObj = EID:getDescriptionObj(closest.Type, closest.Variant, closest.SubType, closest)
							local glitchedDesc = EID:getXMLDescription(closest.Type, closest.Variant, closest.SubType)

							glitchedObj.Description = glitchedDesc
							EID:addDescriptionToPrint(glitchedObj)
						end
					-- Handle Dice Room Floor
					elseif closest.Type == 1000 and closest.Variant == 76 then
						EID:addDescriptionToPrint(EID:getDescriptionObj(closest.Type, closest.Variant, closest.SubType+1, closest))
					-- Handle Card Reading Portals
					elseif closest.Type == 1000 and closest.Variant == 161 and closest.SubType <= 2 then
						local subtypeToCard = {18, 5, 19}
						-- Reuse the descriptions of The Emperor/Stars/Moon, so no localization needed
						local descriptionObj = EID:getDescriptionObj(5, 300, subtypeToCard[closest.SubType+1], closest)
						-- Card Reading's name
						descriptionObj.Name = EID:getObjectName(5, 100, 660)
						-- Only keep the first line of the description (to avoid Tarot Cloth effects or Planetarium mention on The Stars)
						descriptionObj.Description = string.sub(descriptionObj.Description, 1, string.find(descriptionObj.Description, "#"))
						EID:addDescriptionToPrint(descriptionObj)
					--Handle Broken Shovel
					elseif closest.Type == 5 and closest.Variant == 110 then
						local descriptionObj = EID:getDescriptionObj(5, 100, 550, closest)
						EID:addDescriptionToPrint(descriptionObj)

					elseif closest.Variant == PickupVariant.PICKUP_TRINKET then
						--Handle Trinkets
						local descriptionObj = EID:getDescriptionObjByEntity(closest)

						if EID.isEditing then
							descriptionObj = EID:handleEditing(closest, descriptionObj)
						end

						EID:addDescriptionToPrint(descriptionObj)

					elseif closest.Variant == PickupVariant.PICKUP_COLLECTIBLE then
						--Handle Collectibles
						if EID:IsItemHidden(closest) then
							local isHideUncollected = EID.Config["HideUncollectedItemDescriptions"] and EID:requiredForCollectionPage(closest.SubType)
							local description = isHideUncollected and EID:getDescriptionEntry("CollectionPageInfo") or nil
							EID:addQuestionMarkDescription(closest, description)
						end
						local descriptionObj = EID:getDescriptionObjByEntity(closest)

						if EID.isEditing then
							descriptionObj = EID:handleEditing(closest, descriptionObj)
						end

						EID:addDescriptionToPrint(descriptionObj)

					elseif closest.Variant == PickupVariant.PICKUP_TAROTCARD then
						--Handle Cards & Runes
						if EID:getEntityData(closest, "EID_DontHide") ~= true then
							local isSoulstone = closest.SubType >= 81 and closest.SubType <= 97
							local hideinShop = closest:ToPickup():IsShopItem() and ((not isSoulstone and not EID.Config["DisplayCardInfoShop"]) or (isSoulstone and not EID.Config["DisplaySoulstoneInfoShop"]))
							local isOptionsSpawn = EID.isRepentance and not EID.Config["DisplayCardInfoOptions?"] and closest:ToPickup().OptionsPickupIndex > 0
							local obstructed = ((not isSoulstone and not EID.Config["DisplayObstructedCardInfo"]) or
							(not EID.Config["DisplayObstructedSoulstoneInfo"] and isSoulstone)) and
							(not pathsChecked[closest.InitSeed] and not attemptPathfind(closest))
							if isOptionsSpawn or hideinShop or obstructed then
								EID:addQuestionMarkDescription(closest)
							end
						end
						local isCantrippedCard = game.Challenge == 43 and closest.SubType > 32768
						if isCantrippedCard then
							local descriptionObj = EID:getDescriptionObj(5, 100, closest.SubType - 32768, closest)
							EID:addDescriptionToPrint(descriptionObj)
						else
							local descriptionObj = EID:getDescriptionObjByEntity(closest)
							
							if EID.isEditing then
								descriptionObj = EID:handleEditing(closest, descriptionObj)
							end

							EID:addDescriptionToPrint(descriptionObj)
						end

					elseif closest.Variant == PickupVariant.PICKUP_PILL then
						--Handle Pills
						if EID:getEntityData(closest, "EID_DontHide") ~= true then
							local hideinShop = closest:ToPickup():IsShopItem() and not EID.Config["DisplayPillInfoShop"]
							local isOptionsSpawn = EID.isRepentance and not EID.Config["DisplayPillInfoOptions?"] and closest:ToPickup().OptionsPickupIndex > 0
							local obstructed = not EID.Config["DisplayObstructedPillInfo"] and
							(not pathsChecked[closest.InitSeed] and not attemptPathfind(closest))
							if isOptionsSpawn or hideinShop or obstructed then
								EID:addQuestionMarkDescription(closest)
							end
						end

						local pillColor = closest.SubType
						local pool = game:GetItemPool()
						local identified = pool:IsPillIdentified(pillColor) and not EID.Config["OnlyShowPillWhenUsedAtLeastOnce"]
						if EID.isRepentance and pillColor % PillColor.PILL_GIANT_FLAG == PillColor.PILL_GOLD then identified = true end
						local pillEffectID = EID:getAdjustedSubtype(closest.Type, closest.Variant, pillColor)
						local wasUsed = EID:WasPillUsed(pillColor)

						if (identified or wasUsed or EID.Config["ShowUnidentifiedPillDescriptions"]) and not EID.UnidentifyablePillEffects[pillEffectID] then
							local descEntry = EID:getDescriptionObj(closest.Type, closest.Variant, pillColor, closest)
							
							if EID.isEditing then
								descEntry = EID:handleEditing(closest, descEntry)
							end
							
							EID:addDescriptionToPrint(descEntry)
						else
							EID:addDescriptionToPrint({ Description = "UnidentifiedPill", Entity = closest})
						end
					elseif EID.Config["EnableEntityDescriptions"] then
						--Handle Entities (omni)
						local descriptionEntry = EID:getDescriptionObjByEntity(closest)
						if descriptionEntry ~= nil then
							EID:addDescriptionToPrint(descriptionEntry)
						end
					end
				end
			end
		end
	end

	EID.isShowingReminder = false
	-- handle showing the Hold Map Helper description
	if EID.isSummaryPermanentlyOpen or (EID.Config["ItemReminderEnabled"] and EID.holdTabCounter >= 30 and EID.TabDescThisFrame == false and EID.holdTabPlayer ~= nil) then
		EID.isShowingReminder = true
		EID:ItemReminderHandleInputs()
		local demoDescObj = EID:getDescriptionObj(-999, -1, 1)
		demoDescObj.PermanentTextEnglish = EID:getDescriptionEntryEnglish("ItemReminder", "Title")
		-- check for scrolling being enabled here and append scroll controls to the title?
		demoDescObj.Description = EID:ItemReminderGetDescription()
		demoDescObj.Name = EID:ItemReminderGetTitle()
		if (demoDescObj.Description ~= "") then EID:addDescriptionToPrint(demoDescObj, 1) end
	end

	EID:printDescriptions()

	if EID.isEditing then
		EID:DrawLegend()
	end

	EID.wasEditing = EID.isEditing
end

EID:AddCallback(ModCallbacks.MC_POST_RENDER, EID.OnRender)


local function AddActiveItemProgress(player, isD4)
	EID.ForceRefreshCache = true
	local playerID = EID:getPlayerID(player, true)
	EID:InitItemInteractionIfAbsent(playerID)
	local activesTable = EID.PlayerItemInteractions[playerID].actives
	-- don't check pocket items after D4, they don't reroll and would get counted twice
	local maxSlot = 3
	if isD4 then maxSlot = 1 end
	for i = 0, maxSlot do
		local itemIDStr = tostring(player:GetActiveItem(i))
		if itemIDStr ~= "0" then
			EID:InitActiveItemInteraction(itemIDStr)
			activesTable[itemIDStr] = activesTable[itemIDStr] + 1
		end
	end
end

-- Check the active items of every player for transformation progress (used at game start and after Genesis)
local function CheckAllActiveItemProgress()
	for i = 0, game:GetNumPlayers() - 1 do
		AddActiveItemProgress(Isaac.GetPlayer(i))
	end
end

local function OnGameStartGeneral(_,isSave)
	EID:GetAllPassiveItems()
	EID.RecentlyTouchedItems = {}
	EID.OldestItemIndex = {}
	if not isSave then
		EID.PlayerItemInteractions = {}
	end
end
EID:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, OnGameStartGeneral)

local function OnPostPlayerInit()
	EID.ShouldCheckStartingItems = true -- for The Stars? tracking
end
EID:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, OnPostPlayerInit)

-- Watch for Glowing Hourglass to revert certain variables
local function OnUseGlowingHourglass(_, _, _, _)
	EID.absorbedItems = EID:CopyTable(preHourglassStatus.absorbedItems)
	EID.PlayerItemInteractions = EID:CopyTable(preHourglassStatus.PlayerItemInteractions)
end
EID:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, OnUseGlowingHourglass, CollectibleType.COLLECTIBLE_GLOWING_HOUR_GLASS)

local json = require("json")
local configIgnoreList = {
	["AbsorbedItems"] = true,
	["CollectedItems"] = true,
	["PlayerItemInteractions"] = true,
	["UsedPillColors"] = true,
	["RecentlyTouchedItems"] = true,
	["OldestItemIndex"] = true,
}
--------------------------------
--------Handle Savedata---------
--------------------------------
function EID:OnGameStart(isSave)
	--Loading Moddata--
	if EID:HasData() then
		local savedEIDConfig = json.decode(Isaac.LoadModData(EID))
		
		-- JSON saves integer table keys as strings. we need to transform them back... used in OnGameStart
		local function ConvertSavedTable(tableName)
			for playerID, data in pairs(savedEIDConfig[tableName] or {}) do
				local convertedData = {}
				if type(data) == "table" then
					for key, value in pairs(data) do
						convertedData[tonumber(key) or key] = value
					end
				else
					convertedData = data
				end
				EID[tableName][tonumber(playerID)] = convertedData
			end
		end
		
		-- collection progress
		EID.CollectedItems = savedEIDConfig["CollectedItems"] or {}
		if EID.SaveGame and savedEIDConfig["SaveGameNumber"] > 0 then
			for _, id in ipairs(EID.CollectedItems) do
				EID.SaveGame[savedEIDConfig["SaveGameNumber"]].ItemNeedsPickup[id] = nil
			end
		end
		EID.PlayerItemInteractions = {}
		if isSave then
			-- JSON saves integer table keys as strings. we need to transform them back...
			ConvertSavedTable("PlayerItemInteractions")
			ConvertSavedTable("RecentlyTouchedItems")
			ConvertSavedTable("OldestItemIndex")
		else
			-- check for the players' starting active items
			CheckAllActiveItemProgress()
		end
		EID.UsedPillColors = {}
		EID.absorbedItems = {}
		if isSave then
			EID.UsedPillColors = savedEIDConfig["UsedPillColors"] or {}
			EID.absorbedItems = savedEIDConfig["AbsorbedItems"] or {}
		end

		if isSave and savedEIDConfig["DescriptionData"] ~= nil then
			EID.descriptions = savedEIDConfig["DescriptionData"]
		end
		

		-- Check if eid_config.lua is in its default state (like if an EID update occurred)
		-- If it is, or MCM is loaded, load the config from savedata instead of eid_config.lua
		if savedEIDConfig.Version == EID.Config.Version then
			local isDefaultConfig = true
			for key, value in pairs(EID.Config) do
				if type(value) ~= type(EID.DefaultConfig[key]) and not configIgnoreList[key] then
					print("EID Warning! : Config value '"..key.."' has wrong data-type. Resetting it to default...")
					EID.Config[key] = EID.DefaultConfig[key]
				end
				if EID.DefaultConfig[key] ~= value then
					isDefaultConfig = false
				end
			end
			if isDefaultConfig or EID.MCMLoaded then
				for key, value in pairs(EID.Config) do
					if savedEIDConfig[key] ~= nil and type(value) == type(savedEIDConfig[key]) then
						EID.Config[key] = savedEIDConfig[key]
					end
				end
			end
		end
		EID.isHidden = EID.Config["InitiallyHidden"]
		EID.UsedPosition = Vector(EID.Config["XPosition"], EID.Config["YPosition"])
		EID.Scale = EID.Config["Size"]
		EID.ItemReminderSelectedCategory = EID.Config["ItemReminderDisplayMode"] == "NoOverview" and 1 or 0
		
		EID:fixDefinedFont()
		EID:loadFont(EID.modPath .. "resources/font/eid_"..EID.Config["FontType"]..".fnt")
	end
end
EID:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, EID.OnGameStart)

--Saving Moddata--
function EID:OnGameExit()
	EID.Config["CollectedItems"] = EID.CollectedItems
	EID.Config["PlayerItemInteractions"] = EID.PlayerItemInteractions or {}
	EID.Config["RecentlyTouchedItems"] = EID.RecentlyTouchedItems or {}
	EID.Config["UsedPillColors"] = EID.UsedPillColors
	EID.Config["AbsorbedItems"] = EID.absorbedItems or {}
	EID.Config["OldestItemIndex"] = EID.OldestItemIndex or {}

	EID.SaveData(EID, json.encode(EID.Config))
	EID.isEditing = false
	EID:hidePermanentText()
	EID.itemUnlockStates = {}
	EID.itemAvailableStates = {}
end
EID:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, EID.OnGameExit)

if EID.enableDebug then
	require("features.eid_debugging")
end

-- load repentogon stuff last to allow overrides of functions
require("features.eid_repentogon")

Isaac.DebugString("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
Isaac.DebugString("Manual Item Descriptions v"..EID.ModVersion.."_"..EID.ModVersionCommit.." loaded.")
Isaac.DebugString("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

print("Manual Item Descriptions v"..EID.ModVersion.."_"..EID.ModVersionCommit.." loaded.")
