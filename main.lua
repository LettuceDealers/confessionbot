local discordia = require('discordia')
local interaction = require("discordia-interactions")
local tools = require("discordia-slash").util.tools()


local commands = require("commands")
local config = require("config")
local db = require("db")

local client = discordia.Client():useApplicationCommands()
local intrType = discordia.enums.interactionType


function RegisterCommands()
	cmdlist = commands.Commands
	for k,v in pairs(cmdlist) do 
		local commandName = k
		local commandDescription = v["Description"]
		client:createGlobalApplicationCommand(v["Register"](tools,commandName,commandDescription))
	end
end

function Initalize()
	local StartTime = os.time()
	_G["Client"] = client
	_G["Discordia"]=discordia
	config.confessionNumber = db.getDatabase()
	discordia.extensions()
	RegisterCommands()
	return os.time()-StartTime
end


client:on('ready', function()
	local intTime = Initalize()
	print("Initalized in "..tostring(intTime)) -- i dont think i have to tostring this but who cares
	print('Logged in as '.. client.user.username)
end)

client:on("slashCommand", function(interaction, command, args)
	for k,v in pairs(commands.Commands) do
		if command.name==k then
			v["Execute"](interaction, command, args)
			return
		end
	end
end)

client:run('Bot '..config.config.Token)