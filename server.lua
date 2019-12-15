RegisterServerEvent("character_score:updateDeathScore")
AddEventHandler("character_score:updateDeathScore", function() 
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")
        TriggerEvent("character_score:isHaveScore", identifier, charid, function(isHave)
            if isHave then
                MySQL.Async.execute("UPDATE character_score SET `death`=`death`+1 WHERE `identifier`=@identifier AND `characterid`=@charid", {identifier = identifier, charid = charid}, function(done)
                    end)
            else
                MySQL.Async.execute('INSERT INTO character_score (`identifier`, `characterid`, `kill`, `death`, `score`) VALUES (@identifier, @characterid, @kill, @death, @score);',
                {
                    identifier = identifier,
                    characterid = charid,
                    kill = 0,
                    death = 1,
                    score = 0
                }, function(rowsChanged)
                    end)
            end
        end)
    end)
end)

RegisterServerEvent("character_score:updateKillScore")
AddEventHandler("character_score:updateKillScore", function(playerId) 
    local _source = source
    TriggerEvent('redemrp:getPlayerFromId', playerId, function(user)
        local identifier = user.getIdentifier()
        local charid = user.getSessionVar("charid")
        TriggerEvent("character_score:isHaveScore", identifier, charid, function(isHave)
            if isHave then
                MySQL.Async.execute("UPDATE character_score SET `kill`=`kill`+1 WHERE `identifier`=@identifier AND `characterid`=@charid", {identifier = identifier, charid = charid}, function(done)
                    end)
            else
                MySQL.Async.execute('INSERT INTO character_score (`identifier`, `characterid`, `kill`, `death`, `score`) VALUES (@identifier, @characterid, @kill, @death, @score);',
                {
                    identifier = identifier,
                    characterid = charid,
                    kill = 1,
                    death = 0,
                    score = 0
                }, function(rowsChanged)
                    end)
            end
        end)
    end)
end)

AddEventHandler('character_score:isHaveScore', function(identifier, charid, callback)
    local Callback = callback
    MySQL.Async.fetchAll('SELECT * FROM character_score WHERE `identifier`=@identifier AND `characterid`=@charid;', {identifier = identifier, charid = charid}, function(score)
        if score[1] then
            Callback(score[1])
        else
            Callback(false)
        end
    end)
end)
