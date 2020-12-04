function init()
	sayTimer = 0
	
	message.setHandler("get", function()
		local hasHead = config.getParameter("hasHead", true)
		local say = (sayTimer == 0)
		if hasHead and say then
			object.say("oh\n\nthat's a severed head")
			sayTimer = 20
		end
		return {hasHead, say}
	end)
	
	message.setHandler("set", function(_, _, h)
		object.setConfigParameter("hasHead", h or false)
	end)
end

function update(dt)
	sayTimer = math.max(0, sayTimer - dt)
end

function onNpcPlay(npcId)
	if sayTimer == 0 then
		object.say("oh\n\nthat's a severed head")
	end
end