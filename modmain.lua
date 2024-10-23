require("simutil")
local _The_Net = GLOBAL.TheNet
local _The_Sim = GLOBAL.TheSim
-- local _The_Player = GLOBAL.ThePlayer
-- local _The_World = GLOBAL.TheWorld
local TagNames = {
    ["moose"] = { ["en"] = "moose", ["zh"] = "麋鹿鹅" },
    ["drogonfly"] = { ["en"] = "drogonfly", ["zh"] = "龙蝇" },
    ["deerclops"] = { ["en"] = "deerclops", ["zh"] = "独眼巨鹿" },
    ["mutateddeerclops"] = { ["en"] = "mutateddeerclops", ["zh"] = "晶体巨鹿" },
    ["bearger"] = { ["en"] = "bearger", ["zh"] = "熊獾" },
    ["mutatedbearger"] = { ["en"] = "mutatedbearger", ["zh"] = "装甲熊獾" },
    ["klaus"] = { ["en"] = "klaus", ["zh"] = "克劳斯" },
    ["rook"] = { ["en"] = "rook", ["zh"] = "发条战车" },
    ["stalker_atrium"] = { ["en"] = "stalker_atrium", ["zh"] = "远古织影者" },
    ["sharkboi"] = { ["en"] = "sharkboi", ["zh"] = "大霜鲨" },
    ["alterguardian_phase1"] = { ["en"] = "alterguardian_phase1", ["zh"] = "天体英雄一阶段" },
    ["alterguardian_phase2"] = { ["en"] = "alterguardian_phase2", ["zh"] = "天体英雄二阶段" },
    ["alterguardian_phase3"] = { ["en"] = "alterguardian_phase3", ["zh"] = "天体英雄三阶段" },
    ["gingerbreadwarg"] = { ["en"] = "gingerbreadwarg", ["zh"] = "姜饼座狼" },
    ["shark"] = { ["en"] = "shark", ["zh"] = "岩石大白鲨" },
    ["crabking"] = { ["en"] = "crabking", ["zh"] = "帝王蟹" },
    ["warg"] = { ["en"] = "warg", ["zh"] = "座狼" },
    ["mutatedwarg"] = { ["en"] = "mutatedwarg", ["zh"] = "附身座狼" },
    ["twinofterror1"] = { ["en"] = "twinofterror1", ["zh"] = "恐怖之眼" },
    ["eyeofterror"] = { ["en"] = "eyeofterror", ["zh"] = "双子魔眼" },
    ["leif_sparse"] = { ["en"] = "leif_sparse", ["zh"] = "树精守卫" },
    ["leif"] = { ["en"] = "leif", ["zh"] = "树精守卫" },
    ["toadstool"] = { ["en"] = "toadstool", ["zh"] = "毒菌蟾蜍" },
    ["toadstool_dark"] = { ["en"] = "toadstool_dark", ["zh"] = "悲惨毒菌蟾蜍" },
    ["koalefant_summer"] = { ["en"] = "koalefant_summer", ["zh"] = "夏季考拉象" },
    ["koalefant_winter"] = { ["en"] = "koalefant_winter", ["zh"] = "冬季考拉象" },
    ["antlion"] = { ["en"] = "antlion", ["zh"] = "蚁狮" },
    ["spiderqueen"] = { ["en"] = "spiderqueen", ["zh"] = "蜘蛛女王" },
    ["malbatross"] = { ["en"] = "malbatross", ["zh"] = "装甲熊獾" },
    ["spat"] = { ["en"] = "spat", ["zh"] = "钢羊" },
    ["minotaur"] = { ["en"] = "minotaur", ["zh"] = "" },
    ["daywalker"] = { ["en"] = "daywalker", ["zh"] = "梦魇疯猪" },
    ["daywalker2"] = { ["en"] = "daywalker2", ["zh"] = "拾荒疯猪" },
}

local language = GetModConfigData("language")
local RADIUS = GetModConfigData("radius")

local zh_info = "已经刷新在其他地点......"
local zh_info_ext = "已经刷新在你的附近......"
local en_info = "is already spawned nearby."
local en_info_ext = "is already spawned in other place."

local function GetInfo(flag)
    if flag then
        if language then
            return zh_info_ext
        else
            return en_info_ext
        end
    else
        if language then
            return zh_info
        else
            return en_info
        end
    end
end
local function HitTag(inst)
    for k, v in pairs(TagNames) do
        if inst:HasTag(k) then
            return v
        end
    end
end
local function GetTag(v)
    if language then
        return v["zh"]
    else
        return v["en"]
    end
end
local TARGET_MUST_TAGS = { "largecreature" }

local function FindTarget(inst, tag)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = _The_Sim:FindEntities(x, y, z,
        RADIUS,
        function(guy)
            return guy:HasTag(tag)
        end,
        nil,
        TARGET_MUST_TAGS
    )
    return ents and ents ~= nil
end
AddPrefabPostInitAny(function(inst)
    if inst then
        local v = HitTag(inst)
        if v ~= nil then
            local find = FindTarget(inst, v["en"])
            if find and find ~= nil then
                _The_Net:Say(GetTag(v) .. GetInfo(true))
            else
                _The_Net:Say(GetTag(v) .. GetInfo(false))
            end
        end
    end
end)
