require("simutil")
require("tuning")
local _The_Net = GLOBAL.TheNet
local _The_Sim = GLOBAL.TheSim

local TagNames = {
    "moose",
    "drogonfly",
    "deerclops",
    "mutateddeerclops",
    "bearger",
    "mutatedbearger",
    "klaus",
    "rook",
    "stalker_atrium",
    "sharkboi",
    "alterguardian_phase1",
    "alterguardian_phase2",
    "alterguardian_phase3",
    "gingerbreadwarg",
    "shark",
    "crabking",
    "warg",
    "mutatedwarg",
    "twinofterror1",
    "eyeofterror",
    "leif_sparse",
    "leif",
    "toadstool",
    "toadstool_dark",
    "koalefant_summer",
    "koalefant_winter",
    "antlion",
    "spiderqueen",
    "malbatross",
    "spat",
    "minotaur",
    "daywalker",
    "daywalker2",
    "hound",
    "firehound",
    "icehound",
    "mutatedhound",
    "houndcorpse",
    "walrus"
}

local RADIUS = GetModConfigData("radius")

local MUST_ONE_OF_TAGS = { "largecreature", "monster" }

local function GetTagName(inst)
    for k in pairs(TagNames) do
        local tag = TagNames[k]
        if inst:HasTag(tag) then
            return tag
        end
    end
end

local function FindNearestBoss(inst, radius, mustTags, cantTags, mustOneOfTags)
    local x, y, z = inst.Transform:GetWorldPosition()
    return _The_Sim:FindEntities(x, y, z, radius, mustTags, cantTags, mustOneOfTags)
end
local function FindBoss(inst, tag)
    return FindNearestBoss(inst, RADIUS, tag, nil, MUST_ONE_OF_TAGS)
end
AddPrefabPostInitAny(function(inst)
    if inst == nil then
        return
    end
    local tagName = GetTagName(inst)
    if tagName == nil then
        return
    end
    local name = inst.name
    if name == nil then
        return
    end
    if name ~= "MISSING NAME" then
        if inst:HasTag("monster") then
            _The_Net:Announce(name .. "正在逼近......")
        end
    end
    local ents = FindBoss(inst, tagName)
    if ents == nil then
        return
    end
    _The_Net:Announce(name .. "正在逼近......")
end)
