local composer = require( "composer" )

local scene = composer.newScene()


local function gotoGame()
   composer.gotoScene( "game" )
end

local function gotoSettings()
   composer.gotoScene( "settings" )
end
------------------------------------------------------------------------------------
    --BumbleBeeBounce menu launch screen
---------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    local background = display.newImageRect( sceneGroup, "assets/images/sky.jpeg", 1020, 600 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local bg = display.newImageRect( sceneGroup, "assets/images/mountainscape.png", 960, 400 )
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    local title = display.newImageRect( sceneGroup, "assets/images/bbb-logo.png", 520, 520 )
    title.x = display.contentCenterX
    title.y = 120

    --bee logo
    local beeLogo = display.newImageRect("assets/images/bee-logo.png",90,90)
    beeLogo.x = display.contentCenterX
    beeLogo.y = 80
    
    --screen items
    local diamondLogo = display.newImageRect("assets/images/diamond-purple.png",60,60)
    diamondLogo.x = 40
    diamondLogo.y = 120

    local flameLogo = display.newImageRect("assets/images/flame.png",100,410)
    flameLogo.x = 440
    flameLogo.y = 130

    local roseLogo = display.newImageRect("assets/images/rose-flower.png",60,60)
    roseLogo.x = display.contentCenterX
    roseLogo.y = 280

    local roseLogo = display.newImageRect("assets/images/rose-flower.png",60,60)
    roseLogo.x = 330
    roseLogo.y = 80

    local roseLogo = display.newImageRect("assets/images/rose-flower.png",60,60)
    roseLogo.x = 60
    roseLogo.y = 50

    --[[local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 220, native.systemFont, 34 )
    playButton:setFillColor( 0, 0, 1 )
 
    local highScoresButton = display.newText( sceneGroup, "Settings", display.contentCenterX, 260, native.systemFont, 34 )
    highScoresButton:setFillColor( 0, 0, 1 )


    playButton:addEventListener( "tap", gotoGame )
    highScoresButton:addEventListener( "tap", gotoSettings )--]]

    -------------------------------------------------
     --menu buttons
    --------------------------------------------------
    --[[local start = display.newText("Start Game",220, 150, native.systemFont, 26)
    start:setFillColor(0,1,1)
    local settings = display.newText("Game Settings",220, 150, native.systemFont, 26)
    settings:setFillColor(0,1,1)--]]
 
    
 
    local widget = require( "widget" )

    -- Create the widgets
   start = widget.newButton(
    {
        label = "button",
        --onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 200,
        height = 40,
        cornerRadius = 2,
        fillColor = { default={0,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 4
    }
)

  settings = widget.newButton(
      {
          label = "button",
          --onEvent = handleButtonEvent,
          emboss = false,
          -- Properties for a rounded rectangle button
          shape = "roundedRect",
          width = 200,
          height = 40,
          cornerRadius = 2,
          fillColor = { default={0,0,0,1}, over={1,0.1,0.7,0.4} },
          strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
          strokeWidth = 4
      }
  )
   
  -- Center the button
  start.x = display.contentCenterX - 110
  start.y = display.contentCenterY + 70
  settings.x = display.contentCenterX + 110
  settings.y = display.contentCenterY + 70
   
  -- Change the button's label text
  start:setLabel("Start Game")
  settings:setLabel( "Game Settings" )

  start:addEventListener( "tap", gotoGame )
  settings:addEventListener( "tap", gotoSettings )
 
    
   end
    
    
   -- -----------------------------------------------------------------------------------
   -- Scene event function listeners
   -- -----------------------------------------------------------------------------------
   scene:addEventListener( "create", scene )
   scene:addEventListener( "show", scene )
   scene:addEventListener( "hide", scene )
   scene:addEventListener( "destroy", scene )
   -- -----------------------------------------------------------------------------------
    
   return scene