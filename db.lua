local module = {}

--[[
	Database manager.
	This sucks.
]]

local json = require("lib.json")
local config = require("config")
local dbname = config.config.dbName

function exists(file)
	local f = io.open(file, "rb")
	if f then f:close() end
	return f ~= nil
end

function lines_from(file)
  if not exists(file) then return config.config end
  local lines = ""
  for line in io.lines(file) do 
    lines = lines..line
  end
  return lines
end

function module.getDatabase()
	local db = dbname
	local file = db
	local lines = lines_from(file)
	return lines
end

function module.update()
	local db = dbname
	local data = tostring(config.confessionNumber)
	local file = db
	local d = io.open(file, 'w')
	d:write(data)
	d:close()
end

return module