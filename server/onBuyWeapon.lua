---@author Dezel

RegisterNetEvent("ammunation:buy_weapon", function(weapon, price)
	local _src <const> = source
	local xPlayer = ESX.GetPlayerFromId(_src)

	if (xPlayer.getMoney() < price) then
		return (xPlayer.showAdvancedNotification("Banque", "~r~Virement : Erreur", "Le virement vers Ammunation L.S a rencontré une erreur : Vous n'avez pas assez d'argent", "CHAR_BANK_FLEECA", 2))
	end
	if (xPlayer.hasWeapon(weapon.name)) then
		return (xPlayer.showAdvancedNotification("~g~Ammunation", "~g~Achat", ("Achat interrompu : Arme déjà possédé ~n~Arme : %s ~n~Montant : %s$"):format(weapon.label, price), "CHAR_AMMUNATION", 2))
	end
	xPlayer.removeMoney(price)
	xPlayer.addWeapon(weapon.name, 0)
	if (xPlayer.hasWeapon(weapon.name)) then
		xPlayer.showAdvancedNotification("~g~Ammunation", "~g~Achat", ("Achat effectué ~n~Arme : %s ~n~Montant : %s$"):format(weapon.label, price), "CHAR_AMMUNATION", 2)
		return (xPlayer.showAdvancedNotification("Banque", "~g~Virement : Effectué", ("Le virement vers Ammunation L.S a été effectué : Vous avez été débité de %s$"):format(price), "CHAR_BANK_FLEECA", 2))
	end
end)