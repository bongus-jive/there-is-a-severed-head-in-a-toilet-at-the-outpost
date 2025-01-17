function onInteraction(args)
	if not storage.headTaken then
		giveSeveredHead(args)
		storage.headTaken = true
	end
end

function giveSeveredHead(args)
	local position = object.toAbsolutePosition(args.source)
	world.spawnItem(config.getParameter("headItem"), position, nil, nil, nil, 0)

	object.say(config.getParameter("sayMessage"))
	local message = config.getParameter("radioMessage")
	world.sendEntityMessage(args.sourceId, "queueRadioMessage", message, message.delay)
end
