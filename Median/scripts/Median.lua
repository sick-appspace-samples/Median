
--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

local DELAY = 1000 -- ms between visualization steps for demonstration purpose

-- Creating viewer
local viewer = View.create("viewer2D1")

-- Setting up graphical overlay attributes

local textDecoration = View.TextDecoration.create()
textDecoration:setSize(50)
textDecoration:setPosition(20, 50)
textDecoration:setColor(0, 220, 0)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  local img = Image.load('resources/Median.bmp')
  viewer:clear()
  local imageID = viewer:addImage(img)
  viewer:addText('Input image', textDecoration, nil, imageID)
  viewer:present()
  Script.sleep(DELAY) -- for demonstration purpose only

  -- Applying median filter of different kernel sizes
  local minKernel = 3
  local maxKernel = 9

  for i = minKernel, maxKernel, 2 do
    local img2 = img:median(i)
    viewer:clear()
    imageID = viewer:addImage(img2)
    viewer:addText('Kernel = ' .. i .. 'x' .. i, textDecoration, nil, imageID)
    viewer:present() -- presenting single steps
    Script.sleep(DELAY) -- for demonstration purpose only
  end

  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------
