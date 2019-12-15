# Redem-Score

RedM Script By MidasCE

Simple code to update the user score to database. All you need to do is add `ensure redem-score` in server.cfg after redem_roleplay and run sql file to your sql database.

Dependencies : 

https://github.com/RedEM-RP/redem_roleplay 

# Example use case (Client side)


```
  -- When player is dead.
  TriggerServerEvent("character_score:updateDeathScore")`-- This will increment death count (+1)

  -- Check that if player kill himself or not
  
	local ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
	local killerped = GetPedSourceOfDeath(ped)
	local killerid = GetPlayerServerId(NetworkGetPlayerIndexFromPed(killerped))
	local pedId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))

  -- If player didn't kill himself -> update the kill count to database
	if pedId ~= killerid then
			TriggerServerEvent("character_score:updateKillScore", killerid)
	end
```
