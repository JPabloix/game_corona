--
-- Abstract: Chains sample project
-- Demonstrates how to use a sequence of joints to construct chains
--
-- Version: 1.1
--
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.
--
--  Supports Graphics 2.0
---------------------------------------------------------------------------------------

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local _W = display.contentWidth
local _H = display.contentHeight
math.randomseed(os.time())

local CBE = require("CBEffects.Library")

CBE.listPresets()

local physics = require("physics")
physics.start()

physics.setScale( 60 )

display.setStatusBar( display.HiddenStatusBar )


local ground = display.newImage( "ground.png", centerX, _H, true )
ground.name = 'suelo xD'
physics.addBody( ground, "static", { friction=0.5 } )

local randomBall = function()
    ball = display.newImage( "super_ball.png" )
    ball.x = 40 + math.random( 60 ); ball.y = -20
    ball.name = 'ball'
    physics.addBody( ball, { density=2.9, friction=0.5, bounce=0.7, radius=24 } )
    ball.collision = onLocalCollision
    ball:addEventListener( "collision", ball )
end

local createBall = function(x, y)
    ball = display.newImage( "bola1.png" )
    -- ball:scale( 0.07, 0.07 )
    ball.x = 100; ball.y = 10
    ball.name = 'ball'
    physics.addBody( ball, { density=2.9, friction=0.5, bounce=0.7, radius=12 } )

    linearVelocityX = (x - ball.x)
    linearVelocityY = (y - ball.y)
    ball:setLinearVelocity(linearVelocityX * 2, linearVelocityY * 2);


    -- ball:setLinearVelocity( 100, 10 )
    ball.collision = onLocalCollision
    ball:addEventListener( "collision", ball )
end

local screenTap = function(event)
    createBall(event.x, event.y)
end

display.currentStage:addEventListener( "tap", screenTap )

-- Call the above function 12 times
-- timer.performWithDelay( 1500, randomBall, 12 )



function createTabla(k,b)
    local block = display.newImage( "block.png", b.x, b.y, true )
    block.name = 'block'
    physics.addBody( block, "static", { friction=0.5 } )
end

stage = {}
stage.block = {{x=100, y=300},{x=150, y=300},{x=200, y=350},{x=150, y=350}}
table.foreach(stage.block, createTabla)
-- for i=1,10 do
--     local block = display.newImage( "block.png", math.random(_W), math.random(200, (_H - 20)), true )
--     block.name = 'block'
--     physics.addBody( block, "static", { friction=0.5 } )
-- end


function onLocalCollision( self, event )

    if (event.other.name == 'block') then
        if ( event.phase == "began" ) then
            vent = CBE.newVent {
                preset = "sparks"
            }
            vent.x, vent.y = event.other.x, event.other.y
            vent:start() -- Start if began
        end
        if ( event.phase == "ended" ) then
            event.other:removeSelf()
        end
    end
end