---@author Dezel

Menu_Ammunation = {}

function Menu_Ammunation:main()

	local coords = GetEntityCoords(PlayerPedId())
	local main = RageUI.CreateMenu("", "Armurerie de L.S", 0,0, "banner", "ammunation");
	local weapon_white = RageUI.CreateSubMenu(main, "", "Armurerie de L.S", 0,0, "banner", "ammunation");
	local weapon_black = RageUI.CreateSubMenu(main, "", "Armurerie de L.S", 0,0, "banner", "ammunation");
	local license = RageUI.CreateSubMenu(main, "", "Armurerie de L.S", 0,0, "banner", "ammunation");

	RageUI.Visible(main, not RageUI.Visible(main))

	while main do

		local dst = #(coords - GetEntityCoords(PlayerPedId()))
		if (dst > 5.0) then
			RageUI.CloseAll()
		end

		Citizen.Wait(0)

		RageUI.IsVisible(main, function()
			RageUI.Button("→ Armes blanches", nil, {}, true, {}, weapon_white)
			RageUI.Button("→ Armes à feux", nil, {}, true, {}, weapon_black)
		end)

		RageUI.IsVisible(weapon_white, function()
			for _, v in pairs(Cfg_Ammunation.Menu.Category.Weapon_White) do
				RageUI.Button(("→ %s"):format(v.weapon_label), ("Prix : ~g~%s$"):format(v.price), {RightBadge = RageUI.BadgeStyle.Gun}, true, {
					onSelected = function()
						TriggerServerEvent("ammunation:buy_weapon", {label = v.weapon_label, name = v.weapon_name}, v.price)
					end
				})
			end
		end)

		RageUI.IsVisible(weapon_black, function()
			for _, v in pairs(Cfg_Ammunation.Menu.Category.Weapon_Black) do
				RageUI.Button(("→ %s"):format(v.weapon_label), ("Prix : ~g~%s$"):format(v.price), {RightBadge = RageUI.BadgeStyle.Gun}, true, {
					onSelected = function()
						TriggerServerEvent("ammunation:buy_weapon", {label = v.weapon_label, name = v.weapon_name}, v.price)
					end
				})
			end
		end)

		if not RageUI.Visible(main) and not RageUI.Visible(weapon_white) and not RageUI.Visible(weapon_black) and not RageUI.Visible(license) then
			main = RMenu:DeleteType('main', true)
			weapon_white = RMenu:DeleteType('weapon_white', true)
			weapon_black = RMenu:DeleteType('weapon_black', true)
			license = RMenu:DeleteType('license', true)
		end
	end
end