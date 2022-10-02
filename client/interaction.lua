---@author Dezel

Citizen.CreateThread(function()
	while (true) do
		local interval = 1000
		for _, v in pairs(Cfg_Ammunation.Interaction) do
			local dst = #(GetEntityCoords(PlayerPedId()) - v.coords)
			if (dst <= 3.0) then
				interval = 0
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir l'ammunation")
				if (IsControlJustPressed(0,51)) then
					Menu_Ammunation:main()
				end
			end
		end
		Wait(interval)
	end
end)