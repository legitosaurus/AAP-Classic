AAPClassic = {}
AAPClassic.Explored = {}
AAPClassic.Build = GetBuildInfo()
if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
	print("AAP-Classic - Error - This is not Classic! Not Loading")
	--return
end
AAPClassic.Name = UnitName("player")
AAPClassic.Realm = string.gsub(GetRealmName(), " ", "")
AAPClassic.Faction = UnitFactionGroup("player")
AAPClassic.Level = UnitLevel("player")
AAPClassic.experience = UnitXP("player")
AAPClassic.Version = tonumber(GetAddOnMetadata("AAP-Classic", "Version"))
AAPClassic.Class = {}
AAPClassic.BookingList = {}
local CoreLoadin = 0
AAPClassic.QuestListLoadin = 0
AAPClassic.RaceLocale, AAPClassic.Race = UnitRace("player")
AAPClassic.Class[1],AAPClassic.Class[2],AAPClassic.Class[3] = UnitClass("player")
AAPClassic.QuestHelperEnable = "off"
AAPClassic.SettingsOpen = 0
AAPClassic.HBDP = LibStub("HereBeDragons-Pins-2.0")
AAPClassic.HBD = LibStub("HereBeDragons-2.0")
AAPClassic.Locale = GetLocale()
AAPClassic.NotRepeatList = {
	[813] = 813,
}
AAPClassic.ClassDBConv = {
	[1] = 1,
	[2] = 2,
	[3] = 4,
	[4] = 8,
	[5] = 16,
	[6] = 6,
	[7] = 64,
	[8] = 128,
	[9] = 256,
	[10] = 10,
	[11] = 1024,
	[12] = 12,
}
AAPClassic.QStarterList = {
	1972,
	1307,
	1971,
	5352,
	4881,
	4891,
	16305,
	16304,
	16303,
}

function AAPClassic.CheckSettings()
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"] = {}
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["left"] = GetScreenWidth() / 1.6
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["top"] = -(GetScreenHeight() / 5)
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"] = UIParent:GetScale()
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Lock"] = 0
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Hide"] = 0
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["alpha"] = 1
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["arrowleft"] = GetScreenWidth() / 2.05
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["arrowtop"] = -(GetScreenHeight() / 1.5)
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowFPS"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowFPS"] = 2
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtons"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtons"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["MiniMapBlobAlpha"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["MiniMapBlobAlpha"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtonDetatch"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtonDetatch"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["OrderListScale"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["OrderListScale"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowBlobs"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowBlobs"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMap10s"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMap10s"] = 0
  end

  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Legion"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Legion"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["WQs"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["WQs"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMapBlobs"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMapBlobs"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["DisableHeirloomWarning"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["DisableHeirloomWarning"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["LockArrow"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["LockArrow"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoGossip"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoGossip"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"] = UIParent:GetScale()
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerShow"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerShow"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Hcampleft"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Hcampleft"] = GetScreenWidth() / 1.6
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Hcamptop"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Hcamptop"] = -(GetScreenHeight() / 5)
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["CutScene"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["CutScene"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoAccept"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoAccept"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandIn"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandIn"] = 1
  end
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoShareQ"] = 0
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ChooseQuests"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ChooseQuests"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowScale"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowScale"] = UIParent:GetScale()
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandInChoice"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandInChoice"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Greetings"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Greetings"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Greetings3"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Greetings3"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoVendor"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoVendor"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoRepair"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoRepair"] = 0
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowGroup"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowGroup"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowArrow"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowArrow"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowQList"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowQList"] = 1
  end
  if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["AAP_DoWarCampaign"]) then
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["AAP_DoWarCampaign"] = 0
  end
end

function AAPClassic.dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function AAPClassic.ResetSettings()
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"] = {}
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["left"] = 150
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["top"] = -150
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"] = UIParent:GetScale()
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Lock"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Hide"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["alpha"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["arrowleft"] = 150
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["arrowtop"] = -150
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Hcampleft"] = 150
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Hcamptop"] = -150
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["CutScene"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoAccept"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandIn"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ChooseQuests"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowScale"] = UIParent:GetScale()
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandInChoice"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowQList"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoVendor"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoRepair"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowGroup"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoGossip"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerShow"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowBlobs"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["LockArrow"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowFPS"] = 2
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["DisableHeirloomWarning"] = 0
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["MiniMapBlobAlpha"] = 1
  AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["OrderListScale"] = 1
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowQList"] == 0) then
    AAPClassic.OptionsFrame.ShowQListCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.ShowQListCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowGroup"] == 0) then
    AAPClassic.OptionsFrame.ShowGroupCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.ShowGroupCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerShow"] == 0) then
    AAPClassic.OptionsFrame.BannerShowCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.BannerShowCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoGossip"] == 0) then
    AAPClassic.OptionsFrame.AutoGossipCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoGossipCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoVendor"] == 0) then
    AAPClassic.OptionsFrame.AutoVendorCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoVendorCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoRepair"] == 0) then
    AAPClassic.OptionsFrame.AutoRepairCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoRepairCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Lock"] == 0) then
    AAPClassic.OptionsFrame.LockQuestListCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.LockQuestListCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["CutScene"] == 0) then
    AAPClassic.OptionsFrame.CutSceneCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.CutSceneCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoAccept"] == 0) then
    AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandIn"] == 0) then
    AAPClassic.OptionsFrame.AutoHandInCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoHandInCheckButton:SetChecked(true)
  end
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandInChoice"] == 0) then
    AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:SetChecked(true)
  end

  AAPClassic.QuestList.ButtonParent:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"])
  AAPClassic.QuestList.ListFrame:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"])
  AAPClassic.QuestList21:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"])
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"] * 100)
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowScale"] * 100)


  AAPClassic.QuestList.MainFrame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["left"], AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["top"])
  AAPClassic.ArrowFrame:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowScale"])
  AAPClassic.ArrowFrameM:ClearAllPoints()
  AAPClassic.ArrowFrameM:SetPoint("TOPLEFT", UIParent, "TOPLEFT", AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["arrowleft"], AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["arrowtop"])
end

function AAPClassic.getContinent()
    local mapID = C_Map.GetBestMapForUnit("player")
    if(mapID) then
        local info = C_Map.GetMapInfo(mapID)
        if(info) then
            while(info['mapType'] and info['mapType'] > 2) do
                info = C_Map.GetMapInfo(info['parentMapID'])
            end
            if(info['mapType'] == 2) then
                return info['mapID']
            end
        end
    end
end
local function AAP_SlashCmd(AAP_index)
	if (AAP_index == "reset") then
		print("AAP: Resetting Zone.")
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (AAP_index == "skip") then
		print("AAP: Skipping QuestStep.")
		local CurStep = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr]
		local Step = AAPClassic.Path[AAPClassic.QH.ZoneNr][CurStep]
		AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"][AAPClassic.QH.ZoneNr] + 1
		AAPClassic.QH.FuncLoopNumber = 1
	elseif (AAP_index == "helper") then
		if (AAPClassic.QuestHelperEnable == "off") then
			print("AAP: Route OFF, Helper ON!")
			AAPClassic.QuestHelperEnable = "on"
			AAPClassic.RemoveIcons()
			AAPClassic.QuestList = nil
			AAPClassic.QuestList = {}
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
			AAPClassic.QH.BookingList.UpdateQuestList = 1
			AAPClassic.QH.REprintzQuestList()
		else
			print("AAP: Route ON, Helper OFF!")
			AAPClassic.QuestHelperEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
	elseif (AAP_index == "explore") then
		if (AAPClassic.ExploreEnable and AAPClassic.ExploreEnable == "on" and AAPClassic.Race == "Human") then
			print("AAP: Human Exploration OFF!")
			AAPClassic.ExploreEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		elseif (AAPClassic.Race == "Human") then
			print("AAP: Human Exploration ON!")
			AAPClassic.ExploreEnable = "on"
			AAPClassic.QuestHelperEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
		if (AAPClassic.ExploreEnable and AAPClassic.ExploreEnable == "on" and  (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome")) then
			print("AAP: Dwarf&Gnome Exploration OFF!")
			AAPClassic.ExploreEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		elseif (AAPClassic.Race == "Dwarf" or AAPClassic.Race == "Gnome") then
			print("AAP: Dwarf&Gnome Exploration ON!")
			AAPClassic.ExploreEnable = "on"
			AAPClassic.QuestHelperEnable = "off"
			AAPClassic.QH.BookingList.UpdateMapId = 1
			AAPClassic.QH.FuncLoopNumber = 1
		end
	else
		AAPClassic.SettingsOpen = 1
		AAPClassic.OptionsFrame.MainFrame:Show()
		AAPClassic.RemoveIcons()
		AAPClassic.BookingList["OpenedSettings"] = 1
	end
end
AAPClassic.EventFrame = CreateFrame("Frame")
AAPClassic.EventFrame:RegisterEvent ("ADDON_LOADED")

AAPClassic.EventFrame:SetScript("OnEvent", function(self, event, ...)
	if (event=="ADDON_LOADED") then
		local arg1, arg2, arg3, arg4, arg5 = ...;
		if (arg1 == "AAP-Classic") then
			if (not AAPC1) then
				AAPC1 = {}
			end
			if (not AAPC1[AAPClassic.Realm]) then
				AAPC1[AAPClassic.Realm] = {}
			end
			if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name] = {}
			end
			if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Completed"] = {}
			end
			if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Elite"] = {}
			end
			if (not AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"]) then
				AAPC1[AAPClassic.Realm][AAPClassic.Name]["Zones"] = {}
			end
			SlashCmdList["AAP_Cmd"] = AAP_SlashCmd
			SLASH_AAP_Cmd1 = "/aap"
			CoreLoadin = 1
			if emptyVar == nil then
		   -- Some code
			end
			AAPClassic.ReupdateQlistTimer = AAPClassic.EventFrame:CreateAnimationGroup()
			AAPClassic.ReupdateQlistTimer.anim = AAPClassic.ReupdateQlistTimer:CreateAnimation()
			AAPClassic.ReupdateQlistTimer.anim:SetDuration(5)
			AAPClassic.ReupdateQlistTimer:SetLooping("REPEAT")

			AAPClassic.ReupdateQlistTimer:SetScript("OnLoop", function(self, event, ...)
				if (CoreLoadin == 1 and AAPClassic.QuestListLoadin == 1) then
					AAPClassic.CheckSettings()
					AAPClassic.LoadOptionsFrame()
					print("AAP Classic Loaded")
					AAPClassic.QH.BookingList.UpdateQuestList = 1
					AAPClassic.ReupdateQlistTimer:Stop()

				else
					print("AAP Classic not loaded yet..")
				end
			end)
			AAPClassic.CheckQcountTimer = AAPClassic.EventFrame:CreateAnimationGroup()
			AAPClassic.CheckQcountTimer.anim = AAPClassic.CheckQcountTimer:CreateAnimation()
			AAPClassic.CheckQcountTimer.anim:SetDuration(2)
			AAPClassic.CheckQcountTimer:SetLooping("REPEAT")
			AAPClassic.CheckQcountTimer:SetScript("OnLoop", function(self, event, ...)
				AAPClassic.QH.BookingList.ExtraQ = 1
				AAPClassic.CheckQcountTimer:Stop()
			end)
		end
	end
end)
