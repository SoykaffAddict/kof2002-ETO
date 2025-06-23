assert(rb,"Run fbneo-training-mode.lua")
if combovars.p1.enable_infmax == nil then
	combovars.p1.enable_infmax = false
end

local kof_infmax_button = {
	text = "ETO",
	olcolour = "black",
	info = {"Extra training mode options"},
	func = function() CIG("ETO_hub", 1) end,
}

insertAddonButton(kof_infmax_button)

local ETO_hub = {
	title = {
		text = "ETO",
		x = interactivegui.boxxlength/2 - 10,
		y = 1,
	},
	{
		text = "<",
		olcolour = "black",
		info = "Back",
		func =  function() CIG("addonpage1",1) end,
	},
	{
		y = 30,
		x = 10,
		text = "Infinte Maximum mode off",
		olcolour = "black",
		info = "Back",
		func = function()
			combovars.p1.enable_infmax = not combovars.p1.enable_infmax
		end,
		autofunc =  function(this)
			if combovars.p1.enable_infmax then
				this.text = "Infinite Maximum mode on"
			else
				this.text = "Infinite Maximum mode off"
			end
		end,
	},
}

guipages.ETO_hub = ETO_hub

local infiniteMaximum = function()
	if (combovars.p1.enable_infmax) then
		memory.writebyte(0x1081EA, 46)
	end
end

table.insert(registers.registerafter, infiniteMaximum)
