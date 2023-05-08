---@diagnostic disable: lowercase-global

-- TODO add this on Global: onLoad()
function onChat()
    for _, color in pairs(getSeatedPlayers()) do
        local origin = Player[color].getHandTransform(1)
        local deck_age1 = getObjectFromGUID('501ae8')

        local stacks = Global.getVar('OBJECTS_OFFSETS')['stacks']

        local stack_origin = Vector(0, 0, 0)

        for index in pairs(stacks) do
            stack_origin[1] = origin.position[1] + origin.forward[1] * stacks['offset_z'] + origin.right[1] * stacks[index]
            stack_origin[2] = 3
            stack_origin[3] = origin.position[3] + origin.forward[3] * stacks['offset_z'] + origin.right[3] * stacks[index]

            print(stack_origin)
        end

    end
end