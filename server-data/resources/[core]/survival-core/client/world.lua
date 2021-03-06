
-- CONFIG
local weather = 'EXTRASUNNY'
local time 	  = 20
local enable = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsSessionStarted() then
			Runit()
			return
		end
	end
end)

function Runit()
	NetworkSetFriendlyFireOption(true)
	SetBlackout(false)
end

function SetPersistentTimeHours(hours)
	NetworkOverrideClockTime(hours, 0, 0)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if enable then
			SetWeatherTypePersist(weather)
			SetWeatherTypeNowPersist(weather)
			SetWeatherTypeNow(weather)
			SetOverrideWeather(weather)
			SetPersistentTimeHours(time)

			SetIgnoreLowPriorityShockingEvents(PlayerId(), true)
			SetPoliceIgnorePlayer(PlayerId(), true)
			SetDispatchCopsForPlayer(PlayerId(), false)
			SetMaxWantedLevel(0)
			SetPlayerWantedLevel(PlayerId(), 0, false)
			SetPlayerWantedLevelNow(PlayerId(), false)

			SetVehicleDensityMultiplierThisFrame(0.0)
			SetPedDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			SetRandomVehicleDensityMultiplierThisFrame(0.0)
			SetParkedVehicleDensityMultiplierThisFrame(0.0)
			SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
			ResetPlayerStamina(PlayerId())

			SetCanAttackFriendly(PlayerPedId(), true, true)
		end
	end
end)

CreateThread(function()
	SetDeepOceanScaler(0.0)
	local islandLoaded = false
	local islandCoords = vector3(6009.33, -1937.62, 8.0)
	while true do
		Wait(5000)
		if enable then
			local pCoords = GetEntityCoords(PlayerPedId())
			if #(pCoords - islandCoords) < 25000.0 then
				Citizen.InvokeNative(0x9A9D1BA639675CF1, "HeistIsland", 1)
				Citizen.InvokeNative(0xF74B1FFA4A15FBEA, 1)
			end
		end
	end
end)
 
Citizen.CreateThread(function()
  SetDeepOceanScaler(0.0)
end)

