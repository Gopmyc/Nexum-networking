function lovr.load(tArgs)
	assert((tArgs[1] == "SERVER") or (tArgs[1] == "CLIENT"), "error: First argument must be either 'SERVER' or 'CLIENT', use : ./Nexum.exe 'SERVER' or : ./Nexum.exe 'CLIENT'")
	SERVER	= (tArgs[1] == "SERVER")
	CLIENT	= (tArgs[1] == "CLIENT")

	Nexum = require("srcs")

	-- TODO : Add the option to listen on events
	if SERVER then
		local tServer	= Nexum:Instanciate("networking", "server")

		for sID, tClient in pairs(tServer.CLIENTS) do
			tServer:SendToClient(sID, tServer:BuildPacket("message-id-test", "Hello friend !", false, true))
		end
	elseif CLIENT then
		local tClient	= Nexum:Instanciate("networking", "client")

		tClient:AddHook("message-id-test", function(Data)
			print("Received from server :", Data, type(Data))
			tClient:SendToServer(tClient:BuildPacket("message-id-test", "Hello server friend !", true, true))
		end)
	end
end

function lovr.update(iDeltaTime)
	Nexum:Update(iDeltaTime)
end

function lovr.draw(Pass)
	Nexum:Draw(Pass)
end

function lovr.quit()
	Nexum:Quit()
end

