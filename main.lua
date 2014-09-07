
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
math.randomseed(os.time())

local physics = require("physics")
local CBE = require("CBEffects.Library")
local ball_module = require('modules.ball_module')
local block_module = require('modules.block_module')

CBE.listPresets()
physics.start()
physics.setScale( 60 )
display.setStatusBar( display.HiddenStatusBar )


local ground = display.newImage( "img/ground.png", centerX, _H, true )
ground.name = 'suelo xD'
physics.addBody( ground, "static", { friction=0.5 } )



local screenTap = function(event)
    ball_module.init({x = event.x, y = event.y})
end

display.currentStage:addEventListener( "tap", screenTap )

-- Call the above function 12 times
-- timer.performWithDelay( 1500, randomBall, 12 )

stage = {}
stage.block = {{x=100, y=300},{x=150, y=300},{x=200, y=350},{x=150, y=350}}

for key,value in pairs(stage.block) do
    block_module.init(value)
end
