--[[
    Appreciate what others people do. (c) Usoltsev

    Copyright (c) <2016-2017>, Usoltsev <alexander.usolcev@gmail.com> All rights reserved.

    Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
    Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    Neither the name of the <EasyFrames> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
    THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
    INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
    OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
    OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--]]

local EasyFrames = LibStub("AceAddon-3.0"):GetAddon("EasyFrames")
local L = LibStub("AceLocale-3.0"):GetLocale("EasyFrames")
local Media = LibStub("LibSharedMedia-3.0")

local MODULE_NAME = "Pet"
local Pet = EasyFrames:NewModule(MODULE_NAME, "AceHook-3.0")
local db
local originalValues = {}

function Pet:OnInitialize()
    self.db = EasyFrames.db
    db = self.db.profile
end

function Pet:OnEnable()
    self:SetScale(db.pet.scaleFrame)
    self:PreSetMovable()
    self:SetMovable(db.pet.lockedMovableFrame)

    self:ShowName(db.pet.showName)
    self:ShowHitIndicator(db.pet.showHitIndicator)

    self:ShowStatusTexture(db.pet.showStatusTexture)
    self:ShowAttackBackground(db.pet.showAttackBackground)
    self:SetAttackBackgroundOpacity(db.pet.attackBackgroundOpacity)

    self:SecureHook("PetFrame_Update", "PetFrameUpdate")
end

function Pet:OnProfileChanged(newDB)
    self.db = newDB
    db = self.db.profile

    self:SetScale(db.pet.scaleFrame)
    self:PreSetMovable()
    self:SetMovable(db.pet.lockedMovableFrame)

    self:ShowName(db.pet.showName)
    self:ShowHitIndicator(db.pet.showHitIndicator)

    self:ShowStatusTexture(db.pet.showStatusTexture)
    self:ShowAttackBackground(db.pet.showAttackBackground)
    self:SetAttackBackgroundOpacity(db.pet.attackBackgroundOpacity)
end


function Pet:GetOriginalValues()
    originalValues["PetHitIndicator"] = PetHitIndicator.SetText

    originalValues["PetAttackModeTexture"] = PetAttackModeTexture.Show
    originalValues["PetFrameFlash"] = PetFrameFlash.Show
end

function Pet:PetFrameUpdate(frame, override)
    if ((not PlayerFrame.animating) or (override)) then
        if (UnitIsVisible(frame.unit)) then
            if (frame:IsShown()) then
                UnitFrame_Update(frame);
            else
                frame:Show();
            end
            --frame.flashState = 1;
            --frame.flashTimer = PET_FLASH_ON_TIME;
            if (UnitPowerMax(frame.unit) == 0) then
                PetFrameTexture:SetTexture(Media:Fetch("frames", "nomana"));
                PetFrameManaBarText:Hide();
            else
                PetFrameTexture:SetTexture(Media:Fetch("frames", "smalltarget"));
            end
            PetAttackModeTexture:Hide();

			PetFrame_SetHappiness(frame);
			RefreshDebuffs(frame, frame.unit);
            if (db.pet.customPoints) then
                frame:ClearAllPoints()
                frame:SetPoint(unpack(db.pet.customPoints))
            end
        else
            frame:Hide();
        end
    end
end

function Pet:SetScale(value)
    PetFrame:SetScale(value)
end

function Pet:PreSetMovable(points)
    local frame = PetFrame

    frame:SetScript("OnMouseDown", function(frame, button)
        if not db.pet.lockedMovableFrame and button == "LeftButton" and not frame.isMoving then
            frame:StartMoving();
            frame.isMoving = true;
        end
    end)
    frame:SetScript("OnMouseUp", function(frame, button)
        if not db.pet.lockedMovableFrame and button == "LeftButton" and frame.isMoving then
            frame:StopMovingOrSizing();
            frame.isMoving = false;

            db.pet.customPoints = {frame:GetPoint()}
        end
    end)
    frame:SetScript("OnHide", function(frame)
        if ( not db.pet.lockedMovableFrame and frame.isMoving ) then
            frame:StopMovingOrSizing();
            frame.isMoving = false;
        end
    end)
end

function Pet:SetMovable(value)
    PetFrame:SetMovable(not value)
end

function Pet:ResetFramePosition()
    local frame = PetFrame;

    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 60, -90)

    db.pet.customPoints = false
end

function Pet:ShowName(value)
    if (value) then
        PetName:Show()
    else
        PetName:Hide()
    end
end

function Pet:ShowHitIndicator(value)
    if (value) then
        PetHitIndicator.SetText = originalValues["PetHitIndicator"]
    else
        PetHitIndicator:SetText(nil)
        PetHitIndicator.SetText = function() end
    end
end

function Pet:ShowStatusTexture(value)
    local noop = function() return end

    local frame = PetAttackModeTexture

    if frame then
        if frame then
            if (value) then
                frame.Show = originalValues[frame:GetName()]

                if (UnitAffectingCombat("player")) then
                    frame:Show()
                end
            else
                frame:Hide()
                frame.Show = noop
            end
        end
    end
end

function Pet:ShowAttackBackground(value)
    local noop = function() return end

    local frame = PetFrameFlash

    if frame then
        if (value) then
            frame.Show = originalValues[frame:GetName()]

            if (UnitAffectingCombat("player")) then
                frame:Show()
            end
        else
            frame:Hide()
            frame.Show = noop
        end
    end
end

function Pet:SetAttackBackgroundOpacity(value)
    PetFrameFlash:SetAlpha(value)
end