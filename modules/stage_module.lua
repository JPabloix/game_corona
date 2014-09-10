stage = {}

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight

stage.draw = function (level, block_module)
	config = stage.getConfig(level)

	for key,value in pairs(config.block) do
    	block_module.init(value)
	end

	paredLeft = display.newRect( 0, _H / 2, 5, _H )
	paredLeft.name = 'pared'
	physics.addBody( paredLeft, "static", { friction=5 } )

	paredRight = display.newRect( _W, _H / 2, 5, _H )
	paredRight.name = 'pared'
	physics.addBody( paredRight, "static", { friction=5 } )

	paredTop = display.newRect( _W / 2, 0, _W, 5)
	paredTop.name = 'pared'
	physics.addBody( paredTop, "static", { friction=5 } )
end


stage.getConfig = function (level)
	config = {}
	if     level == 1 then
		config.block = {{x=100, y=200},{x=150, y=200},{x=200, y=150},{x=150, y=150},{x=50, y=100},{x=130, y=150},{x=300, y=150},{x=100, y=150}}
    elseif level == 2 then
		config.block = {{x=100, y=200},{x=150, y=200},{x=200, y=150},{x=150, y=150},{x=50, y=100},{x=130, y=150},{x=300, y=150},{x=100, y=150}}
    elseif level == 3 then
		config.block = {{x=100, y=200},{x=150, y=200},{x=200, y=150},{x=150, y=150},{x=50, y=100},{x=130, y=150},{x=300, y=150},{x=100, y=150}}
    elseif level == 4 then
		config.block = {{x=100, y=200},{x=150, y=200},{x=200, y=150},{x=150, y=150},{x=50, y=100},{x=130, y=150},{x=300, y=150},{x=100, y=150}}
    elseif level == 5 then
		config.block = {{x=100, y=200},{x=150, y=200},{x=200, y=150},{x=150, y=150},{x=50, y=100},{x=130, y=150},{x=300, y=150},{x=100, y=150}}
    else
		config.block = {{x=100, y=200},{x=150, y=200},{x=200, y=150},{x=150, y=150},{x=50, y=100},{x=130, y=150},{x=300, y=150},{x=100, y=150}}
    end
    return config
end




return stage
