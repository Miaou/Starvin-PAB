-- Amis de la poésie...
-- Don't forget to add it in modmain.lua

local assets =
{
	Asset("ANIM", "anim/fart.zip"),
}

-- Animation is shown in a new entity, as the placement of the Prefab() starts the animation before the rotation is taken into account (--> glitch)
local function PlayAnim(proxy)
	local inst = CreateEntity()

    inst:AddTag("FX")
    --inst.AddTag("NOCLICK") -- ???

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    
    inst.Transform:SetFromProxy(proxy.GUID)

    inst.AnimState:PlayAnimation("popping") -- Rotation is set before PlayAnimation, otherwise a first mis-rotated frame appears --> PlayAnimation proxy
    --inst.AnimState:SetFinalOffset(-1) --effects of that ???
    --inst.AnimState:SetOrientation( ANIM_ORIENTATION.OnGround )
    inst.AnimState:SetBank("FCloud")
    inst.AnimState:SetBuild("fart")
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
    
    inst.SoundEmitter:PlaySound("farts/characters/pab/fart")

    inst:ListenForEvent("animover", inst.Remove)

    return inst
end

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddNetwork() -- The cloud needs the network to exchange its state
    inst.Transform:SetFourFaced()

    -- FX should not be played on dedicated server... but that complicates a thing or two...
    --inst.AnimState:PlayAnimation("popping") -- Rotation is set before PlayAnimation, otherwise a first mis-rotated frame appears --> PlayAnimation proxy
    --inst.SoundEmitter:PlaySound("farts/characters/pab/fart")

    inst:DoTaskInTime(0, PlayAnim)
    inst.entity:SetPristine()
    
    -- Cette inst n'est jamais détruite ???

    return inst
end

return Prefab("common/fx/fartcloud", fn, assets)