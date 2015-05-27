-- A Periodic Farter

local Farter = Class(function(self, inst)
	self.inst = inst

	self.minTime = 5
	self.delta = 30
	self.task = nil
	--self:Start()
end)

-- Fonction à appeler régulièrement
function Farter:DoFart()
	if self.inst.fart ~= nil then
		self.inst.fart:Remove()
	end
	self.inst.fart = SpawnPrefab("fartcloud") --self.inst:SpawnChild("fartcloud") -- Not SpawnChild because the child follows the leader...
	if self.inst.fart ~= nil then
		local x, y, z = self.inst.Transform:GetWorldPosition()
		self.inst.fart.Transform:SetPosition(x,y+.4,z)
		self.inst.fart.Transform:SetRotation(self.inst.Transform:GetRotation())
		--print('Heading angle '..self.inst.Transform:GetRotation()) -- Pas pratique
	else
		print('Fartcloud not spawned')
	end
	self:Start()
end

function Farter:Start()
	if self.task then
		self:Stop()
	end

	-- wat'mil moyens de se faire appeler
	-- Commençons simple,
	self.task = self.inst:DoTaskInTime(self.minTime+math.random()*self.delta,
									   function() self:DoFart() end)
	-- Pour faire plus compliquer, on peut faire des events listener et enregistrer la classe dans inst:StartUpdatingComponent (cf components/wisecracker), et il faudra générer l'event
end

function Farter:Stop()
	if self.task then
		self.task:Cancel()
		self.task = nil
	end
end

function Farter:SetTimes(minTime, maxTime)
	self.minTime = minTime
	self.delta = maxTime-minTime
	if self.task then self:Start() end
end

return Farter