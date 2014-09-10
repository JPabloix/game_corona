local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

local weapon = {}



weapon.init = function ()
	weapon.display = display.newImage( 'img/canon.png' )
	weapon.display:scale( 0.1, 0.15 )
	weapon.display.x = centerX;
	weapon.display.y = 0;
	weapon.display.anchorX = 0
	weapon.display.anchorY = 0.3
	weapon.display.rotation = 90
end

weapon.changeAnglePoint = function (x, y)
	weapon.display.rotation = 180 * math.atan2((y - weapon.display.y) , (x - weapon.display.x)) / math.pi
end

return weapon