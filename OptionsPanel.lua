if (tonumber(string.sub(AAPClassic.Build, 1,1)) > 2) then
  print("AAP-Classic - Error - This is not Classic! Not Loading")
  --return
end
AAPClassic.Panel = {}
AAPClassic.AAP_panel = CreateFrame( "Frame", "CLPanelFrame", UIParent)
AAPClassic.AAP_panel.name = "Azeroth Auto Pilot (Classic)"
InterfaceOptions_AddCategory(AAPClassic.AAP_panel)
AAP_panel = {}
AAP_panel.title = CreateFrame("SimpleHTML",nil,AAPClassic.AAP_panel)
AAP_panel.title:SetWidth(500)
AAP_panel.title:SetHeight(20)
AAP_panel.title:SetPoint("TOPLEFT", AAPClassic.AAP_panel, 0,-30)
AAP_panel.title:SetFontObject("GameFontHighlightLarge")
AAP_panel.title:SetText("Azeroth Auto Pilot (Classic) - v" .. AAPClassic.Version)

AAP_panel.Button1 = CreateFrame("Button", "ZPButton2", AAPClassic.AAP_panel)
AAP_panel.Button1:SetPoint("TOPLEFT", AAPClassic.AAP_panel, "TOPLEFT", 120, -100)
AAP_panel.Button1:SetWidth(70)
AAP_panel.Button1:SetHeight(30)
AAP_panel.Button1:SetText("Load")
AAP_panel.Button1:SetNormalFontObject("GameFontNormal")
AAP_panel.Button1ntex = AAP_panel.Button1:CreateTexture()
AAP_panel.Button1ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
AAP_panel.Button1ntex:SetTexCoord(0, 0.625, 0, 0.6875)
AAP_panel.Button1ntex:SetAllPoints()
AAP_panel.Button1:SetNormalTexture(AAP_panel.Button1ntex)
AAP_panel.Button1htex = AAP_panel.Button1:CreateTexture()
AAP_panel.Button1htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
AAP_panel.Button1htex:SetTexCoord(0, 0.625, 0, 0.6875)
AAP_panel.Button1htex:SetAllPoints()
AAP_panel.Button1:SetHighlightTexture(AAP_panel.Button1htex)
AAP_panel.Button1ptex = AAP_panel.Button1:CreateTexture()
AAP_panel.Button1ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
AAP_panel.Button1ptex:SetTexCoord(0, 0.625, 0, 0.6875)
AAP_panel.Button1ptex:SetAllPoints()
AAP_panel.Button1:SetPushedTexture(AAP_panel.Button1ptex)
AAP_panel.Button1:SetScript("OnClick", function(self, arg1)
  InterfaceOptionsFrame:Hide()
  HideUIPanel(GameMenuFrame)
  AAPClassic.OptionsFrame.MainFrame:Show()
end)
function AAPClassic.LoadOptionsFrame()
  AAPClassic.OptionsFrame = {}
  AAPClassic.OptionsFrame.MainFrame = CreateFrame("frame", "AAP_OptionsMainFrame",  UIParent)
  AAPClassic.OptionsFrame.MainFrame:SetWidth(450)
  AAPClassic.OptionsFrame.MainFrame:SetHeight(360)
  AAPClassic.OptionsFrame.MainFrame:SetFrameStrata("MEDIUM")
  AAPClassic.OptionsFrame.MainFrame:SetPoint("CENTER",  UIParent, "CENTER",0,0)
  AAPClassic.OptionsFrame.MainFrame:SetMovable(true)
  AAPClassic.OptionsFrame.MainFrame:EnableMouse(true)
  AAPClassic.OptionsFrame.MainFrame:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
  });
  AAPClassic.OptionsFrame.MainFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StartMoving();
      AAPClassic.OptionsFrame.MainFrame.isMoving = true;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame:SetScript("OnHide", function(self)
    if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame:Hide()


  AAPClassic.OptionsFrame.MainFrame.Options = CreateFrame("frame", "AAP_OptionsMainFrame_1",  AAP_OptionsMainFrame)
  AAPClassic.OptionsFrame.MainFrame.Options:SetWidth(150)
  AAPClassic.OptionsFrame.MainFrame.Options:SetHeight(320)
  AAPClassic.OptionsFrame.MainFrame.Options:SetFrameStrata("MEDIUM")
  AAPClassic.OptionsFrame.MainFrame.Options:SetPoint("LEFT",  AAP_OptionsMainFrame, "LEFT",0,-20)
  AAPClassic.OptionsFrame.MainFrame.Options:SetMovable(true)
  AAPClassic.OptionsFrame.MainFrame.Options:EnableMouse(true)
  AAPClassic.OptionsFrame.MainFrame.Options:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
  });
  AAPClassic.OptionsFrame.MainFrame.Options:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StartMoving();
      AAPClassic.OptionsFrame.MainFrame.isMoving = true;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.Options:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.Options:SetScript("OnHide", function(self)
    if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.FontString1 = AAPClassic.OptionsFrame.MainFrame:CreateFontString("AAPSettingsFS1","ARTWORK", "ChatFontNormal")
  AAPClassic.OptionsFrame.FontString1:SetParent(AAPClassic.OptionsFrame.MainFrame)
  AAPClassic.OptionsFrame.FontString1:SetPoint("TOP",AAPClassic.OptionsFrame.MainFrame,"TOP",0,0)
  AAPClassic.OptionsFrame.FontString1:SetWidth(240)
  AAPClassic.OptionsFrame.FontString1:SetHeight(20)
  AAPClassic.OptionsFrame.FontString1:SetFontObject("GameFontHighlightLarge")
  AAPClassic.OptionsFrame.FontString1:SetText("Azeroth Auto Pilot - v" .. AAPClassic.Version)
  AAPClassic.OptionsFrame.FontString1:SetTextColor(1, 1, 0)
-------------------- Quest Options ----------------------------------------
  AAPClassic.OptionsFrame.MainFrame.OptionsB1 = CreateFrame("frame", "AAP_OptionsMainFrame_QuestOptions",  AAP_OptionsMainFrame)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetWidth(150)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetHeight(30)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetFrameStrata("HIGH")
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetPoint("TOPLEFT",  AAP_OptionsMainFrame, "TOPLEFT",0,-40)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetMovable(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:EnableMouse(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
  });
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
      AAPClassic.OptionsFrame.MainFrame.OptionsQuests:Show()
      AAPClassic.OptionsFrame.MainFrame.OptionsArrow:Hide()
      AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:Hide()
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1:SetScript("OnHide", function(self)
    if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1.FontString = AAPClassic.OptionsFrame.MainFrame:CreateFontString("AAP_OptionsB1FS1","ARTWORK", "ChatFontNormal")
  AAPClassic.OptionsFrame.MainFrame.OptionsB1.FontString:SetParent(AAPClassic.OptionsFrame.MainFrame.OptionsB1)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1.FontString:SetPoint("CENTER",AAPClassic.OptionsFrame.MainFrame.OptionsB1,"CENTER",0,0)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1.FontString:SetWidth(240)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1.FontString:SetHeight(20)
  AAPClassic.OptionsFrame.MainFrame.OptionsB1.FontString:SetFontObject("GameFontHighlightLarge")
  AAPClassic.OptionsFrame.MainFrame.OptionsB1.FontString:SetText("Quest Options")
  AAPClassic.OptionsFrame.MainFrame.OptionsB1.FontString:SetTextColor(1, 1, 0)

  AAPClassic.OptionsFrame.MainFrame.OptionsQuests = CreateFrame("frame", "AAP_OptionsMainFrame_Quests",  AAP_OptionsMainFrame)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetWidth(295)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetHeight(320)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetFrameStrata("MEDIUM")
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetPoint("LEFT",  AAP_OptionsMainFrame, "LEFT",155,-20)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetMovable(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:EnableMouse(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
  });
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StartMoving();
      AAPClassic.OptionsFrame.MainFrame.isMoving = true;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:SetScript("OnHide", function(self)
    if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsQuests:Hide()
    AAPClassic.OptionsFrame.AutoAcceptCheckButton = CreateFrame("CheckButton", "AAP_AutoAcceptCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "TOPLEFT", 10, -10)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoAccept"] == 0) then
    AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetChecked(true)
  end
  DEFAULT_CHAT_FRAME:AddMessage(AAPC_Locals)
  getglobal(AAPClassic.OptionsFrame.AutoAcceptCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Accept Quest"])
  getglobal(AAPClassic.OptionsFrame.AutoAcceptCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.AutoAcceptCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.AutoAcceptCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoAccept"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoAccept"] = 0
    end
  end)
  AAPClassic.OptionsFrame.AutoHandInCheckButton = CreateFrame("CheckButton", "AAP_AutoHandInCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.AutoHandInCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "TOPLEFT", 10, -30)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandIn"] == 0) then
    AAPClassic.OptionsFrame.AutoHandInCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoHandInCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.AutoHandInCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Turn in Quest"])
  getglobal(AAPClassic.OptionsFrame.AutoHandInCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.AutoHandInCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.AutoHandInCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandIn"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandIn"] = 0
    end
  end)
  AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton = CreateFrame("CheckButton", "AAP_AutoHandInChoiceCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "TOPLEFT", 10, -50)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandInChoice"] == 0) then
    AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Choose Reward Ilvl"])
  getglobal(AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.AutoHandInChoiceCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandInChoice"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoHandInChoice"] = 0
    end
  end)
  AAPClassic.OptionsFrame.ShowQListCheckButton = CreateFrame("CheckButton", "AAP_ShowQListCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.ShowQListCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "TOPLEFT", 10, -70)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowQList"] == 0) then
    AAPClassic.OptionsFrame.ShowQListCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.ShowQListCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.ShowQListCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Show QuestList"])
  getglobal(AAPClassic.OptionsFrame.ShowQListCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.ShowQListCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.ShowQListCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowQList"] = 1
      AAPClassic.BookingList["PrintQStep"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowQList"] = 0
      for CLi = 1, 10 do
        AAPClassic.QuestList.QuestFrames[CLi]:Hide()
        AAPClassic.QuestList.QuestFrames["FS"..CLi]["Button"]:Hide()
        AAPClassic.QuestList2["BF"..CLi]:Hide()
      end
      AAPClassic.BookingList["PrintQStep"] = 1
    end
  end)
  AAPClassic.OptionsFrame.LockQuestListCheckButton = CreateFrame("CheckButton", "AAP_LockQuestListCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.LockQuestListCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "TOPLEFT", 10, -90)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Lock"] == 0) then
    AAPClassic.OptionsFrame.LockQuestListCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.LockQuestListCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.LockQuestListCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Lock QuestList"])
  getglobal(AAPClassic.OptionsFrame.LockQuestListCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.LockQuestListCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.LockQuestListCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Lock"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Lock"] = 0
    end
  end)
  AAPClassic.OptionsFrame.QuestListScaleSlider = CreateFrame("Slider", "AAP_QuestListScaleSlider",AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "OptionsSliderTemplate")
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetWidth(160)
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetHeight(15)
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "TOPLEFT", 20, -120)
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetOrientation("HORIZONTAL")
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetMinMaxValues(1, 200)
  AAPClassic.OptionsFrame.QuestListScaleSlider.minValue, AAPClassic.OptionsFrame.QuestListScaleSlider.maxValue = AAPClassic.OptionsFrame.QuestListScaleSlider:GetMinMaxValues()
  getglobal(AAPClassic.OptionsFrame.QuestListScaleSlider:GetName() .. 'Low'):SetText("1%")
  getglobal(AAPClassic.OptionsFrame.QuestListScaleSlider:GetName() .. 'High'):SetText("200%")
  getglobal(AAPClassic.OptionsFrame.QuestListScaleSlider:GetName() .. 'Text'):SetText("QuestList Scale:")
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetValueStep(1)
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetValue(100)
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetScript("OnValueChanged", function(self,event)
    event = event - event%1
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"] = event / 100
    AAPClassic.QL.QButtonFrame:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"])
    AAPClassic.QL.ListFrame:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"])
    -- AAPClassic.QuestList21:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"])
  end)
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetScript("OnMouseWheel", function(self,delta)
    if tonumber(self:GetValue()) == nil then return end
    self:SetValue(tonumber(self:GetValue())+delta)
  end)
  AAPClassic.OptionsFrame.QuestListScaleSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["Scale"] * 100)





  AAPClassic.OptionsFrame.QuestOrderListScaleSlider = CreateFrame("Slider", "AAP_QuestOrderListScaleSlider",AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "OptionsSliderTemplate")
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetWidth(160)
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetHeight(15)
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "TOPLEFT", 20, -160)
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetOrientation("HORIZONTAL")
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetMinMaxValues(1, 200)
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider.minValue, AAPClassic.OptionsFrame.QuestOrderListScaleSlider.maxValue = AAPClassic.OptionsFrame.QuestOrderListScaleSlider:GetMinMaxValues()
  getglobal(AAPClassic.OptionsFrame.QuestOrderListScaleSlider:GetName() .. 'Low'):SetText("1%")
  getglobal(AAPClassic.OptionsFrame.QuestOrderListScaleSlider:GetName() .. 'High'):SetText("200%")
  getglobal(AAPClassic.OptionsFrame.QuestOrderListScaleSlider:GetName() .. 'Text'):SetText("Quest Order List Scale:")
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetValueStep(1)
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetValue(100)
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetScript("OnValueChanged", function(self,event)
    event = event - event%1
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["OrderListScale"] = event / 100
    AAPClassic.ZoneQuestOrder:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["OrderListScale"])
  end)
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetScript("OnMouseWheel", function(self,delta)
    if tonumber(self:GetValue()) == nil then return end
    self:SetValue(tonumber(self:GetValue())+delta)
  end)
  AAPClassic.OptionsFrame.QuestOrderListScaleSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["OrderListScale"] * 100)

  AAPClassic.OptionsFrame.WorldQuestsCheckButton = CreateFrame("CheckButton", "AAP_WorldQuestsCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.WorldQuestsCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsQuests, "TOPLEFT", 10, -210)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["WQs"] == 0) then
    AAPClassic.OptionsFrame.WorldQuestsCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.WorldQuestsCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.WorldQuestsCheckButton:GetName() .. 'Text'):SetText(": World Quests")
  getglobal(AAPClassic.OptionsFrame.WorldQuestsCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.WorldQuestsCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.WorldQuestsCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["WQs"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["WQs"] = 0
    end
  end)

----------------- Arrow Options --------------------------------------------------------------------------------------------
  AAPClassic.OptionsFrame.MainFrame.OptionsB2 = CreateFrame("frame", "AAP_OptionsMainFrame_ArrowOptions",  AAP_OptionsMainFrame)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetWidth(150)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetHeight(30)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetFrameStrata("HIGH")
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetPoint("TOPLEFT",  AAP_OptionsMainFrame, "TOPLEFT",0,-70)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetMovable(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:EnableMouse(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
  });
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
      AAPClassic.OptionsFrame.MainFrame.OptionsQuests:Hide()
      AAPClassic.OptionsFrame.MainFrame.OptionsArrow:Show()
      AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:Hide()
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2:SetScript("OnHide", function(self)
    if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2.FontString = AAPClassic.OptionsFrame.MainFrame:CreateFontString("AAP_OptionsB2FS1","ARTWORK", "ChatFontNormal")
  AAPClassic.OptionsFrame.MainFrame.OptionsB2.FontString:SetParent(AAPClassic.OptionsFrame.MainFrame.OptionsB2)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2.FontString:SetPoint("CENTER",AAPClassic.OptionsFrame.MainFrame.OptionsB2,"CENTER",0,0)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2.FontString:SetWidth(240)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2.FontString:SetHeight(20)
  AAPClassic.OptionsFrame.MainFrame.OptionsB2.FontString:SetFontObject("GameFontHighlightLarge")
  AAPClassic.OptionsFrame.MainFrame.OptionsB2.FontString:SetText("Arrow Options")
  AAPClassic.OptionsFrame.MainFrame.OptionsB2.FontString:SetTextColor(1, 1, 0)

  AAPClassic.OptionsFrame.MainFrame.OptionsArrow = CreateFrame("frame", "AAP_OptionsMainFrame_Arrow",  AAP_OptionsMainFrame)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetWidth(295)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetHeight(320)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetFrameStrata("MEDIUM")
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetPoint("LEFT",  AAP_OptionsMainFrame, "LEFT",155,-20)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetMovable(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:EnableMouse(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
  });
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StartMoving();
      AAPClassic.OptionsFrame.MainFrame.isMoving = true;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:SetScript("OnHide", function(self)
    if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsArrow:Hide()
  AAPClassic.OptionsFrame.LockArrowCheckButton = CreateFrame("CheckButton", "AAP_LockArrowCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsArrow, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.LockArrowCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsArrow, "TOPLEFT", 10, -10)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["LockArrow"] == 0) then
    AAPClassic.OptionsFrame.LockArrowCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.LockArrowCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.LockArrowCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Lock Arrow"])
  getglobal(AAPClassic.OptionsFrame.LockArrowCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.LockArrowCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.LockArrowCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["LockArrow"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["LockArrow"] = 0
    end
  end)
  AAPClassic.OptionsFrame.ShowArrowCheckButton = CreateFrame("CheckButton", "AAP_ShowArrowCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsArrow, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.ShowArrowCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsArrow, "TOPLEFT", 10, -30)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowArrow"] == 0) then
    AAPClassic.OptionsFrame.ShowArrowCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.ShowArrowCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.ShowArrowCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Show Arrow"])
  getglobal(AAPClassic.OptionsFrame.ShowArrowCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.ShowArrowCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.ShowArrowCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowArrow"] = 1
      AAPClassic.ArrowActive = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowArrow"] = 0
    end
  end)
  AAPClassic.OptionsFrame.ArrowScaleSlider = CreateFrame("Slider", "AAP_ArrowScaleSlider",AAPClassic.OptionsFrame.MainFrame.OptionsArrow, "OptionsSliderTemplate")
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetWidth(160)
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetHeight(15)
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsArrow, "TOPLEFT", 20, -70)
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetOrientation("HORIZONTAL")
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetMinMaxValues(1, 200)
  AAPClassic.OptionsFrame.ArrowScaleSlider.minValue, AAPClassic.OptionsFrame.ArrowScaleSlider.maxValue = AAPClassic.OptionsFrame.ArrowScaleSlider:GetMinMaxValues()
  getglobal(AAPClassic.OptionsFrame.ArrowScaleSlider:GetName() .. 'Low'):SetText("1%")
  getglobal(AAPClassic.OptionsFrame.ArrowScaleSlider:GetName() .. 'High'):SetText("200%")
  getglobal(AAPClassic.OptionsFrame.ArrowScaleSlider:GetName() .. 'Text'):SetText("Arrow Scale:")
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetValueStep(1)
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetValue(100)
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetScript("OnValueChanged", function(self,event)
    event = event - event%1
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowScale"] = event / 100
    AAPClassic.ArrowFrame:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowScale"])

  end)
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetScript("OnMouseWheel", function(self,delta)
    if tonumber(self:GetValue()) == nil then return end
    self:SetValue(tonumber(self:GetValue())+delta)
  end)
  AAPClassic.OptionsFrame.ArrowScaleSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowScale"] * 100)


  AAPClassic.OptionsFrame.ArrowFpsSlider = CreateFrame("Slider", "AAP_ArrowFpsSlider",AAPClassic.OptionsFrame.MainFrame.OptionsArrow, "OptionsSliderTemplate")
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetWidth(160)
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetHeight(15)
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsArrow, "TOPLEFT", 20, -110)
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetOrientation("HORIZONTAL")
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetMinMaxValues(1, 5)
  AAPClassic.OptionsFrame.ArrowFpsSlider.minValue, AAPClassic.OptionsFrame.ArrowFpsSlider.maxValue = AAPClassic.OptionsFrame.ArrowFpsSlider:GetMinMaxValues()
  getglobal(AAPClassic.OptionsFrame.ArrowFpsSlider:GetName() .. 'Low'):SetText("1")
  getglobal(AAPClassic.OptionsFrame.ArrowFpsSlider:GetName() .. 'High'):SetText("5")
  getglobal(AAPClassic.OptionsFrame.ArrowFpsSlider:GetName() .. 'Text'):SetText("Update Arrow every "..AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowFPS"].." FPS:")
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetValueStep(1)
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetValue(2)
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetScript("OnValueChanged", function(self,event)
    event = event - event%1
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowFPS"] = floor(event)
    getglobal(AAPClassic.OptionsFrame.ArrowFpsSlider:GetName() .. 'Text'):SetText("Update Arrow every "..AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowFPS"].." FPS:")
  end)
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetScript("OnMouseWheel", function(self,delta)
    if tonumber(self:GetValue()) == nil then return end
    self:SetValue(tonumber(self:GetValue())+delta)
  end)
  AAPClassic.OptionsFrame.ArrowFpsSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ArrowFPS"])




------------------------- General Options --------------------------------------------------------------------------
  AAPClassic.OptionsFrame.MainFrame.OptionsB3 = CreateFrame("frame", "AAP_OptionsMainFrame_GeneralOptions",  AAP_OptionsMainFrame)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetWidth(150)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetHeight(30)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetFrameStrata("HIGH")
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetPoint("TOPLEFT",  AAP_OptionsMainFrame, "TOPLEFT",0,-100)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetMovable(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:EnableMouse(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
  });
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
      AAPClassic.OptionsFrame.MainFrame.OptionsQuests:Hide()
      AAPClassic.OptionsFrame.MainFrame.OptionsArrow:Hide()
      AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:Show()
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3:SetScript("OnHide", function(self)
    if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3.FontString = AAPClassic.OptionsFrame.MainFrame:CreateFontString("AAP_OptionsB3FS1","ARTWORK", "ChatFontNormal")
  AAPClassic.OptionsFrame.MainFrame.OptionsB3.FontString:SetParent(AAPClassic.OptionsFrame.MainFrame.OptionsB3)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3.FontString:SetPoint("CENTER",AAPClassic.OptionsFrame.MainFrame.OptionsB3,"CENTER",0,0)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3.FontString:SetWidth(240)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3.FontString:SetHeight(20)
  AAPClassic.OptionsFrame.MainFrame.OptionsB3.FontString:SetFontObject("GameFontHighlightLarge")
  AAPClassic.OptionsFrame.MainFrame.OptionsB3.FontString:SetText("General Options")
  AAPClassic.OptionsFrame.MainFrame.OptionsB3.FontString:SetTextColor(1, 1, 0)

  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral = CreateFrame("frame", "AAP_OptionsMainFrame_General",  AAP_OptionsMainFrame)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetWidth(295)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetHeight(320)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetFrameStrata("MEDIUM")
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetPoint("LEFT",  AAP_OptionsMainFrame, "LEFT",155,-20)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetMovable(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:EnableMouse(true)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetBackdrop( {
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 10, edgeSize = 10, insets = { left = 2, right = 2, top = 2, bottom = 2 }
  });
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and not AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StartMoving();
      AAPClassic.OptionsFrame.MainFrame.isMoving = true;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetScript("OnMouseUp", function(self, button)
    if button == "LeftButton" and AAPClassic.OptionsFrame.MainFrame.isMoving then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:SetScript("OnHide", function(self)
    if ( AAPClassic.OptionsFrame.MainFrame.isMoving ) then
      AAPClassic.OptionsFrame.MainFrame:StopMovingOrSizing();
      AAPClassic.OptionsFrame.MainFrame.isMoving = false;
    end
  end)
  AAPClassic.OptionsFrame.MainFrame.OptionsGeneral:Hide()
  AAPClassic.OptionsFrame.CutSceneCheckButton = CreateFrame("CheckButton", "AAP_CutSceneCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.CutSceneCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -10)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["CutScene"] == 0) then
    AAPClassic.OptionsFrame.CutSceneCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.CutSceneCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.CutSceneCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Skipped cutscene"])
  getglobal(AAPClassic.OptionsFrame.CutSceneCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.CutSceneCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.CutSceneCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["CutScene"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["CutScene"] = 0
    end
  end)
  AAPClassic.OptionsFrame.AutoVendorCheckButton = CreateFrame("CheckButton", "AAP_AutoVendorCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.AutoVendorCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -30)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoVendor"] == 0) then
    AAPClassic.OptionsFrame.AutoVendorCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoVendorCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.AutoVendorCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["AutoVendor"])
  getglobal(AAPClassic.OptionsFrame.AutoVendorCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.AutoVendorCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.AutoVendorCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoVendor"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoVendor"] = 0
    end
  end)
  AAPClassic.OptionsFrame.AutoRepairCheckButton = CreateFrame("CheckButton", "AAP_AutoRepairCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.AutoRepairCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -50)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoRepair"] == 0) then
    AAPClassic.OptionsFrame.AutoRepairCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoRepairCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.AutoRepairCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["AutoRepair"])
  getglobal(AAPClassic.OptionsFrame.AutoRepairCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.AutoRepairCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.AutoRepairCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoRepair"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoRepair"] = 0
    end
  end)
  AAPClassic.OptionsFrame.ShowGroupCheckButton = CreateFrame("CheckButton", "AAP_ShowGroupCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.ShowGroupCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -70)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowGroup"] == 0) then
    AAPClassic.OptionsFrame.ShowGroupCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.ShowGroupCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.ShowGroupCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["ShowGroup"])
  getglobal(AAPClassic.OptionsFrame.ShowGroupCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.ShowGroupCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.ShowGroupCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowGroup"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowGroup"] = 0
      for CLi = 1, 5 do
        AAPClassic.PartyList.PartyFrames[CLi]:Hide()
        AAPClassic.PartyList.PartyFrames2[CLi]:Hide()
      end
    end
  end)
  AAPClassic.OptionsFrame.AutoGossipCheckButton = CreateFrame("CheckButton", "AAP_AutoGossipCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.AutoGossipCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -90)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoGossip"] == 0) then
    AAPClassic.OptionsFrame.AutoGossipCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.AutoGossipCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.AutoGossipCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["Auto-selection of dialog"])
  getglobal(AAPClassic.OptionsFrame.AutoGossipCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.AutoGossipCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.AutoGossipCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoGossip"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["AutoGossip"] = 0
    end
  end)
  -- AAPClassic.OptionsFrame.BannerShowCheckButton = CreateFrame("CheckButton", "AAP_BannerShowCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  -- AAPClassic.OptionsFrame.BannerShowCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -110)
  -- if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerShow"] == 0) then
  --   AAPClassic.OptionsFrame.BannerShowCheckButton:SetChecked(false)
  -- else
  --   AAPClassic.OptionsFrame.BannerShowCheckButton:SetChecked(true)
  -- end
  -- getglobal(AAPClassic.OptionsFrame.BannerShowCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["BannerShow"])
  -- getglobal(AAPClassic.OptionsFrame.BannerShowCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  -- AAPClassic.OptionsFrame.BannerShowCheckButton:SetScript("OnClick", function()
  --   if (AAPClassic.OptionsFrame.BannerShowCheckButton:GetChecked() == true) then
  --     AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerShow"] = 1
  --     AAPClassic.Banners.BannersFrame.Frame:Show()
  --   else
  --     AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerShow"] = 0
  --     AAPClassic.Banners.BannersFrame.Frame:Hide()
  --   end
  -- end)
  -- AAPClassic.OptionsFrame.BannerScaleSlider = CreateFrame("Slider", "AAP_BannerScaleSlider",AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "OptionsSliderTemplate")
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetWidth(160)
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetHeight(15)
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 50, -145)
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetOrientation("HORIZONTAL")
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetMinMaxValues(1, 200)
  -- AAPClassic.OptionsFrame.BannerScaleSlider.minValue, AAPClassic.OptionsFrame.BannerScaleSlider.maxValue = AAPClassic.OptionsFrame.BannerScaleSlider:GetMinMaxValues()
  -- getglobal(AAPClassic.OptionsFrame.BannerScaleSlider:GetName() .. 'Low'):SetText("1%")
  -- getglobal(AAPClassic.OptionsFrame.BannerScaleSlider:GetName() .. 'High'):SetText("200%")
  -- getglobal(AAPClassic.OptionsFrame.BannerScaleSlider:GetName() .. 'Text'):SetText(AAPC_Locals["BannerScale"])
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetValueStep(1)
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetValue(100)
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetScript("OnValueChanged", function(self,event)
  --   event = event - event%1
  --   AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"] = event / 100
  --   AAPClassic.Banners.BannersFrame.Frame:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"])
  --   AAPClassic.Banners.BannersFrame["Frame1"]:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"])
  --   AAPClassic.Banners.BannersFrame["Frame2"]:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"])
  --   AAPClassic.Banners.BannersFrame["Frame3"]:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"])
  --   AAPClassic.Banners.BannersFrame["Frame4"]:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"])
  -- end)
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetScript("OnMouseWheel", function(self,delta)
  --   if tonumber(self:GetValue()) == nil then return end
  --   self:SetValue(tonumber(self:GetValue())+delta)
  -- end)
  -- AAPClassic.OptionsFrame.BannerScaleSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["BannerScale"] * 100)



  AAPClassic.OptionsFrame.BlobsShowCheckButton = CreateFrame("CheckButton", "AAP_BlobsShowCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.BlobsShowCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -170)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowBlobs"] == 0) then
    AAPClassic.OptionsFrame.BlobsShowCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.BlobsShowCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.BlobsShowCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["ShowBlobs"])
  getglobal(AAPClassic.OptionsFrame.BlobsShowCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.BlobsShowCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.BlobsShowCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowBlobs"] = 1
      AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:Show()
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowBlobs"] = 0
      AAPClassic.RemoveIcons()
      AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:Hide()
    end
  end)


  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider = CreateFrame("Slider", "AAP_MiniMapBlobAlphaSlider",AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "OptionsSliderTemplate")
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetWidth(160)
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetHeight(15)
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 50, -205)
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetOrientation("HORIZONTAL")
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetMinMaxValues(1, 100)
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider.minValue, AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider.maxValue = AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:GetMinMaxValues()
  getglobal(AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:GetName() .. 'Low'):SetText("1%")
  getglobal(AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:GetName() .. 'High'):SetText("100%")
  getglobal(AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:GetName() .. 'Text'):SetText("Set Minimap blobs alpha")
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetValueStep(1)
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetValue(100)
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetScript("OnValueChanged", function(self,event)
    event = event - event%1
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["MiniMapBlobAlpha"] = event / 100
    -- AAPClassic.Banners.BannersFrame.Frame:SetAlpha(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["MiniMapBlobAlpha"])
    local CLi
    for CLi = 1, 20 do
      AAP["Icons"][CLi].texture:SetAlpha(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["MiniMapBlobAlpha"])
    end
  end)
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetScript("OnMouseWheel", function(self,delta)
    if tonumber(self:GetValue()) == nil then return end
    self:SetValue(tonumber(self:GetValue())+delta)
  end)
  AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["MiniMapBlobAlpha"] * 100)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowBlobs"] == 0) then
    AAPClassic.OptionsFrame.MiniMapBlobAlphaSlider:Hide()
  end











  AAPClassic.OptionsFrame.MapBlobsShowCheckButton = CreateFrame("CheckButton", "AAP_MapBlobsShowCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.MapBlobsShowCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -225)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMapBlobs"] == 0) then
    AAPClassic.OptionsFrame.MapBlobsShowCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.MapBlobsShowCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.MapBlobsShowCheckButton:GetName() .. 'Text'):SetText(": "..AAPC_Locals["ShowMapBlobs"])
  getglobal(AAPClassic.OptionsFrame.MapBlobsShowCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.MapBlobsShowCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.MapBlobsShowCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMapBlobs"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMapBlobs"] = 0
      AAP:MoveMapIcons()
    end
  end)





  AAPClassic.OptionsFrame.ShowMap10sCheckButton = CreateFrame("CheckButton", "AAP_ShowMap10sCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.ShowMap10sCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -245)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMap10s"] == 0) then
    AAPClassic.OptionsFrame.ShowMap10sCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.ShowMap10sCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.ShowMap10sCheckButton:GetName() .. 'Text'):SetText(": Show 10 steps on map")
  getglobal(AAPClassic.OptionsFrame.ShowMap10sCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.ShowMap10sCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.ShowMap10sCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMap10s"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["ShowMap10s"] = 0
      AAPClassic.HBDP:RemoveAllWorldMapIcons("AAPMapOrder")
    end
  end)


  AAPClassic.OptionsFrame.DisableHeirloomWarningCheckButton = CreateFrame("CheckButton", "AAP_DisableHeirloomWarningCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.DisableHeirloomWarningCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -265)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["DisableHeirloomWarning"] == 0) then
    AAPClassic.OptionsFrame.DisableHeirloomWarningCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.DisableHeirloomWarningCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.DisableHeirloomWarningCheckButton:GetName() .. 'Text'):SetText(": Disable Heirloom Warning")
  getglobal(AAPClassic.OptionsFrame.DisableHeirloomWarningCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.DisableHeirloomWarningCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.DisableHeirloomWarningCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["DisableHeirloomWarning"] = 1
      AAPClassic.BookingList["PrintQStep"] = 1
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["DisableHeirloomWarning"] = 0
      AAPClassic.BookingList["PrintQStep"] = 1
    end
  end)



  AAPClassic.OptionsFrame.QuestButtonsCheckButton = CreateFrame("CheckButton", "AAP_QuestButtonsCheckButton", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "ChatConfigCheckButtonTemplate");
  AAPClassic.OptionsFrame.QuestButtonsCheckButton:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 10, -200)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtonDetatch"] == 0) then
    AAPClassic.OptionsFrame.QuestButtonsCheckButton:SetChecked(false)
  else
    AAPClassic.OptionsFrame.QuestButtonsCheckButton:SetChecked(true)
  end
  getglobal(AAPClassic.OptionsFrame.QuestButtonsCheckButton:GetName() .. 'Text'):SetText(": Detatch Quest Item Buttons")
  getglobal(AAPClassic.OptionsFrame.QuestButtonsCheckButton:GetName() .. 'Text'):SetTextColor(1, 1, 1)
  AAPClassic.OptionsFrame.QuestButtonsCheckButton:SetScript("OnClick", function()
    if (AAPClassic.OptionsFrame.QuestButtonsCheckButton:GetChecked() == true) then
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtonDetatch"] = 1
      AAPClassic.OptionsFrame.QuestButtonsSlider:Show()
    else
      AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtonDetatch"] = 0
      local Topz = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["left"]
      local Topz2 = AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["top"]
      AAPClassic.QuestList20:SetPoint("TOPLEFT", UIParent, "TOPLEFT", Topz, Topz2)
      for CLi = 1, 3 do
        AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtons"] = 1
        AAPClassic.QuestList2["BF"..CLi]:SetPoint("BOTTOMLEFT", AAPClassic.QuestList21, "BOTTOMLEFT",0,-((CLi * 38)+CLi))
        AAPClassic.QuestList2["BF"..CLi]["AAP_Button"]:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtons"])
        AAPClassic.OptionsFrame.QuestButtonsSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtons"] * 100)
      end
      AAPClassic.OptionsFrame.QuestButtonsSlider:Hide()
    end
  end)

  AAPClassic.OptionsFrame.QuestButtonsCheckButton:Hide()

  AAPClassic.OptionsFrame.QuestButtonsSlider = CreateFrame("Slider", "AAP_QuestButtonsSlider",AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "OptionsSliderTemplate")
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetWidth(160)
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetHeight(15)
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetPoint("TOPLEFT", AAPClassic.OptionsFrame.MainFrame.OptionsGeneral, "TOPLEFT", 20, -240)
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetOrientation("HORIZONTAL")
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetMinMaxValues(1, 200)
  AAPClassic.OptionsFrame.QuestButtonsSlider.minValue, AAPClassic.OptionsFrame.QuestButtonsSlider.maxValue = AAPClassic.OptionsFrame.QuestButtonsSlider:GetMinMaxValues()
  getglobal(AAPClassic.OptionsFrame.QuestButtonsSlider:GetName() .. 'Low'):SetText("1%")
  getglobal(AAPClassic.OptionsFrame.QuestButtonsSlider:GetName() .. 'High'):SetText("200%")
  getglobal(AAPClassic.OptionsFrame.QuestButtonsSlider:GetName() .. 'Text'):SetText("Quest Buttons Scale")
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetValueStep(1)
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetValue(100)
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetScript("OnValueChanged", function(self,event)
    event = event - event%1
    AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtons"] = event / 100
    local CLi
    for CLi = 1, 20 do
      AAPClassic.QuestList2["BF"..CLi]["AAP_Button"]:SetScale(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtons"])
    end
  end)
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetScript("OnMouseWheel", function(self,delta)
    if tonumber(self:GetValue()) == nil then return end
    self:SetValue(tonumber(self:GetValue())+delta)
  end)
  AAPClassic.OptionsFrame.QuestButtonsSlider:SetValue(AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtons"] * 100)
  if (AAPC1[AAPClassic.Realm][AAPClassic.Name]["Settings"]["QuestButtonDetatch"] == 1) then
    AAPClassic.OptionsFrame.QuestButtonsSlider:Show()
  else
    AAPClassic.OptionsFrame.QuestButtonsSlider:Hide()
  end






  AAPClassic.OptionsFrame["Button1"] = CreateFrame("Button", "AAP_OptionsButtons1", AAPClassic.OptionsFrame.MainFrame, "SecureActionButtonTemplate")
  AAPClassic.OptionsFrame["Button1"]:SetPoint("BOTTOMRIGHT",AAPClassic.OptionsFrame.MainFrame,"BOTTOMRIGHT",-5,5)
  AAPClassic.OptionsFrame["Button1"]:SetWidth(70)
  AAPClassic.OptionsFrame["Button1"]:SetHeight(30)
  AAPClassic.OptionsFrame["Button1"]:SetText("Close")
  AAPClassic.OptionsFrame["Button1"]:SetParent(AAPClassic.OptionsFrame.MainFrame)
  AAPClassic.OptionsFrame.Button1:SetFrameStrata("HIGH")
  AAPClassic.OptionsFrame.Button1:SetNormalFontObject("GameFontNormal")
  AAPClassic.OptionsFrame.Button1ntex = AAPClassic.OptionsFrame.Button1:CreateTexture()
  AAPClassic.OptionsFrame.Button1ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
  AAPClassic.OptionsFrame.Button1ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button1ntex:SetAllPoints()
  AAPClassic.OptionsFrame.Button1:SetNormalTexture(AAPClassic.OptionsFrame.Button1ntex)
  AAPClassic.OptionsFrame.Button1htex = AAPClassic.OptionsFrame.Button1:CreateTexture()
  AAPClassic.OptionsFrame.Button1htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
  AAPClassic.OptionsFrame.Button1htex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button1htex:SetAllPoints()
  AAPClassic.OptionsFrame.Button1:SetHighlightTexture(AAPClassic.OptionsFrame.Button1htex)
  AAPClassic.OptionsFrame.Button1ptex = AAPClassic.OptionsFrame.Button1:CreateTexture()
  AAPClassic.OptionsFrame.Button1ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
  AAPClassic.OptionsFrame.Button1ptex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button1ptex:SetAllPoints()
  AAPClassic.OptionsFrame.Button1:SetPushedTexture(AAPClassic.OptionsFrame.Button1ptex)
  AAPClassic.OptionsFrame["Button1"]:SetScript("OnClick", function(self, arg1)
    AAPClassic.OptionsFrame.MainFrame:Hide()
    AAPClassic.SettingsOpen = 0
    AAPClassic.BookingList["ClosedSettings"] = 1
  end)



  AAPClassic.OptionsFrame["Button2"] = CreateFrame("Button", "AAP_OptionsButtons2", AAPClassic.OptionsFrame.MainFrame, "SecureActionButtonTemplate")
  AAPClassic.OptionsFrame["Button2"]:SetPoint("BOTTOMRIGHT",AAPClassic.OptionsFrame.MainFrame,"BOTTOMRIGHT",-185,5)
  AAPClassic.OptionsFrame["Button2"]:SetWidth(100)
  AAPClassic.OptionsFrame["Button2"]:SetHeight(30)
  AAPClassic.OptionsFrame["Button2"]:SetText(AAPC_Locals["Keybinds"])
  AAPClassic.OptionsFrame["Button2"]:SetParent(AAPClassic.OptionsFrame.MainFrame)
  AAPClassic.OptionsFrame.Button2:SetFrameStrata("HIGH")
  AAPClassic.OptionsFrame.Button2:SetNormalFontObject("GameFontNormal")
  AAPClassic.OptionsFrame.Button2ntex = AAPClassic.OptionsFrame.Button2:CreateTexture()
  AAPClassic.OptionsFrame.Button2ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
  AAPClassic.OptionsFrame.Button2ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button2ntex:SetAllPoints()
  AAPClassic.OptionsFrame.Button2:SetNormalTexture(AAPClassic.OptionsFrame.Button2ntex)
  AAPClassic.OptionsFrame.Button2htex = AAPClassic.OptionsFrame.Button2:CreateTexture()
  AAPClassic.OptionsFrame.Button2htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
  AAPClassic.OptionsFrame.Button2htex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button2htex:SetAllPoints()
  AAPClassic.OptionsFrame.Button2:SetHighlightTexture(AAPClassic.OptionsFrame.Button2htex)
  AAPClassic.OptionsFrame.Button2ptex = AAPClassic.OptionsFrame.Button2:CreateTexture()
  AAPClassic.OptionsFrame.Button2ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
  AAPClassic.OptionsFrame.Button2ptex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button2ptex:SetAllPoints()
  AAPClassic.OptionsFrame.Button2:SetPushedTexture(AAPClassic.OptionsFrame.Button2ptex)
  AAPClassic.OptionsFrame["Button2"]:SetScript("OnClick", function(self, arg1)
    KeyBindingFrame_LoadUI()
    KeyBindingFrame:Show()
  end)

  AAPClassic.OptionsFrame["Button3"] = CreateFrame("Button", "AAP_OptionsButtons3", AAPClassic.OptionsFrame.MainFrame, "SecureActionButtonTemplate")
  AAPClassic.OptionsFrame["Button3"]:SetPoint("BOTTOMRIGHT",AAPClassic.OptionsFrame.MainFrame,"BOTTOMRIGHT",-90,5)
  AAPClassic.OptionsFrame["Button3"]:SetWidth(70)
  AAPClassic.OptionsFrame["Button3"]:SetHeight(30)
  AAPClassic.OptionsFrame["Button3"]:SetText("Reset")
  AAPClassic.OptionsFrame["Button3"]:SetParent(AAPClassic.OptionsFrame.MainFrame)
  AAPClassic.OptionsFrame.Button3:SetFrameStrata("HIGH")
  AAPClassic.OptionsFrame.Button3:SetNormalFontObject("GameFontNormal")
  AAPClassic.OptionsFrame.Button3ntex = AAPClassic.OptionsFrame.Button3:CreateTexture()
  AAPClassic.OptionsFrame.Button3ntex:SetTexture("Interface/Buttons/UI-Panel-Button-Up")
  AAPClassic.OptionsFrame.Button3ntex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button3ntex:SetAllPoints()
  AAPClassic.OptionsFrame.Button3:SetNormalTexture(AAPClassic.OptionsFrame.Button3ntex)
  AAPClassic.OptionsFrame.Button3htex = AAPClassic.OptionsFrame.Button3:CreateTexture()
  AAPClassic.OptionsFrame.Button3htex:SetTexture("Interface/Buttons/UI-Panel-Button-Highlight")
  AAPClassic.OptionsFrame.Button3htex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button3htex:SetAllPoints()
  AAPClassic.OptionsFrame.Button3:SetHighlightTexture(AAPClassic.OptionsFrame.Button3htex)
  AAPClassic.OptionsFrame.Button3ptex = AAPClassic.OptionsFrame.Button3:CreateTexture()
  AAPClassic.OptionsFrame.Button3ptex:SetTexture("Interface/Buttons/UI-Panel-Button-Down")
  AAPClassic.OptionsFrame.Button3ptex:SetTexCoord(0, 0.625, 0, 0.6875)
  AAPClassic.OptionsFrame.Button3ptex:SetAllPoints()
  AAPClassic.OptionsFrame.Button3:SetPushedTexture(AAPClassic.OptionsFrame.Button3ptex)
  AAPClassic.OptionsFrame["Button3"]:SetScript("OnClick", function(self, arg1)
    AAPClassic.ResetSettings()
  end)




end



