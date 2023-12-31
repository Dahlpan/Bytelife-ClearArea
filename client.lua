local AreasToClear = {
	{x = -1235.54, y = 833.6, z = 192.89, r = 30.00}, --X, Y, Z = Vector3 and R = Radius
}

Citizen.CreateThread(function()
    while true do
        local myCoords = GetEntityCoords(PlayerPedId())
		local sleep = true

		for k,v in ipairs(AreasToClear) do
			if GetDistanceBetweenCoords(myCoords, v.x, v.y, v.z, true) <= 200 then
				sleep = false
				ClearAreaOfPeds(v.x, v.y, v.z, v.r, true)
				ClearAreaOfVehicles(v.x, v.y, v.z, v.r, true)
			end
		end

		Citizen.Wait(2500)
		if sleep then
			Citizen.Wait(12500)
		end
    end
end)