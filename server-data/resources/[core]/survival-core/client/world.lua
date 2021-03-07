
-- CONFIG
local weather = 'FOGGY'
local time 	  = 20
local enable = false
local blackout = false

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
	SetBlackout(blackout) 
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

-- CONFIG --

-- The watermark text --
servernames = "Early Alpha - https://discord.gg/76gHv5PFHp"

-- The x and y offset (starting at the top left corner) --
-- Default: 0.005, 0.001
offsets = {x = 0.449, y = 0.03}

-- Text RGB Color --
-- Default: 64, 64, 64 (gray)
rgb = {r = 255, g = 255, b = 255}

-- Text transparency --
-- Default: 255
alpha = 255

-- Text scale
-- Default: 0.4
-- NOTE: Number needs to be a float (so instead of 1 do 1.0)
scales = 0.35

-- Text Font --
-- 0 - 5 possible
-- Default: 1
font = 4

-- Rainbow Text --
-- false: Turn off
-- true: Activate rainbow text (overrides color)
bringontherainbows = false

-- CODE --
Citizen.CreateThread(function()
	while true do
		Wait(1)

		if bringontherainbows then
			rgb = RGBRainbow(1)
		end
		SetTextColour(rgb.r, rgb.g, rgb.b, alpha)

		SetTextFont(font)
		SetTextScale(scales, scales)
		SetTextWrap(0.0, 1.0)
		SetTextCentre(false)
		SetTextDropshadow(2, 2, 0, 0, 0)
		SetTextEdge(1, 0, 0, 0, 205)
		SetTextEntry("STRING")
		AddTextComponentString(servernames)
		DrawText(offsets.x, offsets.y)
	end
end)

function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end
