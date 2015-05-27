
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    -- Don't forget to include your character's custom assets!
    Asset( "ANIM", "anim/pab.zip" ),

    -- Sound assetss
    Asset( "SOUNDPACKAGE", "sound/farts.fev"),
    Asset( "SOUND", "sound/farts.fsb"),
}
local prefabs = {}

local function common_postinit(inst)
	
	-- choose which sounds this character will play
	inst.soundsname = "wolfgang"

	-- a minimap icon must be specified
	inst.MiniMapEntity:SetIcon( "wilson.png" )

	-- todo: Add an example special power here.
end


local function master_postinit(inst)
    inst:AddComponent("farter") -- Maintenant que j'ai fait le prefab fartcloud, ça vaudrait le coup de prendre un periodicspawner  (cf prefab/beefalo)
    -- Non, pas de periodicspawner, parce que ça sert à ne pas surcharger une zone en entités, ce n'est pas ce qu'on veut ici.
    --inst.components.farter:SetTimes(2,3) -- 2 + rand()*3
    inst.components.farter:Start()
    -- TODO: surveiller la transformation en ghost et farter:Stop()
    -- TODO: surveiller l'état de combat : plus de pets en combat ??? ;-)
end


return MakePlayerCharacter("pab", prefabs, assets, common_postinit, master_postinit)
