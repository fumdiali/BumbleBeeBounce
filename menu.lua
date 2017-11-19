local composer = require( "composer" )

local scene = composer.newScene()


local function stageOne()
   composer.gotoScene( "stage1" )
end

local function aboutGame()
   composer.gotoScene( "about" )
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
    local background = display.newImageRect( sceneGroup, "assets/images/sky.jpeg", 980, 400 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local bg = display.newImageRect( sceneGroup, "assets/images/mountainscape.png", 980, 400 )
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    --screen items
    local flameLogo = display.newImageRect(sceneGroup,"assets/images/flame.png",100,410)
    flameLogo.x = 240
    flameLogo.y = 190
    flameLogo.rotation = 90

    

    local roseLogo = display.newImageRect(sceneGroup,"assets/images/rose-flower.png",60,60)
    roseLogo.x = 330
    roseLogo.y = 80

    local roseLogo = display.newImageRect(sceneGroup,"assets/images/rose-flower.png",60,60)
    roseLogo.x = 60
    roseLogo.y = 50

    local title = display.newImageRect( sceneGroup, "assets/images/bbb-logo.png", 520, 520 )
    title.x = display.contentCenterX
    title.y = 120
    

    --bee logo
    local beeLogo = display.newImageRect(sceneGroup,"assets/images/bee-logo.png",90,90)
    beeLogo.x = display.contentCenterX
    beeLogo.y = 80
    
    

    local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 220, native.systemFont, 36 )
    playButton:setFillColor( 0, 1, 0 )
    playButton.strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} }
    playButton.strokeWidth = 2
 
    local aboutButton = display.newText( sceneGroup, "About", display.contentCenterX, 260, native.systemFont, 36 )
    aboutButton:setFillColor( 0, 1, 0 )
    aboutButton.strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} }
    aboutButton.strokeWidth = 2


    playButton:addEventListener( "tap", stageOne )
    aboutButton:addEventListener( "tap", aboutGame )

    -------------------------------------------------
     --menu buttons
    --------------------------------------------------
    --[[local start = display.newText("Start Game",220, 150, native.systemFont, 26)
    start:setFillColor(0,1,1)
    local settings = display.newText("Game Settings",220, 150, native.systemFont, 26)
    settings:setFillColor(0,1,1)--]]
 
    
 
    --[[local widget = require( "widget" )

    -- Create the widgets
   play = widget.newButton(
    {
        label = "button",
        --onEvent = handleButtonEvent,
        emboss = false,
        -- Properties for a rounded rectangle button
        shape = "roundedRect",
        width = 100,
        height = 30,
        cornerRadius = 4,
        fillColor = { default={0,0,0,1}, over={1,0.1,0.7,0.4} },
        strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
        strokeWidth = 2
    }
)

  about = widget.newButton(
      {
          label = "button",
          --onEvent = handleButtonEvent,
          emboss = false,
          -- Properties for a rounded rectangle button
          shape = "roundedRect",
          width = 100,
          height = 30,
          cornerRadius = 4,
          fillColor = { default={0,0,0,1}, over={1,0.1,0.7,0.4} },
          strokeColor = { default={1,0.4,0,1}, over={0.8,0.8,1,1} },
          strokeWidth = 2
      }
  )
   
  -- Center the button
  play.x = display.contentCenterX
  play.y = display.contentCenterY + 40
  about.x = display.contentCenterX
  about.y = display.contentCenterY + 80
   
  -- Change the button's label text
  play:setLabel("Play")
  about:setLabel( "About" )

  play:addEventListener( "tap", stageOne )
  --about disabled due to bug on screen tap
  --similar bug that detects screen tap on stage1 screen
  --about:addEventListener( "tap", aboutGame )--]]
 
    
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