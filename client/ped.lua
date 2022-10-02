---@author Dezel

Utils_Ammunation = {}

function Utils_Ammunation:request_model(model)
	RequestModel(model)
	while (not HasModelLoaded(model)) do
		Wait(20)
	end
end
function Utils_NewLifeAmmunation:create_ped(position)
	local model <const> = GetHashKey(Cfg_Ammunation.Ped.model)
	Utils_Ammunation:request_model(model)
	local ped = CreatePed("CIVMALE", model, position.coords, position.heading, false, false)
	FreezeEntityPosition(ped, true)
	TaskSetBlockingOfNonTemporaryEvents(ped, true)
	SetEntityInvincible(ped, true)
	TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND", -1, false)
end

Citizen.CreateThread(function()
	for _, v in pairs(Cfg_Ammunation.Interaction) do
		Utils_Ammunation:create_ped(v)
	end
end)