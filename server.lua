RegisterNetEvent('negozio:compra')
AddEventHandler('negozio:compra', function(id, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    for key, value in pairs(Config.items) do
        if value.id == id then
            if xPlayer.getMoney() >= (value.price * quantity) then
                xPlayer.addInventoryItem(id, quantity)
                xPlayer.removeInventoryItem('money', value.price * quantity)
            else
                xPlayer.showNotification(Config.NotificaNoSoldi)
            end
        end
    end
end)