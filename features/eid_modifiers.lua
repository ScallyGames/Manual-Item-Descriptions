local game = Game()

EID.TabPreviewID = 0
-- Modifiers switching the previewed description can cause infinite loops or undesired text, use this to help prevent it
EID.inModifierPreview = false
-- The "Item Reminder" needs to know if it shouldn't display because we're in a Hold Tab desc
EID.TabDescThisFrame = false
-- Some modifiers (e.g. Glitched Crown) want to know if Tab was pressed/released, rather than held
EID.TabHeldThisFrame = false
EID.TabHeldLastFrame = false
function EID:TabPressed() return EID.TabHeldThisFrame and not EID.TabHeldLastFrame end
function EID:TabReleased() return EID.TabHeldLastFrame and not EID.TabHeldThisFrame end

-- List of collectible IDs for us to check if a player owns them; feel free to add to this in mods that add description modifiers!
EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_VOID] = true
EID.collectiblesToCheck["5.300.41"] = true -- Black Rune
local maxSlot = 1
-- Repentance modifiers
if EID.isRepentance then
	maxSlot = 3
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_BOOK_OF_VIRTUES] = true
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_MOMS_BOX] = true
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_BLANK_CARD] = true
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_CLEAR_RUNE] = true
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_PLACEBO] = true
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_FALSE_PHD] = true
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_FLIP] = true
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_GLOWING_HOUR_GLASS] = true
	EID.collectiblesToCheck[CollectibleType.COLLECTIBLE_GLITCHED_CROWN] = true
end
EID.collectiblesOwned = {}
EID.collectiblesAbsorbed = {}

EID.LastCollectibleCheck = 0
function EID:CheckPlayersCollectibles()
	-- recheck the players' owned collectibles periodically, not every frame
	-- (has to be checked regularly due to mechanics like D4 / Tainted Eden)
	if EID.GameUpdateCount >= EID.LastCollectibleCheck + 15 then
		EID.LastCollectibleCheck = EID.GameUpdateCount
		for v,_ in pairs(EID.collectiblesToCheck) do
			EID.collectiblesOwned[v] = false
			EID.collectiblesAbsorbed[v] = false
			-- Check for any player having the item, set collectiblesOwned to that player's ID
			local result, player, playerNum = EID:PlayersHaveItem(v)
			if result then EID.collectiblesOwned[v] = playerNum
			-- Check for the item being inside a player's Void if it's a collectible
			-- note: currently Absorb checks are only done as a backup, will always be false if it's owned legitimately
			elseif type(v) == "number" then
				result, player, playerNum = EID:PlayersVoidedCollectible(v)
				if result then EID.collectiblesAbsorbed[v] = playerNum end
			end
		end
	end
end

-- Handle description changes that occur while holding Map
local function TabCallback(descObj)
	if EID.TabPreviewID == 0 then return descObj end
	EID.TabDescThisFrame = true

	EID.inModifierPreview = true
	local descEntry = EID:getDescriptionObj(5, 100, EID.TabPreviewID)
	EID.inModifierPreview = false
	descEntry.Entity = descObj.Entity
	EID.TabPreviewID = 0
	return descEntry
end

-- Map each text block of Pandora's Box to the AbsoluteStage number. Second entry is the block used for Alt-Stages
local pandoraStages = {
	[1] = { 1, 1 }, -- B1
	[2] = { 2, 2 }, -- B2
	[3] = { 3, 3 }, -- C1
	[4] = { 4, 4 }, -- C2
	[5] = { 5, 5 }, -- D1
	[6] = { 6, 6 }, -- D2
	[7] = { 7, 7 }, -- W1
	[8] = { 8, 8 }, -- W2
	[9] = { 9, 9 }, -- ???
	[10] = { 10, 11 }, -- Sheol, Cathedral
	[11] = { 12, 13 }, -- Dark Room, Chest
	[12] = { 9, 9 }, -- Void
	[13] = { 14, 14 }, -- Home
}
local pandoraGreedStages = {
	[1] = { 2, 2, 1 }, -- Basement
	[2] = { 4, 4, 2 }, -- Cellar
	[3] = { 6, 6, 3 }, -- Depths
	[4] = { 8, 8, 4 }, -- Womb
	[5] = { 10, 10, 5 }, -- Sheol
	[6] = { 13, 13, 6 }, -- Shop
	[7] = { 13, 13, 6 }, -- Chest
}

local function PandorasBoxCallback(descObj)
	local hasModifier = game:IsGreedMode() and EID:getDescriptionEntry("ConditionalDescs", "5.100.297 (Greed)", true)

	local level = game:GetLevel()
	local stageNum = game:IsGreedMode() and level:GetStage() or level:GetAbsoluteStage()

	local stageTable = game:IsGreedMode() and pandoraGreedStages or pandoraStages
	local textBlockToUse = stageTable[stageNum][hasModifier and 3 or level:IsAltStage() and 2 or 1]

	-- floor result information must be separated by line breaks or semicolons in localizations
	local levelDescriptions = {}
	local hasVoidEntry = false
	for lvlDesc in string.gmatch(descObj.Description, "([^#;]+)") do
		table.insert(levelDescriptions, lvlDesc)
		if lvlDesc:find("???") then
			hasVoidEntry = true
		end
	end

	-- Some languages are missing the ???/Void entry or more. We account for that
	if not hasVoidEntry and not hasModifier then
		-- void entry is supposed to be highlighted, but its missing, or the description is lacking multiple entries
		if textBlockToUse == 9 or (#levelDescriptions < 15 and textBlockToUse > 9) then
			return descObj
		end
		-- void entry is missing and a later entry should be highlighted. We adjust the id accordingly
		if textBlockToUse > 9 then
			textBlockToUse = textBlockToUse - 1
		end
	end

	-- look up the line to highlight. skip the first 2 lines, because they are generic item infos
	local textBlockToHighlight = levelDescriptions[textBlockToUse + 2]
	if textBlockToHighlight then
		-- Escape the content of the string, because gsub() expects pattern definitions
		local clearedTextBlock = string.gsub(textBlockToHighlight, "%p", "%%%0")
		local replacementText = "{{ColorBagComplete}}" .. textBlockToHighlight .. "{{CR}}"
		descObj.Description = string.gsub(descObj.Description, clearedTextBlock, replacementText)
	end

	return descObj
end

-- Handle Item Collection description addition
local function ItemCollectionPageCallback(descObj)
	descObj.Name = "{{"..EID.Config["ItemCollectionColor"].."}}"..descObj.Name
	local text = EID:getDescriptionEntry("CollectionPageInfo")

	EID:appendToDescription(descObj, "#{{Warning}} "..text)
	return descObj
end

-- Handle dynamic Luck chance modifiers
local function LuckChanceCallback(descObj)
	for i = 1,#EID.coopAllPlayers do
		local player = EID.coopAllPlayers[i]
		if player.Luck ~= 0 then
			local playerType = player:GetPlayerType()
			
			local result = math.max(math.min(EID.LuckFormulas[descObj.fullItemString](player.Luck), 100), 0)
			local luckLine = EID:getDescriptionEntry("LuckModifier")
			luckLine = EID:ReplaceVariableStr(luckLine, 1, string.format("%.3g", result))
			luckLine = EID:ReplaceVariableStr(luckLine, 2, "{{BlinkGreen}}" .. string.format("%.3g", player.Luck) .. "{{CR}}")
			
			if #EID.coopAllPlayers == 1 then EID:appendToDescription(descObj, "#{{Luck}} ")
			else EID:appendToDescription(descObj, "#" .. EID:GetPlayerIcon(playerType, "P" .. i .. ":") .. " ") end
			EID:appendToDescription(descObj, "{{NoLB}}" .. luckLine)
		end
	end
	return descObj
end

if EID.isRepentance then
	local hasBox = false
	local isGolden = false

	-- Handle Golden Trinket / Mom's Box description addition
	local function GoldenTrinketCallback(descObj)
		local trinketID = descObj.ObjSubType % TrinketType.TRINKET_GOLDEN_FLAG
		local data = EID:getDescriptionEntry("goldenTrinketData", trinketID) or EID.GoldenTrinketData[trinketID]
		local multiplier = 2
		local textChoice = 1
		if isGolden and hasBox then
			multiplier = 3
			textChoice = 3
		elseif hasBox then
			textChoice = 2
		end
		local count = 0

		if data then
			if type(data) == "number" then data = {t={data}} end
			if data.goldenOnly and not isGolden then return descObj end

			--custom multipliers (either manually defined, or just changing the max multiplier
			if data.mults then
				if isGolden and hasBox then multiplier = data.mults[2]
				else multiplier = data.mults[1] end
			elseif data.mult and ((isGolden and hasBox) or data.mult < 2) then multiplier = data.mult end

			--replacing numeric text based on our multiplier
			if (data.t) then
				for _,v in ipairs(data.t) do
					count = 0
					--"%d*%.?%d+" will grab every number group (1, 10, 0.5), this will allow us to not replace the "1" in "10" erroneously
					descObj.Description = string.gsub(descObj.Description, "%d*%.?%d+", function(s)
						if (s == tostring(v) and count == 0) then
							count = count + 1
							if v == 17 then
								if multiplier == 2 then v = 16.5
								elseif multiplier == 3 then v = (1/6)*100 end -- convert 17% to 33% or 50%
							elseif v == 33 and (multiplier == 1.5 or multiplier == 3) then v = (1/3)*100 end -- convert 33% to 50% or 100%
							return "{{ColorGold}}" .. string.format("%.4g",v*multiplier) .. "{{CR}}"
						end
					end)
				end
			end
			--replacing a phrase, such as "half a heart"
			if data.findReplace then
				local textTable = EID:getDescriptionEntry("goldenTrinketEffects", trinketID)
				if textTable then
					descObj.Description, count = string.gsub(descObj.Description, textTable[1], "{{ColorGold}}" .. textTable[multiplier] .. "{{ColorText}}", 1)
				end
			end
			--append some new text to the description
			if data.append then
				local textTable = EID:getDescriptionEntry("goldenTrinketEffects", trinketID)
				if textTable then
					textChoice = math.min(textChoice, #textTable) -- some items have only 1 append description
					if textTable[textChoice] ~= "" then
						descObj.Description = descObj.Description .. "#{{ColorGold}}" .. textTable[textChoice]
						count = 1
					end
				end
			end
			--the nuclear option: replacing the entire description; 1 = Gold, 2 = Mom's Box, 3 = Both
			--only replace if the chosen language has defined it
			if data.fullReplace then
				local textTable = EID:getDescriptionEntry("goldenTrinketEffects", trinketID, true)
				if (textTable) then
					textChoice = math.min(textChoice, #textTable)
					descObj.Description = textTable[textChoice]
					count = 1
				end
			end
			-- we didn't replace everything; maybe the language didn't have the number? append a simple "effect is doubled/tripled"
			if count == 0 and multiplier > 1 then
				local goldenDesc = EID:getDescriptionEntry("goldenTrinket") or ""
				if multiplier == 3 then goldenDesc = EID:getDescriptionEntry("tripledTrinket") or ""
				elseif multiplier == 4 then goldenDesc = EID:getDescriptionEntry("quadrupledTrinket") end
				descObj.Description = descObj.Description .. "#" .. "{{ColorGold}}"..goldenDesc
			end
		end
		return descObj
	end
	
	local function VariableCharge(descObj, metadata, collID, chargeText)
		local text = EID:getDescriptionEntry(chargeText or "VariableCharge")
		if text ~= nil and metadata ~= nil and metadata.mimiccharge and metadata.mimiccharge ~= -1 then
			text = EID:ReplaceVariableStr(text, 1, "{{NameOnlyC" .. collID .. "}}")
			EID:appendToDescription(descObj, "#{{ColorSilver}}{{Collectible" .. collID .. "}} " .. text .. " {{"..metadata.mimiccharge.."}}{{Battery}}")
		end
	end
	
	-- Handle Placebo description addition
	local function PlaceboCallback(descObj)
		local adjustedID = EID:getAdjustedSubtype(descObj.ObjType, descObj.ObjVariant, descObj.ObjSubType)
		VariableCharge(descObj, EID.pillMetadata[adjustedID-1], 348, "PlaceboCharge")
		return descObj
	end
	
	-- Handle Experimental Pill description addition
	local function ExperimentalPillCallback(descObj)
		local adjustedID = EID:getAdjustedSubtype(descObj.ObjType, descObj.ObjVariant, descObj.ObjSubType)
		if adjustedID - 1 ~= PillEffect.PILLEFFECT_EXPERIMENTAL then return descObj end
		local horse = descObj.ObjSubType > 2048

		for i = 1,#EID.coopAllPlayers do
			local player = EID.coopAllPlayers[i]
			local playerType = player:GetPlayerType()
			local pillModifierID = 0
			local goodAndBad = false
			
			-- Check for PHD, Lucky Foot, Virgo, and False PHD
			if player:HasCollectible(75) then pillModifierID = 75
			elseif player:HasCollectible(46) then pillModifierID = 46
			elseif player:HasCollectible(303) then pillModifierID = 303
			end
			-- Check for False PHD, and if we have good AND bad pills, just print the damage up text
			if player:HasCollectible(654) then
				if pillModifierID ~= 0 then goodAndBad = true end
				pillModifierID = 654
			end
			if pillModifierID ~= 0 then
				local expPillString = ""
				if pillModifierID == 654 then
					local damageUpString = ""
					if horse then damageUpString = EID:getDescriptionEntry("FalsePHDHorseDamage")
					else damageUpString = EID:getDescriptionEntry("FalsePHDDamage") end
					if goodAndBad then
						expPillString = damageUpString
					else
						expPillString = EID:getDescriptionEntry("ExperimentalPillFalsePHD") .. "#{{Collectible654}} " .. damageUpString
					end
				else expPillString = EID:getDescriptionEntry("ExperimentalPillPHD") end
				EID:appendToDescription(descObj, "#")
				if #EID.coopAllPlayers > 1 then EID:appendToDescription(descObj,  EID:GetPlayerIcon(playerType, "P" .. i .. ":")) end
				EID:appendToDescription(descObj, "{{Collectible" .. pillModifierID .. "}} " .. expPillString)
			end
		end
		return descObj
	end

	-- Handle False PHD description addition
	local function FalsePHDCallback(descObj)
		local adjustedID = EID:getAdjustedSubtype(descObj.ObjType, descObj.ObjVariant, descObj.ObjSubType)
		local horse = descObj.ObjSubType > 2048
		local data = EID.pillMetadata[adjustedID-1]
		if data ~= nil then
			local damageUp = string.find(data.class,"3") and string.find(data.class,"-")
			if adjustedID-1 == PillEffect.PILLEFFECT_SHOT_SPEED_DOWN then damageUp = true end
			-- why doesn't I'm Excited have a - in the xml data yet spawn a black heart...
			local blackHeart = (string.find(data.class,"2") or string.find(data.class,"1")) and (string.find(data.class,"-") or adjustedID-1 == PillEffect.PILLEFFECT_IM_EXCITED)
			local text = ""
			if damageUp and horse then text = EID:getDescriptionEntry("FalsePHDHorseDamage")
			elseif damageUp then text = EID:getDescriptionEntry("FalsePHDDamage")
			elseif blackHeart then text = EID:getDescriptionEntry("FalsePHDHeart") end
			if text ~= "" then
				local iconStr = "#{{Collectible654}} "
				EID:appendToDescription(descObj, iconStr..text)
			end
		end
		return descObj
	end

	-- Handle co-op players seeing different pill effects
	local function CoopPillCallback(descObj)
		-- Don't do this check when holding Tab for pill effects
		if not descObj.Entity then return descObj end
		local printedDescs = { [descObj.Name] = true }

		for i = 1,#EID.coopAllPlayers do
			local player = EID.coopAllPlayers[i]
			EID.pillPlayer = player
			local playerID = player:GetPlayerType()
			-- Regrab the pill description object with this player
			local pillObj = EID:getDescriptionObjByEntity(descObj.Entity)

			-- only print a given pill description once, even if it affects multiple players
			-- if it's 4P co-op and P1 has PHD, and P2/P3/P4 all get same effect, no one wants to see that 3 times
			if not printedDescs[pillObj.Name] then
				-- new pill effect to print
				printedDescs[pillObj.Name] = true
				EID:appendToDescription(descObj, "#" .. EID:GetPlayerIcon(playerID, "P" .. i .. ":") .." {{ColorObjName}}"..pillObj.Name .."{{CR}}#"..pillObj.Description)
			end
		end
		EID.pillPlayer = nil
		return descObj
	end


	--------------------------------
	-- Although individual conditions/callbacks work well for mods to be able to add through the API,
	-- As we kept adding callbacks for vanilla items, a lot of code got repeated over and over
	-- This one-condition setup fixes that and can only help performance
	-- It also allows us to pick the order that modifiers are appended to descriptions (stats/effects first, then reroll/flip/recharge info)

	-- REPENTANCE-ONLY MODIFIERS
	local function EIDConditions(descObj)
		-- currently, only pickup descriptions have modifiers
		if descObj.ObjType ~= 5 then return false end

		EID:CheckPlayersCollectibles()

		local callbacks = {}

		-- Collectible Pedestal Callbacks
		if descObj.ObjVariant == PickupVariant.PICKUP_COLLECTIBLE then
			-- Using magic numbers here in case it's slightly faster, and because the callback names give context
			
		-- Card / Rune Callbacks
		elseif descObj.ObjVariant == PickupVariant.PICKUP_TAROTCARD then
		-- Pill Callbacks
		elseif descObj.ObjVariant == PickupVariant.PICKUP_PILL then
			if EID.collectiblesOwned[654] then table.insert(callbacks, FalsePHDCallback) end
			if EID.collectiblesOwned[348] then table.insert(callbacks, PlaceboCallback) end
			table.insert(callbacks, ExperimentalPillCallback)

			if EID.pillPlayer == nil and #EID.coopAllPlayers > 1 then
				table.insert(callbacks, CoopPillCallback)
			end
		-- Trinket Callbacks
		elseif descObj.ObjVariant == PickupVariant.PICKUP_TRINKET then
			-- Golden Trinket / Mom's Box
			isGolden = ((descObj.ObjSubType & TrinketType.TRINKET_GOLDEN_FLAG) == TrinketType.TRINKET_GOLDEN_FLAG)
			hasBox = EID.collectiblesOwned[439]
			if isGolden or hasBox then table.insert(callbacks, GoldenTrinketCallback) end
		end

		return callbacks
	end
	EID:addDescriptionModifier("EID Repentance", EIDConditions, nil)

end

-- AFTERBIRTH+ OR REPENTANCE MODIFIERS
local function EIDConditionsAB(descObj)
	-- currently, only pickup descriptions have modifiers
	if descObj.ObjType ~= 5 then return false end

	EID:CheckPlayersCollectibles()

	local callbacks = {}

	if EID.LuckFormulas[descObj.fullItemString] then table.insert(callbacks, LuckChanceCallback) end
	-- Collectible Pedestal Callbacks
	if descObj.ObjVariant == PickupVariant.PICKUP_COLLECTIBLE then
		if EID.Config["ItemCollectionIndicator"] and EID:requiredForCollectionPage(descObj.ObjSubType) then table.insert(callbacks, ItemCollectionPageCallback) end

		if descObj.ObjSubType == 297 then table.insert(callbacks, PandorasBoxCallback) end
	end
	return callbacks
end
EID:addDescriptionModifier("EID Afterbirth+", EIDConditionsAB, nil, 1)

-- should this be done differently so that mods can add tab previews? (tab conditions is done last, but would be done before callbacks mods add, maybe tab should be checked in EID:getDescriptionObj
local function TabConditions(_)
	if EID.TabHeldThisFrame and not EID.inModifierPreview then return true end
	EID.TabPreviewID = 0
	return false
end
EID:addDescriptionModifier("EID Tab Previews", TabConditions, TabCallback)

-- If an item has a radically different effect for 2 players, show the effect for the closest player, then append what chars have a different effect here
-- This is the final change made to the desc, after all other conditionals and modifiers
local function CoopDifferentEffectCallback(descObj)
	local displayedChars = {}
	local differentEffectText = EID:getDescriptionEntry("ConditionalDescs", "Different Effect")
	for _,v in ipairs(EID.DifferentEffectPlayers) do
		if not displayedChars[v] then
			descObj.Description = descObj.Description .. "#" .. EID:GetPlayerIcon(v) .. " " .. EID:ReplaceVariableStr(differentEffectText, EID:getPlayerName(v))
		end
		displayedChars[v] = true
	end
	EID.DifferentEffectPlayers = {} -- avoid appending this twice
	return descObj
end
local function CoopDifferentEffectConditions(_)
	return #EID.DifferentEffectPlayers > 0
end
EID:addDescriptionModifier("EID Different Effect Players", CoopDifferentEffectConditions, CoopDifferentEffectCallback)
