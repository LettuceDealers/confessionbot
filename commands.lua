local module = {}

local config = require("config")
local db = require("db")

function getRandomColor()
	local r = math.random(5, 255)
    local g = math.random(5, 255)
    local b = math.random(5, 255)
	return _G["Discordia"].Color.fromRGB(r,g,b).value
end

module.Commands = {
	["Confess"] = {
		["Name"] = "Confess",
		["Description"] = "Submit a new confession.",
		["Register"] = function(tools,myName,myDesc)
			slashCommand = tools.slashCommand(myName,myDesc)
			option = tools.string("confession", "The confession text")
			  option = option:setRequired(true)
			slashCommand = slashCommand:addOption(option)
			return slashCommand
		end,
		["Execute"] = function(interaction,command,arguments)
			local myNum = tostring(config.confessionNumber)
			local SendServer = _G["Client"]:getGuild(config.config.confessionGuildId)
			local SendChannel = SendServer:getChannel(config.config.ConfessionChannelId)
			confessionembed = {
				title = "Confession #"..myNum..,
				description = [["]]..arguments.confession..[["]],
				footer = {text="If this confession breaks the rules, please ask a staff member to delete it."},
				color = getRandomColor(),
			}
			SendChannel:send{embed=confessionembed,}
			interaction:reply("Your confession has been added!",true)
			config.confessionNumber = config.confessionNumber+1
			db.update()
			return
		end,
	},
	["About"] = {
		["Name"] = "About",
		["Description"] = "Information about the bot.",
		["Register"] = function(tools,myName,myDesc)
			slashCommand = tools.slashCommand(myName,myDesc)
			return slashCommand
		end,
		["Execute"] = function(interaction,command,arguments)
			local myNum = tostring(config.confessionNumber)
			interaction:reply("A simple, anonymous confession bot made by lettuce! -# [Github Repo](https://github.com/LettuceDealers/confessionbot)",true)
			return
		end,
	},
}


return module