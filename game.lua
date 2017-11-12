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
       local runtime = 0
       scrollSpeed = 2

       local background = display.newImageRect("assets/images/bluesky.jpg", 1020, 450 )
       background.x = display.contentCenterX
       background.y = display.contentCenterY

       --mountainscape
       local bg = display.newImageRect("assets/images/mountainscape.png", 660, 380 )
       bg.x = display.contentCenterX
       bg.y = display.contentCenterY

       --audio/sound efx
       local soundFlame = audio.loadStream( "assets/audio/flame-sound.mp3" )

       local soundBeeJump = audio.loadStream( "assets/audio/jump-sound.mp3" )

       --player score display
       local scoreDisplay = display.newText("Score:0",200, 30, native.systemFont, 44)
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
       local rose = display.newImageRect("assets/images/rose-flower.png",60,60)
       rose.x = 600
       rose.y = 120
       
       transition.to( rose, { x=-190, y=120, time=7000, transition=easing.outInBack, delay=7000,iterations=2 } )
       physics.addBody(rose,"static")

       local diamondBlue = display.newImageRect("assets/images/diamond-blue.png",40,40)
       diamondBlue.x = 600
       diamondBlue.y = 55
       transition.to( diamondBlue, { x=-190, y=55, time=6000, transition=easing.outInBack, delay=2000,iterations=-1 } )
       physics.addBody(diamondBlue,"static")

       local redStar= display.newImageRect("assets/images/star-red.png",40,40)
       redStar.x = 600
       redStar.y = 120
       transition.to( redStar, { x=-190, y=120, time=9000, transition=easing.outInBack, delay=14000,iterations=-1 } )
       physics.addBody(redStar,"static")

       local diamond = display.newImageRect("assets/images/diamond-purple.png",40,40)
       diamond.x = 365
       diamond.y = 25
       physics.addBody(diamond,"dynamic",{bounce=0.9})

       --create player xter
       local bee = display.newImageRect("assets/images/beee.png",40,40)
       bee.x = 90
       bee.y = 100
       --physics.setGravity(0,2.5)
       physics.addBody( bee, "dynamic", { bounce=0.3 } )

       --function to control bee floatation and player score(placeholder)
       local function bounceBee()
        tapCount = tapCount + 1
        scoreDisplay.text = "Score:"..tapCount
        bee:applyLinearImpulse( 0, -0.09, bee.x, bee.y )
        audio.play(soundBeeJump)
       end
       --float our bee by tapping anywhere on the screen
       background:addEventListener( "tap", bounceBee )
      
       

       --add rectangle borders to sky/ground scape
       local roof = display.newRect(10,1,1040,0)
       physics.addBody(roof,"static")
       local bottom = display.newRect(10,298,1040,1)
       physics.addBody(bottom,"static")

       --create ground scape(grass image)
       local ground = display.newImageRect("assets/images/grass.png",1050,120)

       ground.y = 260
       --physics.addBody( ground, "static")

       local flame = display.newImageRect("assets/images/flame.png",70,200)
       flame.x = 700
       flame.y = 170
       
       --set flame obj to horizontal axis
       flame.rotation = 79
       local flame2 = display.newImageRect("assets/images/flame.png",70,200)
       flame2.x = 700
       flame2.y = 270
       --set flame obj to horizontal axis
       flame2.rotation = 79
       local flame3 = display.newImageRect("assets/images/flame.png",70,200)
       flame3.x = 700
       flame3.y = 70
       --set flame obj to horizontal axis
       flame3.rotation = 79
        --section to handle flames loop
        local function playFlameEfx()
            audio.play(soundFlame)
        end

        function throwFlame()
            transition.to( flame, { x=-190, y=170, time=6000, transition=easing.inExpo, delay=1000,iterations=-1,onStart=playFlameEfx } )
            transition.to( flame2, { x=-190, y=270, time=6000, transition=easing.inExpo, delay=5000,iterations=-1,onStart=playFlameEfx } )
            transition.to( flame3, { x=-190, y=70, time=6000, transition=easing.inExpo, delay=8000,iterations=-1,onStart=playFlameEfx } )
           end--end of throw flame function
            
           ammo = 5
           while( ammo > 0 )
           do
              throwFlame()
              ammo = ammo - 1
           end
       
       
   end --end of create scene
    
    
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