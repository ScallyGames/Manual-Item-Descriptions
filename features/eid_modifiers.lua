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

-- Handle Void
local voidStatUps = { 0.2, 0.5, 1, 0.5, 0.2, 1 }
local voidStatIcons = {"{{Speed}}", "{{Tears}}", "{{Damage}}", "{{Range}}", "{{Shotspeed}}", "{{Luck}}"}
if EID.isRepentance then voidStatUps[4] = 2.5 end
local lastVoidCheck = -30
EID.VoidStatIncreases = {{},{},{}}
EID.BlackRuneStatIncreases = {{},{},{}}
EID.VoidOptionIndexes = {}

local function VoidCallback(descObj, isRune)
	if EID.InsideItemReminder then return descObj end
	-- Recheck RNG periodically (picking up passive collectibles will change the Void results without any easy trigger to track)
	-- Do both Void and Rune here since they could both be requested in the same frame
	if EID.GameUpdateCount >= lastVoidCheck + 30 or EID.RecheckVoid then
		EID:VoidRoomCheck()
		if EID.collectiblesOwned[477] then EID:VoidRNGCheck(Isaac.GetPlayer(EID.collectiblesOwned[477]), false) end
		if EID.collectiblesOwned["5.300.41"] then EID:VoidRNGCheck(Isaac.GetPlayer(EID.collectiblesOwned["5.300.41"]), true) end
		lastVoidCheck = EID.GameUpdateCount
		EID.RecheckVoid = false
	end

	local prefix = (isRune and "{{Card41}} ") or "{{Collectible477}} "
	local pickup = descObj.Entity and descObj.Entity:ToPickup()
	local isAltOption = false
	local shopItem = pickup and pickup:IsShopItem()
	-- Test if this is an Option pedestal, Repentance only absorbs the lowest index one
	-- (Don't check for options if it's a shop item, e.g. Tainted Keeper choice pedestals)
	if EID.isRepentance and not shopItem then
		local optionIndex = pickup and pickup.OptionsPickupIndex
		local firstOption = EID.VoidOptionIndexes[optionIndex]
		if (optionIndex and optionIndex ~= 0 and firstOption and descObj.ObjSubType ~= firstOption) then
			EID:appendToDescription(descObj, "#" .. prefix .. "{{NameC"..firstOption.."}}" .. EID:getDescriptionEntry("VoidOptionText"))
			isAltOption = true
		end
	end
	-- Print Stat up info if Black Rune or non-active item
	if isRune or EID.itemConfig:GetCollectible(descObj.ObjSubType).Type ~= 3 then
		-- Afterbirth+ really can't do anything with Void and a shop item, so just return
		if (not EID.isRepentance and shopItem) then return descObj end

		local voidIntro = ((shopItem or isAltOption) and EID:getDescriptionEntry("VoidShopText")) or EID:getDescriptionEntry("VoidText")
		local voidNames = EID:getDescriptionEntry("VoidNames")

		local eidTable = (isRune and EID.BlackRuneStatIncreases) or EID.VoidStatIncreases
		local increases = ((isAltOption or not descObj.Entity) and eidTable[3]) or (shopItem and eidTable[2]) or eidTable[1]

		EID:appendToDescription(descObj, "#" .. prefix .. voidIntro .. "#")
		for i,v in ipairs(increases) do
			if v > 0 then
				local statIncreaseStr = "↑ " .. voidStatIcons[i] .. " " .. voidNames[i] .. "#"
				local replaceCount = 0
				statIncreaseStr, replaceCount = EID:ReplaceVariableStr(statIncreaseStr, 1, "+" .. string.format("%.4g",v*voidStatUps[i]))
				if replaceCount == 0 then statIncreaseStr = "↑ " .. voidStatIcons[i] .. " +" .. string.format("%.4g",v*voidStatUps[i]) .. " " .. voidNames[i] .. "#" end
				EID:appendToDescription(descObj, statIncreaseStr)
			end
		end
	-- Print unique synergies with Void and Active Items
	elseif not isRune then

	end
	return descObj
end

local function BlackRuneCallback(descObj)
	return VoidCallback(descObj, true)
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


-- Handle Black Feather dynamic damage up text
local function BlackFeatherCallback(descObj)
	for i = 1,#EID.coopAllPlayers do
		local player = EID.coopAllPlayers[i]
		local playerType = player:GetPlayerType()
		
		local itemCounter = 0
		for itemID, _ in pairs(EID.blackFeatherItems) do
			itemCounter = itemCounter + player:GetCollectibleNum(itemID)
		end
		for trinketID, _ in pairs(EID.blackFeatherTrinkets) do
			if EID.isRepentance then
				itemCounter = itemCounter + player:GetTrinketMultiplier(trinketID)
			else
				if player:HasTrinket(trinketID) then itemCounter = itemCounter + 1 end
			end
		end
		
		local hasBox = player:HasCollectible(439)
		local isGolden = EID.isRepentance and ((descObj.ObjSubType & TrinketType.TRINKET_GOLDEN_FLAG) == TrinketType.TRINKET_GOLDEN_FLAG)
		local base = EID.isRepentance and 0.5 or 0.2
		local damageMultiplied = base * itemCounter * (hasBox and 2 or 1) * (isGolden and 2 or 1)
		local dmgColor = itemCounter == 0 and "CR" or (hasBox or isGolden) and "ColorGold" or "BlinkGray"

		local description = EID:getDescriptionEntry("BlackFeatherInformation")
		description, _ = EID:ReplaceVariableStr(description, 1, tostring(itemCounter))
		description, _ =  EID:ReplaceVariableStr(description, 2, "{{"..dmgColor.."}}"..damageMultiplied.."{{CR}}")
		if #EID.coopAllPlayers > 1 then description =  EID:GetPlayerIcon(playerType, "P" .. i .. ":") .. " " .. description end
		
		EID:appendToDescription(descObj, "#"..description)
	end
	return descObj
end

-- Handle VURP description addition
local function VurpCallback(descObj)
	local adjustedID = EID:getAdjustedSubtype(descObj.ObjType, descObj.ObjVariant, descObj.ObjSubType)
	if adjustedID - 1 ~= PillEffect.PILLEFFECT_VURP then return descObj end

	for i = 1,#EID.coopAllPlayers do
		local player = EID.coopAllPlayers[i]
		local playerID = EID:getPlayerID(player, true)
		local playerType = player:GetPlayerType()
		local pickupHistory = EID.PlayerItemInteractions[playerID].pickupHistory
		if pickupHistory then
			local lastUsedPill = PillEffect.PILLEFFECT_VURP + 1
			local lastUsedPillColor = 1
			local j = 1
			while (j <= #pickupHistory) do
				local entry = pickupHistory[j]
				-- ignore the pill if the pill color is Golden
				if entry[1] == "pill" and entry[2] % 2048 ~= 14 then
					lastUsedPill = entry[3]
					lastUsedPillColor = entry[2]
					break
				end
				j = j + 1
			end
			local tableName = EID:getTableName(descObj.ObjType, descObj.ObjVariant, descObj.ObjSubType)
			local name = EID:getPillName(lastUsedPill, tableName == "horsepills")
			if #EID.coopAllPlayers == 1 then EID:appendToDescription(descObj, "#{{Pill" .. lastUsedPillColor .. "}}")
			else EID:appendToDescription(descObj, "#" .. EID:GetPlayerIcon(playerType, "P" .. i .. ":")) end
			EID:appendToDescription(descObj, " {{ColorPill}}" .. name)
		end
	end
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

-- Handle changing health up text for non-red HP players
local function HealthUpCallback(descObj)
	if not EID.Config["DynamicHealthUps"] then return descObj end
	local adjustedSubtype = EID:getAdjustedSubtype(descObj.ObjType, descObj.ObjVariant, descObj.ObjSubType)
	if descObj.ObjVariant == 70 and descObj.ObjSubType > 2048 then adjustedSubtype = adjustedSubtype + 2048 end -- horsepill exception
	local typeVarSub = descObj.ObjType.."."..descObj.ObjVariant.."."..adjustedSubtype
	
	local closestPlayer = EID:ClosestPlayerTo(descObj.Entity)
	local playerType = closestPlayer:GetPlayerType()
	local heartType = EID.CharacterToHeartType[playerType] or "Red"
	if heartType ~= "Red" then
		-- find/replace Health Up lines
		local numHearts = EID.HealthUpData[typeVarSub] or 1
		local text = EID:getDescriptionEntry("RedToX", "Red to " .. heartType)
		local plural = ""; if numHearts ~= 1 and numHearts ~= -1 then plural = EID:getDescriptionEntry("Pluralize") end
		
		local pos = 1
		while pos <= #text do
			-- replace {1} with the number of hearts and {2} with the plural character
			local toFind = EID:ReplaceVariableStr(text[pos], {numHearts, plural})
			if text[pos + 1] then
				local replaceWith = EID:ReplaceVariableStr(text[pos + 1], {numHearts, plural})
				descObj.Description = EID:SimpleReplace(descObj.Description, tostring(toFind), replaceWith, 1)
			end
			pos = pos + 2
		end
		
		-- remove HealingRed lines entirely for Soul/Black/None health chars
		descObj.Description = descObj.Description .. "#" -- gsub finds final lines better if the desc ends with a line break
		if EID.HealthTypesWithoutHealing[heartType] then
			-- Find any lines containing {{HealingRed}} or {{HealingHalfRed}} and remove the line
			descObj.Description = descObj.Description:gsub("{{HealingRed}}(.-)#", "")
			descObj.Description = descObj.Description:gsub("{{HealingHalfRed}}(.-)#", "")
		end
		
		-- check if we just made the description blank
		if descObj.Description:gsub("#", "") == "" then
			local noEffectStr = EID:getDescriptionEntry("ConditionalDescs", "No Effect")
			descObj.Description = EID:GetPlayerIcon(playerType) .. " " .. EID:ReplaceVariableStr(noEffectStr, EID:getPlayerName(playerType))
		end
	end
	
	-- test the other players for if they have a different effect
	-- todo: this simple check could have false positives (i.e. Yum Heart is identical for Soul and Black, but this thinks they'll be different)
	for i = 1, #EID.coopAllPlayers do
		local t = EID.coopAllPlayers[i]:GetPlayerType()
		local playerHeartType = EID.CharacterToHeartType[t] or "Red"
		if playerHeartType ~= heartType then
			table.insert(EID.DifferentEffectPlayers, t)
		end
	end
	
	return descObj
end

-- Handle Single use Item description add-on
local function SingleUseCallback(descObj)
	local infoText = EID:getDescriptionEntry("SingleUseInfo")
	descObj.Description = infoText .. "#" .. descObj.Description

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
	
	-- Handle Wild Card description addition
	local function WildCardCallback(descObj)
		for i = 1,#EID.coopAllPlayers do
			local player = EID.coopAllPlayers[i]
			local playerID = EID:getPlayerID(player, true)
			local playerType = player:GetPlayerType()
			if EID.WildCardEffects[playerID] then
				EID:appendToDescription(descObj, "#")
				
				if #EID.coopAllPlayers > 1 then EID:appendToDescription(descObj, EID:GetPlayerIcon(playerType, "P" .. i .. ":") .. " ") end
				if EID.WildCardPillColor[playerID] then -- show the correct pill color; unnecessary attention to detail but why not
					EID:appendToDescription(descObj, "{{Pill" .. EID.WildCardPillColor[playerID] .. "}} {{NameOnly" .. EID.WildCardEffects[playerID] .. "}}")
				else EID:appendToDescription(descObj, "{{Name" .. EID.WildCardEffects[playerID] .. "}}") end
			end
		end
		return descObj
	end
	
	-- Handle The Stars? description addition
	local function TheStarsCallback(descObj)
		EID:UpdateAllPlayerPassiveItems()
		local modified = false
		for i = 1,#EID.coopAllPlayers do
			local player = EID.coopAllPlayers[i]
			local playerID = EID:getPlayerID(player, true)
			local playerType = player:GetPlayerType()
			if EID.OldestItemIndex[playerID] and EID.RecentlyTouchedItems[playerID] then
				local repetitions = player:HasCollectible(451) and 2 or 1 -- Tarot Cloth removes 2 items
				for indexOffset = 0, repetitions - 1 do
					local oldestItem = EID.RecentlyTouchedItems[playerID][EID.OldestItemIndex[playerID] + indexOffset]
					if oldestItem then
						-- when inside the item reminder's overview, wipe the description before appending the results
						if EID.InsideSpecialDescriptions and not modified then
							descObj.Description = ""
							modified = true
						end
						EID:appendToDescription(descObj, "#")
						if #EID.coopAllPlayers > 1 then EID:appendToDescription(descObj, EID:GetPlayerIcon(playerType, "P" .. i .. ":") .. " ") end
						EID:appendToDescription(descObj, "{{NameC" .. oldestItem .. "}}")
					end
				end
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
			if descObj.ObjSubType == 80 then table.insert(callbacks, WildCardCallback) end
			if descObj.ObjSubType == 73 then table.insert(callbacks, TheStarsCallback) end
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
	local adjustedSubtype = EID:getAdjustedSubtype(descObj.ObjType, descObj.ObjVariant, descObj.ObjSubType)
	local typeVarSub = descObj.ObjType.."."..descObj.ObjVariant.."."..adjustedSubtype
	if EID.HealthUpData[typeVarSub] or EID.HealingItemData[typeVarSub] then table.insert(callbacks, HealthUpCallback) end
	-- Collectible Pedestal Callbacks
	if descObj.ObjVariant == PickupVariant.PICKUP_COLLECTIBLE then
		if EID.Config["ItemCollectionIndicator"] and EID:requiredForCollectionPage(descObj.ObjSubType) then table.insert(callbacks, ItemCollectionPageCallback) end

		if EID.SingleUseCollectibles[descObj.ObjSubType] then table.insert(callbacks, SingleUseCallback) end

		if descObj.ObjSubType == 297 then table.insert(callbacks, PandorasBoxCallback) end

		if EID.Config["DisplayVoidStatInfo"] then
			if EID.collectiblesOwned[477] then table.insert(callbacks, VoidCallback) end
			if EID.collectiblesOwned["5.300.41"] then table.insert(callbacks, BlackRuneCallback) end
		end
		
	elseif descObj.ObjVariant == PickupVariant.PICKUP_TRINKET then
		if descObj.ObjSubType == 80 then table.insert(callbacks, BlackFeatherCallback) end
	elseif descObj.ObjVariant == PickupVariant.PICKUP_PILL then
		table.insert(callbacks, VurpCallback)
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
