function init()
	initPromise = world.sendEntityMessage(pane.sourceEntity(), "get")
	initPromiseFinished = false
	
	player.lounge(pane.sourceEntity())
end

function update(dt)
	if not initPromiseFinished then
		if initPromise:finished() and initPromise:succeeded() then
			initPromiseFinished = true
			if initPromise:result()[1] == true then
				widget.setItemSlotItem("itemSlot", {name = "pat_severedhead"})
				if initPromise:result()[2] == true then
					player.radioMessage({messageId = "pat_severedheadmsg", unique = false, text = "there is a severed head in a toilet in the restroom at applebee's at 9364 WI-16, Onalaska, WI"}, 3)
				end
			end
		end
	elseif not player.isLounging() or player.loungingIn() ~= pane.sourceEntity() then
		pane.dismiss()
	end
end

function item()
	local slotItem = widget.itemSlotItem("itemSlot")
	local swapItem = player.swapSlotItem()
	
	if slotItem and slotItem.name == "pat_severedhead" and swapItem == nil then
	
		player.setSwapSlotItem(slotItem)
		widget.setItemSlotItem("itemSlot", nil)
		world.sendEntityMessage(pane.sourceEntity(), "set", false)
		
	elseif swapItem and swapItem.name == "pat_severedhead" and slotItem == nil then
	
		player.setSwapSlotItem(nil)
		widget.setItemSlotItem("itemSlot", swapItem)
		world.sendEntityMessage(pane.sourceEntity(), "set", true)
		
	end
end