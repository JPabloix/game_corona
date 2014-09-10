local block_module = {}

block_module.init = function (option)
    return createBlock(option.x, option.y)
end

function createBlock(x, y)
    local block = display.newImage( "img/block.png", x, y, true )
    block.name = 'block'
    block.rotation = 45
    physics.addBody( block, "static", { friction=0.5 } )
end

return block_module