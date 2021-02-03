ESX = nil



TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



if Config.MaxInService ~= -1 then

  TriggerEvent('esx_service:activateService', 'families', Config.MaxInService)

end



-- TriggerEvent('esx_phone:registerNumber', 'families', _U('alert_families'), true, true)

TriggerEvent('esx_society:registerSociety', 'families', 'Yakuza', 'society_families', 'society_families', 'society_families', {type = 'public'})



RegisterServerEvent('esx_familiesnight:giveWeapon')

AddEventHandler('esx_familiesnight:giveWeapon', function(weapon, ammo)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weapon, ammo)

end)



RegisterServerEvent('esx_familiesnight:confiscatePlayerItem')

AddEventHandler('esx_familiesnight:confiscatePlayerItem', function(target, itemType, itemName, amount)



  local sourceXPlayer = ESX.GetPlayerFromId(source)

  local targetXPlayer = ESX.GetPlayerFromId(target)



  if itemType == 'item_standard' then



    local label = sourceXPlayer.getInventoryItem(itemName).label



    targetXPlayer.removeInventoryItem(itemName, amount)

    sourceXPlayer.addInventoryItem(itemName, amount)



    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confinv') .. amount .. ' ' .. label .. _U('from') .. targetXPlayer.name)

    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confinv') .. amount .. ' ' .. label )



  end



  if itemType == 'item_account' then



    targetXPlayer.removeAccountMoney(itemName, amount)

    sourceXPlayer.addAccountMoney(itemName, amount)



    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confdm') .. amount .. _U('from') .. targetXPlayer.name)

    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confdm') .. amount)



  end



  if itemType == 'item_weapon' then



    targetXPlayer.removeWeapon(itemName)

    sourceXPlayer.addWeapon(itemName, amount)



    TriggerClientEvent('esx:showNotification', sourceXPlayer.source, _U('you_have_confweapon') .. ESX.GetWeaponLabel(itemName) .. _U('from') .. targetXPlayer.name)

    TriggerClientEvent('esx:showNotification', targetXPlayer.source, '~b~' .. targetXPlayer.name .. _U('confweapon') .. ESX.GetWeaponLabel(itemName))



  end



end)



RegisterServerEvent('esx_familiesnight:handcuff')

AddEventHandler('esx_familiesnight:handcuff', function(target)

  TriggerClientEvent('esx_familiesnight:handcuff', target)

end)



RegisterServerEvent('esx_familiesnight:drag')

AddEventHandler('esx_familiesnight:drag', function(target)

  local _source = source

  TriggerClientEvent('esx_familiesnight:drag', target, _source)

end)



RegisterServerEvent('esx_familiesnight:putInVehicle')

AddEventHandler('esx_familiesnight:putInVehicle', function(target)

  TriggerClientEvent('esx_familiesnight:putInVehicle', target)

end)



RegisterServerEvent('esx_familiesnight:OutVehicle')

AddEventHandler('esx_familiesnight:OutVehicle', function(target)

    TriggerClientEvent('esx_familiesnight:OutVehicle', target)

end)



RegisterServerEvent('esx_familiesnight:getStockItem')

AddEventHandler('esx_familiesnight:getStockItem', function(itemName, count)



  local xPlayer = ESX.GetPlayerFromId(source)



  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_families', function(inventory)



    local item = inventory.getItem(itemName)



    if item.count >= count then

      inventory.removeItem(itemName, count)

      xPlayer.addInventoryItem(itemName, count)

    else

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))

    end



    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)



  end)



end)



RegisterServerEvent('esx_familiesnight:putStockItems')

AddEventHandler('esx_familiesnight:putStockItems', function(itemName, count)



  local xPlayer = ESX.GetPlayerFromId(source)



  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_families', function(inventory)



    local item = inventory.getItem(itemName)



    if item.count >= 0 then

      xPlayer.removeInventoryItem(itemName, count)

      inventory.addItem(itemName, count)

    else

      TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))

    end



    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)



  end)



end)



ESX.RegisterServerCallback('esx_familiesnight:getOtherPlayerData', function(source, cb, target)



  if Config.EnableESXIdentity then



    local xPlayer = ESX.GetPlayerFromId(target)



    local identifier = GetPlayerIdentifiers(target)[1]



    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {

      ['@identifier'] = identifier

    })



    local user      = result[1]

    local firstname     = user['firstname']

    local lastname      = user['lastname']

    local sex           = user['sex']

    local dob           = user['dateofbirth']

    local height        = user['height'] .. " Inches"



    local data = {

      name        = GetPlayerName(target),

      job         = xPlayer.job,

      inventory   = xPlayer.inventory,

      accounts    = xPlayer.accounts,

      weapons     = xPlayer.loadout,

      firstname   = firstname,

      lastname    = lastname,

      sex         = sex,

      dob         = dob,

      height      = height

    }



    TriggerEvent('esx_status:getStatus', source, 'drunk', function(status)



      if status ~= nil then

        data.drunk = math.floor(status.percent)

      end



    end)



    if Config.EnableLicenses then



      TriggerEvent('esx_license:getLicenses', source, function(licenses)

        data.licenses = licenses

        cb(data)

      end)



    else

      cb(data)

    end



  else



    local xPlayer = ESX.GetPlayerFromId(target)



    local data = {

      name       = GetPlayerName(target),

      job        = xPlayer.job,

      inventory  = xPlayer.inventory,

      accounts   = xPlayer.accounts,

      weapons    = xPlayer.loadout

    }



    TriggerEvent('esx_status:getStatus', _source, 'drunk', function(status)



      if status ~= nil then

        data.drunk = status.getPercent()

      end



    end)



    TriggerEvent('esx_license:getLicenses', _source, function(licenses)

      data.licenses = licenses

    end)



    cb(data)



  end



end)



ESX.RegisterServerCallback('esx_familiesnight:getFineList', function(source, cb, category)



  MySQL.Async.fetchAll(

    'SELECT * FROM fine_types_families WHERE category = @category',

    {

      ['@category'] = category

    },

    function(fines)

      cb(fines)

    end

  )



end)



ESX.RegisterServerCallback('esx_familiesnight:getVehicleInfos', function(source, cb, plate)



  if Config.EnableESXIdentity then



    MySQL.Async.fetchAll(

      'SELECT * FROM owned_vehicles',

      {},

      function(result)



        local foundIdentifier = nil



        for i=1, #result, 1 do



          local vehicleData = json.decode(result[i].vehicle)



          if vehicleData.plate == plate then

            foundIdentifier = result[i].owner

            break

          end



        end



        if foundIdentifier ~= nil then



          MySQL.Async.fetchAll(

            'SELECT * FROM users WHERE identifier = @identifier',

            {

              ['@identifier'] = foundIdentifier

            },

            function(result)



              local ownerName = result[1].firstname .. " " .. result[1].lastname



              local infos = {

                plate = plate,

                owner = ownerName

              }



              cb(infos)



            end

          )



        else



          local infos = {

          plate = plate

          }



          cb(infos)



        end



      end

    )



  else



    MySQL.Async.fetchAll(

      'SELECT * FROM owned_vehicles',

      {},

      function(result)



        local foundIdentifier = nil



        for i=1, #result, 1 do



          local vehicleData = json.decode(result[i].vehicle)



          if vehicleData.plate == plate then

            foundIdentifier = result[i].owner

            break

          end



        end



        if foundIdentifier ~= nil then



          MySQL.Async.fetchAll(

            'SELECT * FROM users WHERE identifier = @identifier',

            {

              ['@identifier'] = foundIdentifier

            },

            function(result)



              local infos = {

                plate = plate,

                owner = result[1].name

              }



              cb(infos)



            end

          )



        else



          local infos = {

          plate = plate

          }



          cb(infos)



        end



      end

    )



  end



end)



ESX.RegisterServerCallback('esx_familiesnight:getArmoryWeapons', function(source, cb)



  TriggerEvent('esx_datastore:getSharedDataStore', 'society_families', function(store)



    local weapons = store.get('weapons')



    if weapons == nil then

      weapons = {}

    end



    cb(weapons)



  end)



end)



ESX.RegisterServerCallback('esx_familiesnight:addArmoryWeapon', function(source, cb, weaponName)



  local xPlayer = ESX.GetPlayerFromId(source)



  xPlayer.removeWeapon(weaponName)



  TriggerEvent('esx_datastore:getSharedDataStore', 'society_families', function(store)



    local weapons = store.get('weapons')



    if weapons == nil then

      weapons = {}

    end



    local foundWeapon = false



    for i=1, #weapons, 1 do

      if weapons[i].name == weaponName then

        weapons[i].count = weapons[i].count + 1

        foundWeapon = true

      end

    end



    if not foundWeapon then

      table.insert(weapons, {

        name  = weaponName,

        count = 1

      })

    end



     store.set('weapons', weapons)



     cb()



  end)



end)



ESX.RegisterServerCallback('esx_familiesnight:removeArmoryWeapon', function(source, cb, weaponName)



  local xPlayer = ESX.GetPlayerFromId(source)



  xPlayer.addWeapon(weaponName, 1000)



  TriggerEvent('esx_datastore:getSharedDataStore', 'society_families', function(store)



    local weapons = store.get('weapons')



    if weapons == nil then

      weapons = {}

    end



    local foundWeapon = false



    for i=1, #weapons, 1 do

      if weapons[i].name == weaponName then

        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)

        foundWeapon = true

      end

    end



    if not foundWeapon then

      table.insert(weapons, {

        name  = weaponName,

        count = 0

      })

    end



     store.set('weapons', weapons)



     cb()



  end)



end)





ESX.RegisterServerCallback('esx_familiesnight:buy', function(source, cb, amount)



  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_families', function(account)



    if account.money >= amount then

      account.removeMoney(amount)

      cb(true)

    else

      cb(false)

    end



  end)



end)



ESX.RegisterServerCallback('esx_familiesnight:getStockItems', function(source, cb)



  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_families', function(inventory)

    cb(inventory.items)

  end)



end)



ESX.RegisterServerCallback('esx_familiesnight:getPlayerInventory', function(source, cb)



  local xPlayer = ESX.GetPlayerFromId(source)

  local items   = xPlayer.inventory



  cb({

    items = items

  })



end)

