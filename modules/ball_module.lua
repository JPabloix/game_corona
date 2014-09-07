local CBE = require("CBEffects.Library")

local ball_module = {}

ball_module.init = function (option)
    return createBall(option.x, option.y)
end

function createBall(x, y)
    local ball
    ball = display.newImage( "img/bola1.png" )
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

    return ball
end

function onLocalCollision( self, event )

    if (event.other.name == 'block') then
        if ( event.phase == "began" ) then
            vent = CBE.newVent {
                preset = "sparks"
            }
            vent.x, vent.y = event.other.x, event.other.y
            vent:start()
        end
        if ( event.phase == "ended" ) then
            event.other:removeSelf()
        end
    end
end




return ball_module