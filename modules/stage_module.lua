stage = {}
stage.block = {{x=100, y=300},{x=150, y=300},{x=200, y=350},{x=150, y=350}}

for key,value in pairs(stage.block) do
    block_module.init(value)
end

