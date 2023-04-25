
--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

local DELAY = 1000 -- ms between visualization steps for demonstration purpose

-- Creating viewer
local viewer = View.create()

-- Setting up graphical overlay attributes

local textDecoration = View.TextDecoration.create()
textDecoration:setSize(50):setPosition(20, 50):setColor(0, 220, 0)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  local img = Image.load('resources/Median.bmp')
  viewer:clear()
  viewer:addImage(img)
  viewer:addText('Input image', textDecoration)
  viewer:present()
  Script.sleep(DELAY) -- for demonstration purpose only

  -- Applying median filter of different kernel sizes
  local minKernel = 3
  local maxKernel = 9

  for i = minKernel, maxKernel, 2 do
    local img2 = img:median(i)
    viewer:clear()
    viewer:addImage(img2)
    viewer:addText('Kernel = ' .. i .. 'x' .. i, textDecoration)
    viewer:present() -- presenting single steps
    Script.sleep(DELAY) -- for demonstration purpose only
  end

  print('App finished.')
end
--The following registration is part of the global scope which runs once after startup
--Registration of the 'main' function to the 'Engine.OnStarted' event
Script.register('Engine.OnStarted', main)

--End of Function and Event Scope--------------------------------------------------
