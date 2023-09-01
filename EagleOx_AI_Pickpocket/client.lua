local ESX = exports['es_extended']:getSharedObject()
local isPickpocketing = false

exports.ox_target:addGlobalPed({
    {
        label = 'Pickpocket',
        icon = 'fa-solid fa-user-ninja',
        iconColor = 'Red',
        onSelect = function()
            if not isPickpocketing then
                isPickpocketing = true
                TriggerServerEvent('pickpocketNotification')
                lib.progressCircle({
                    duration = 5000,
                    label = 'Pick Pocketing...',
                    position = 'bottom',
                    useWhileDead = false,
                    allowCuffed = false,
                    canCancel = true,
                    anim = {
                        dict = 'mini@repair',
                        clip = 'fixing_a_player',
                        duration = 5000
                    },
                })
                TriggerServerEvent('pickpocketItem')
                SetCooldown()
            else
                lib.notify({
                    title = 'Cooldown',
                    description = 'You must wait before pickpocketing again.',
                    position = 'top',
                    duration = 3000,
                    style = {
                        backgroundColor = '#141517',
                        color = '#C1C2C5',
                        ['.description'] = {
                            color = '#909296'
                        }
                    },
                    icon = 'clock',
                    iconColor = '#eb4034'
                })
            end
        end
    }
})

function SetCooldown()
    Citizen.CreateThread(function()
        Citizen.Wait(60000) -- 60 seconds cooldown
        isPickpocketing = false
    end)
end
