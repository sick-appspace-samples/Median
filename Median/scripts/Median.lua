--[[----------------------------------------------------------------------------

  Application Name:
  Median
                                                                                             
  Summary:
  Removing salt/pepper noise by applying median filter.
  
  How to Run:
  Starting this sample is possible either by running the app (F5) or
  debugging (F7+F10). Setting breakpoint on the first row inside the 'main'
  function allows debugging step-by-step after 'Engine.OnStarted' event.
  Results can be seen in the image viewer on the DevicePage.
  Restarting the Sample may be necessary to show images after loading the webpage.
  To run this Sample a device with SICK Algorithm API and AppEngine >= V2.5.0 is
  required. For example SIM4000 with latest firmware. Alternatively the Emulator
  in AppStudio 2.3 or higher can be used.
       
  More Information:
  Tutorial "Algorithms - Filtering and Arithmetic".

------------------------------------------------------------------------------]]
--Start of Global Scope---------------------------------------------------------

print('AppEngine Version: ' .. Engine.getVersion())

local DELAY = 1000 -- ms between visualization steps for demonstration purpose

-- Creating viewer
local viewer = View.create()
viewer:setID('viewer2D')

-- Setting up graphical overlay attributes

local textDecoration = View.TextDecoration.create()
textDecoration:setSize(50)
textDecoration:setPosition(20, 50)

--End of Global Scope-----------------------------------------------------------

--Start of Function and Event Scope---------------------------------------------

local function main()
  local img = Image.load('resources/Median.bmp')
  viewer:clear()
  viewer:addImage(img)
  viewer:present()
  Script.sleep(DELAY) -- for demonstration purpose only

  -- Applying median filter of different kernel sizes
  local minKernel = 3
  local maxKernel = 9

  for i = minKernel, maxKernel, 2 do
    local img2 = img:median(i)
    viewer:clear()
    local imageID = viewer:addImage(img2)
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
