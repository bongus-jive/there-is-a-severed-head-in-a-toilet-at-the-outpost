function build(dir, config, params)
  if not params.skinColorDirectives then
    params.skinColorDirectives = randomSkinColor()
  end

  config.inventoryIcon = config.inventoryIcon .. params.skinColorDirectives
  config.displayImage = config.displayImage .. params.skinColorDirectives
  config.tooltipFields.objectImage = config.tooltipFields.objectImage .. params.skinColorDirectives
  config.animationParts.head = config.animationParts.head .. params.skinColorDirectives

  return config, params
end

function randomSkinColor()
  local colors = root.assetJson("/species/human.species:bodyColor")
  local color = colors[math.random(#colors)]

  local replace = "?replace"
  for k, v in pairs(color) do
    replace = string.format("%s;%s=%s", replace, k, v)
  end

  return replace
end
