ESX = exports['es_extended']:getSharedObject()

require('config')

RegisterServerEvent('pickpocketNotification')
AddEventHandler('pickpocketNotification', function()
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    TriggerClientEvent('ox_inventory:disarm', playerId, noAnim)
    TriggerClientEvent('notifyPick', playerId)
end)

RegisterServerEvent('pickpocketItem')
AddEventHandler('pickpocketItem', function()
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    local itemsTable = PickPocketTabel

    local randomIndex = math.random(1, #itemsTable)
    local GivenItem = itemsTable[randomIndex]

    exports.ox_inventory:AddItem(playerId, GivenItem, 1, nil, false)
end)