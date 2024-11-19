
local HardBan = {
	4603131888,
	2662429331,
	5041427384,
	1713837623,
	1549288505,
	4883452764,
	4748033327,
	4526342082,
	3726410772,
	4667788005,
}

local BanirAmigos = {
        4603131888,
	2662429331,
	5041427384,
	1713837623,
	1549288505,
	4883452764,
	4748033327,
	4526342082,
	4667788005,
}


local RemoverBan = {}
local BanAoVivo = 2500254940


local BanData = game:GetService("DataStoreService"):GetDataStore("Bans")

game.ReplicatedStorage.BanData.OnServerEvent:Connect(function(player)
	if game["Run Service"]:IsStudio() then
		local success,errormessage = pcall(function()
			BanData:SetAsync(BanAoVivo,false)
		end)
	end
end)

game.Players.PlayerAdded:Connect(function(Player)
	local userid = Player.UserId

	if table.find(HardBan,Player.UserId) then
		Player:Kick("Você foi banido a mão por um Developer. Contate um DEV no discord.")
	end

	local Sucess,BanData,errormessage = pcall(function()
		return BanData:GetAsync(userid,false)
	end)


	for i,v in pairs(BanirAmigos) do
		if Player:IsFriendsWith(v) then
			Player:Kick("Você está na blacklist, contate um DEV no Discord.")
		end
	end

end)
