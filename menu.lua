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
    local background = display.newImageRect( sceneGroup, "assets/images/blue-sky1.jpeg", 1040, 600 )
    background.x = display.contentCenterX
    background.y = display.contentCenterY

    local title = display.newImageRect( sceneGroup, "assets/images/bbb-logo.png", 520, 520 )
    title.x = display.contentCenterX
    title.y = 120

    --bee logo
    local beeLogo = display.newImageRect("assets/images/bee.png",90,90)
    beeLogo.x = display.contentCenterX
    beeLogo.y = 80
    
    --screen items
    local diamondLogo = display.newImageRect("assets/images/dia1.png",60,60)
    diamondLogo.x = 70
    diamondLogo.y = 260

    local flameLogo = display.newImageRect("assets/images/flame.png",100,410)
    flameLogo.x = 440
    flameLogo.y = 130

    local roseLogo = display.newImageRect("assets/images/rose-flower.png",60,60)
    roseLogo.x = 310
    roseLogo.y = 290

    local playButton = display.newText( sceneGroup, "Play", display.contentCenterX, 220, native.systemFont, 34 )
    playButton:setFillColor( 0, 0, 1 )
 
    local highScoresButton = display.newText( sceneGroup, "Settings", display.contentCenterX, 260, native.systemFont, 34 )
    highScoresButton:setFillColor( 0, 0, 1 )


    playButton:addEventListener( "tap", gotoGame )
    highScoresButton:addEventListener( "tap", gotoSettings )
    
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