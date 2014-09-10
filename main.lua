
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
math.randomseed(os.time())

local physics = require("physics")
local CBE = require("CBEffects.Library")
local ball_module = require('modules.ball_module')
local block_module = require('modules.block_module')
local stage_module = require('modules.stage_module')
local weapon_module = require('modules.weapon_module')

CBE.listPresets()
physics.start()
physics.setGravity( 0, 9 )
physics.setScale( 100 )
display.setStatusBar( display.HiddenStatusBar )



-- Call the above function 12 times
-- timer.performWithDelay( 1500, randomBall, 12 )

-- Inicializacion de modulos:

stage_module.draw(1, block_module)
weapon_module.init()


-- eventos:

local screenTap = function(event)
    weapon_module.changeAnglePoint(event.x, event.y)
    ball_module.init({x = event.x, y = event.y})
end

display.currentStage:addEventListener( "tap", screenTap )



