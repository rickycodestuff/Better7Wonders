---@diagnostic disable: undefined-global

function onLoad()
    -- this object will store both player's name and every kind of points they have as well as their sum
    -- to do that we'll be making 3 kind of input
    -- 1 - inputs for the names 
    -- 2 - inputs for their points
    -- 3 - inputs for the sum of oeach kind of points; although this isn't an actual input but its just a way to 'output' the sum on the score sheet 

    -- ! NAMES
    -- starting cords of the text area for the first name in our scoresheet
    local nameX = -0.517
    local nameY = 0.210
    local nameZ = -0.930

    -- the offset to generate the other text area
    local nameOffsetX = 0.205

    -- create the input for all player's name
    for i = 1, 7 do
        self.createInput({
            input_function = 'none',
            function_owner = self,
            label = 'Name',
            alignment = 3,
            position = {nameX + nameOffsetX * (i - 1), nameY, nameZ},
            scale = {0.15, 0.15, 0.15},
            width = 600,
            height = 210,
            color = {1, 1, 1, 0},
            font_size = 170,
            font_color = {0.1, 0.1, 0.1, 100}
        })
    end

    -- ! POINTS
    -- starting cords of the text area for the first type of point in our scoresheet
    local pointX = -0.517
    local pointY = 0.210
    local pointZ = -0.790

    -- the offsets to generate the other text areas
    local pointOffsetX = 0.205
    local pointOffsetZ = 0.132

    -- create the input for all player's points
    for j = 1, 12 do
        for i = 1, 7 do
            self.createInput({
                input_function = 'testInput',
                function_owner = self,
                label = '---',
                alignment = 3,
                position = {pointX + pointOffsetX * (i - 1), pointY, pointZ + pointOffsetZ * (j - 1)},
                scale = {0.15, 0.15, 0.15},
                width = 600,
                height = 210,
                color = {1, 1, 1, 0},
                font_size = 170,
                font_color = {0.1, 0.1, 0.1, 100},
                validation = 3
            })
        end
    end

    -- ! SUM
    -- starting cords of the text area for the first type of sum of points in our scoresheet
    local sumX = -0.517
    local sumY = 0.210
    local sumZ = 0.800

    -- the offset to generate the other text area
    local sumOffsetX = 0.205

    -- create the input for all player's sum of points
    for i = 1, 7 do
        self.createInput({
            input_function = 'none',
            function_owner = self,
            alignment = 3,
            position = {sumX + sumOffsetX * (i - 1), sumY, sumZ},
            scale = {0.15, 0.15, 0.15},
            width = 600,
            height = 210,
            color = {1, 1, 1, 0},
            font_size = 170,
            font_color = {0.1, 0.1, 0.1, 100},
            validation = 3
        })
    end

end

function none() 
    -- the creatInput() function requires a function to be called otherwise it will give an error
    -- so this is just a blank function
end