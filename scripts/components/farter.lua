-- A Periodic Farter

local Farter = Class(function(self, inst)
	self.inst = inst

	-- wat'mil moyens de se faire appeler
	-- Commençons simple,
	self.task = self.inst:DoPeriodicTask(10, function() self:DoRandomFart() end)
	-- Pour faire plus compliquer, on peut faire des events listener et enregistrer la classe dans inst:StartUpdatingComponent (cf components/wisecracker), et il faudra générer l'event
end)

function Farter:DoRandomFart()
	if math.random() < 0.9 then
		-- On peut imaginer une petite animation, et il faudra déplacer tout ça dans un prefab dans ce cas (cf prefabs/flies)
		self.inst.SoundEmitter:PlaySound("farts/characters/pab/fart")
	end
end

return Farter