ESX = exports.es_extended:getSharedObject()
local display = false

RegisterNetEvent('setdisplay')
AddEventHandler('setdisplay', function(bool) 
    display = bool     
    SetNuiFocus(bool, bool)     
    SendNUIMessage({ type = "ui",  status = bool, items = Config.items })
end )



RegisterNUICallback('esci', function()
    TriggerEvent('setdisplay', false)
end)

RegisterNUICallback('main', function(obj)
    TriggerServerEvent('negozio:compra', obj.id, obj.quantity)
    TriggerEvent('setdisplay', false)
end)



    local options = {
        {
            icon = 'fa-solid fa-burger',
            label = 'Negozietto',
            onSelect = function()
                CreateThread(function()
                    TriggerEvent('setdisplay', true)
                    while display do 
                        DisableControlAction(0,1, display)
                        DisableControlAction(0,142, display)
                        DisableControlAction(0,18, display)
                        DisableControlAction(0,322, display)
                        DisableControlAction(0,2, display)
                        DisableControlAction(0,106, display)
                        Wait(0)
                    end
                end)
            end,
        },   
    }


    


Citizen.CreateThread(function()
   

    npc = CreatePed(4, Config.modelloNPC, Config.PosizioneNPC, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    exports.ox_target:addLocalEntity(npc, options)
end)





