local mymodule = {}

fs = require("acf.fs")
date = require("acf.date")
format = require("acf.format")
modelfunctions = require("modelfunctions")

-- ###############################################################
-- Private functions
-- ###############################################################
local function querycmd ( cmdline )
	local cmd_result = modelfunctions.run_executable(format.string_to_table(cmdline, "%s+"))
	if not cmd_result or cmd_result == "" then
		cmd_result = "unknown"
	end
	return cmd_result
end

local function indexversion ( )
	local cmd_result = modelfunctions.run_executable({"apk", "version", "--index"})
	if cmd_result == "" then cmd_result = nil end
	return cmd_result
end

local function diskfree ( media )
	local cmd_result = modelfunctions.run_executable({"df", "-h", media})
	if not cmd_result or cmd_result == "" then
		cmd_result = "unknown"
	end
	return cmd_result
end

local function memusage ()
	local mult = { kB=1024, MB=1048576, GB=1073741824 }
	local fd = io.open("/proc/meminfo")
	local res = {}
	local field, value, unit

	for line in fd:lines() do
		field,value, unit = string.match(line, "([^: ]*):%s*(%d+)%s(%a+)")
		if field ~= nil and value ~= nil then
			res[field] = tonumber(value)
			if unit ~= nil then
				res[field] = res[field] * mult[unit]
			end
		end
	end
	fd:close()

	return res
end

-- ###############################################################
-- Public functions
-- ###############################################################
mymodule.get_system = function (self)
	local system = {}
	local meminfo = memusage()
	system.uptime = cfe({ value=querycmd("uptime"), label="Uptime" })
	system.date = cfe({ value=querycmd("date"), label="Date" })
	local indexver = indexversion()
	system.version = cfe({ value=indexver or fs.read_file("/etc/alpine-release") or "Unknown", label="Version" })
	system.timezone = cfe({ value=date.what_tz(), label="Time Zone" })
	system.uname = cfe({ value=querycmd("uname -a"), label="UName" })
	system.memory = cfe({ value=querycmd("free"), label="Memory usage" })
	system.memory.free = math.floor(100 * meminfo["MemFree"] / meminfo["MemTotal"])
	system.memory.buffers = math.floor(100 * (meminfo["Buffers"] + meminfo["Cached"]) / meminfo["MemTotal"])
	system.memory.used = 100 - math.floor(100 * (meminfo["MemFree"] + meminfo["Buffers"] + meminfo["Cached"]) / meminfo["MemTotal"])
	return cfe({ type="group", value=system, label="System" })
end

mymodule.get_storage = function (self)
	local storage = {}
	local disk = diskfree() .. "\n"
	local other = {}
	local lines = format.string_to_table(disk, "\n")
	local i = 1 -- skip the first line
	while i < #lines do
		i = i+1
		line = lines[i] or ""
		if lines[i+1] and string.match(lines[i+1], "^%s") then
			i = i+1
			line = line .. "\n" .. lines[i]
		end
		if string.match(line, "^/dev/fd%d+") then
			if not storage.floppy then
				storage.floppy = cfe({ type="group", value={}, label="Floppy drives" })
			end
			local name = string.match(line, "^(/dev/fd%d+)")
			storage.floppy.value[name] = cfe({ value=string.match(disk, "[^\n]*\n")..line, label="Floppy Capacity" })
			storage.floppy.value[name].used = string.match(line, name.."%s*%S*%s*%S*%s*%S*%s*(%S*)%%")
		elseif string.match(line, "^/dev/none") or string.match(line, "^tmpfs") then
			if not storage.ramdisk then
				storage.ramdisk = cfe({ type="group", value={}, label="RAM disks" })
			end
			local name = string.match(line, "^(%S+)")
			storage.ramdisk.value[name] = cfe({ value=string.match(disk, "[^\n]*\n")..line, label="RAM Disk Capacity" })
			storage.ramdisk.value[name].used = string.match(line, name.."%s*%S*%s*%S*%s*%S*%s*(%S*)%%")
		elseif string.match(line, "^/dev/") and not string.match(line, "^/dev/cdrom") and not string.match(line, "^/dev/loop") then
			if not storage.hd then
				storage.hd = cfe({ type="group", value={}, label="Hard drives" })
			end
			local name = string.match(line, "^(%S+)")
			storage.hd.value[name] = cfe({ value=string.match(disk, "[^\n]*\n")..line, label="Hard Drive Capacity" })
			storage.hd.value[name].used = string.match(line, name.."%s*%S*%s*%S*%s*%S*%s*(%S*)%%")
		end
	end
	storage.partitions = cfe({ value=fs.read_file("/proc/partitions") or "", label="Partitions" })
	return cfe({ type="group", value=storage, label="Storage" })
end

mymodule.get_network = function (self)
	local network = {}
	network.interfaces = cfe({ value=querycmd("ip addr"), label="Interfaces" })
	network.routes = cfe({ value=querycmd("ip route"), label="Routes" })
	network.tunnel = cfe({ value=querycmd("ip tunnel"), label="Tunnels" })
	return cfe({ type="group", value=network, label="Network" })
end

mymodule.get_proc = function (self)
	local proc = {}
	proc.processor = cfe({ value=fs.read_file("/proc/cpuinfo") or "", label="Processor" })
	proc.memory = cfe({ value=fs.read_file("/proc/meminfo") or "", label="Memory" })
	proc.model = cfe({ value=querycmd("sed -n 5p /proc/cpuinfo") or "", label="CPU Model" })
	return cfe({ type="group", value=proc, label="Hardware Information" })
end

mymodule.get_networkstats = function ()
	local stats = cfe({ type="structure", value={}, label="Network Statistics", timestamp=os.time() })
	local result = fs.read_file("/proc/net/dev") or ""
	-- parse the result
	local i=0
	for line in string.gmatch(result, "[^\n]+\n?") do
		if i>1 then
			local intf = string.match(line, "([^%s:]+):")
			line = string.match(line, ":(.*)$")
			local words = {}
			for word in string.gmatch(line, "%S+") do
				words[#words+1] = word
			end
			stats.value[intf] = {}
			stats.value[intf].RX = {bytes=words[1], packets=words[2]}
			stats.value[intf].TX = {bytes=words[9], packets=words[10]}
		end
		i=i+1
	end
	return stats
end

return mymodule
