local composer = require( "composer" )

local scene = composer.newScene()

local physics = require( "physics" )
physics.start()
 
--physics.setGravity( 0, 6 )
-----------------------------------------------
 --game body
----------------------------------------------

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
    
       local sceneGroup = self.view
       -- Code here runs when the scene is first created but has not yet appeared on screen

       local tapCount = 0

       local background = display.newImageRect("assets/images/blue-sky1.jpeg", 1040, 600 )
       background.x = display.contentCenterX
       background.y = display.contentCenterY

       --player score display
       local scoreDisplay = display.newText("Score:0",200, 30, native.systemFont, 24)
       scoreDisplay:setFillColor(1,0,0)

       --create player lives indicator
       local life1 = display.newImageRect("assets/images/heart-rose.png",25,25)
       life1.x = 10
       life1.y = 30
       local life2 = display.newImageRect("assets/images/heart-rose.png",25,25)
       life2.x = 40
       life2.y = 30
       local life3 = display.newImageRect("assets/images/heart-rose.png",25,25)
       life3.x = 70
       life3.y = 30

       --create reward tokens
       local rose = display.newImageRect("assets/images/pink-rose.png",60,60)
       rose.x = 600
       rose.y = 125
       
       transition.moveTo( rose, { x=0, y=125, iteration=0, time=6000, delay=7000 } )
       physics.addBody(rose,"static")

       local diamond = display.newImageRect("assets/images/dia1.png",40,40)
       diamond.x = 265
       diamond.y = 25
       physics.addBody(diamond,"dynamic",{bounce=0.7})

       --create player xter
       local bee = display.newImageRect("assets/images/beee.png",40,40)
       bee.x = 90
       bee.y = 100
       physics.setGravity(0,2.5)
       physics.addBody( bee, "dynamic", { bounce=0.3 } )

       local function bounceBee()
        tapCount = tapCount + 1
        scoreDisplay.text = "Score:"..tapCount
        bee:applyLinearImpulse( 0, -0.05, bee.x, bee.y )
       end

       background:addEventListener( "tap", bounceBee )

       --add rectangle borders to sky/ground scape
       local roof = display.newRect(10,1,1040,0)
       physics.addBody(roof,"static")
       local bottom = display.newRect(10,298,1040,1)
       physics.addBody(bottom,"static")

       --create ground scape
       local ground = display.newImageRect("assets/images/ground.png",1050,120)
       --beeLogo.x = display.contentCenterX
       ground.y = 260
       --physics.addBody( ground, "static")

    
       --create flame
       local flame = display.newImageRect("assets/images/flame.png",70,200)
       flame.x = 600
       flame.y = 170
       --set flame obj to horizontal axis
       flame.rotation = 79
       transition.moveTo( flame, { x=0, y=170, iteration=0, time=6000, delay=4000 } )
    
   end
    
    
   -- show()
   function scene:show( event )
    
       local sceneGroup = self.view
       local phase = event.phase
    
       if ( phase == "will" ) then
           -- Code here runs when the scene is still off screen (but is about to come on screen)
           
    
       elseif ( phase == "did" ) then
           -- Code here runs when the scene is entirely on screen
          
       end
   end
    
    
   -- hide()
   function scene:hide( event )
    
       local sceneGroup = self.view
       local phase = event.phase
    
       if ( phase == "will" ) then
           -- Code here runs when the scene is on screen (but is about to go off screen)
    
       elseif ( phase == "did" ) then
           -- Code here runs immediately after the scene goes entirely off screen
    
       end
   end
    
    
   -- destroy()
   function scene:destroy( event )
    
       local sceneGroup = self.view
       -- Code here runs prior to the removal of scene's view
    
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