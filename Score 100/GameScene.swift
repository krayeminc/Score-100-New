//
//  GameScene.swift
//  Score 100
//
//  Created by S on 08/08/2015.
//  Copyright (c) 2015 KrayemApps. All rights reserved.
//


import SpriteKit
import Foundation
import AudioToolbox

class GameScene: SKScene  {
    
    var bird = SKSpriteNode()
    var ground = SKSpriteNode()
    var purple = SKSpriteNode()
    var orange = SKSpriteNode()
    var moveFactor:CGFloat = 55.0
    let gameArea: CGRect
    var startgame = SKLabelNode()
    var score = Int()
    var displayScore = SKLabelNode()
    var four = SKSpriteNode()
    var five = SKSpriteNode()
    var gameStarted:Bool = false
    var green = SKSpriteNode()
    var back = SKLabelNode()
    var playedOnce:Bool = false
    let defaults = NSUserDefaults()
    var highScore = Int()
    var highScoreLabel = SKLabelNode()
    var button = SKSpriteNode()
    let shape = SKShapeNode()
    
    let path = CGPathCreateMutable()
    
    
    var  timer = NSTimer()
    

    
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
        
    }
    
    
   /*
    func showInterAd(){
        
        NSNotificationCenter.defaultCenter().postNotificationName("loadAdID", object: nil)
        
        
        
    } */
    
    
    func hideAds() {
        
        
        
        NSNotificationCenter.defaultCenter().postNotificationName("hideadsID", object: nil)
        
    }
    
    func showAds(){
        
        
        
        NSNotificationCenter.defaultCenter().postNotificationName("showadsID", object: nil)
        
        
    }
    
    
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        

        gameOver()
        
    }
    
    
    
  /*
    func DisplayScore(){
        
        displayScore.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.7)
        
        
    } */
    
    
    
    func gameOver(){
        
        
        defaults.setInteger(score, forKey: "ScoreSaved")
        displayScore.text = String(format: "Score: %i", score)
        
        
        
        if (score > highScore){
            
            highScore = score
            
            
            defaults.setInteger(score, forKey: "highScoreSaved")
            
            highScoreLabel.text = String(format: "High Score: %i", highScore)
        }
        
        
        if (gameStarted == true ){
  
            
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
            
            timer.invalidate()
  
            
            
            showAds()
            
            
            let myScene = gameOverScene(size: self.size)
            myScene.scaleMode = scaleMode
            let reveal = SKTransition.fadeWithColor(UIColor.redColor(), duration: 0.7)
            self.view?.presentScene(myScene, transition: reveal)
            
            self.runAction(SKAction.playSoundFileNamed("gameStart.wav", waitForCompletion: false))
            
            
            
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    func collisions(){
        
        
        if ( CGRectIntersectsRect(bird.frame, ground.frame)){
            
            
            gameOver()
            
            
            
            
        }
        
        if ( CGRectIntersectsRect(bird.frame, orange.frame)){
            gameOver()
            
        }
        
        if ( CGRectIntersectsRect(bird.frame, purple.frame)){
            gameOver()
            
        }
        
        if ( CGRectIntersectsRect(bird.frame, four.frame)){
            
            gameOver()
            
        }
        
        if ( CGRectIntersectsRect(bird.frame, five.frame)){
            gameOver()
            
            
        }
        
        if ( CGRectIntersectsRect(bird.frame, green.frame)){
            gameOver()
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    override init(size: CGSize) {
        
        
        let maxAspectRatio:CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let playableMargin = (size.width-playableWidth)/2.0
        gameArea = CGRect(x: playableMargin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
        
        
        if (DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPAD) {
            
            
            CGPathAddRect(path, nil, gameArea)
            shape.path = path
            shape.strokeColor = SKColor.blueColor()
            shape.lineWidth = 20.0
            self.addChild(shape)
            
        }
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func random() -> CGFloat {
        
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    
    
    func movement(){
        
        
        if (DeviceType.IS_IPHONE_4_OR_LESS || DeviceType.IS_IPAD){
            
            if ( bird.position.x >= self.frame.size.width*0.87){
                
                gameOver()
                
            }
            
            if ( bird.position.x <= self.frame.size.width*0.13){
                
                gameOver()
                
            }
            
            
            
            
            
        }
        
        
        
        
        
        displayScore.text = String(format: "Score: %i", score)
        
        collisions()
        
        
        ground.position = CGPoint(x: ground.position.x, y: ground.position.y - moveFactor)
        
        orange.position = CGPoint(x: orange.position.x, y: orange.position.y - moveFactor)
        purple.position = CGPoint(x: purple.position.x, y: purple.position.y - moveFactor)
        five.position = CGPoint(x: five.position.x, y: five.position.y - moveFactor)
        
        
        
        if score > 13{
            
            four.position = CGPoint(x: four.position.x, y: four.position.y - moveFactor)
            
        }
        
        if score > 10{
            
            green.position = CGPoint(x: green.position.x, y: green.position.y - moveFactor)
            
            
            
            
            
        }
        
        
        if (score > 2 && score < 6){
            
            moveFactor = 67
            
        }
        
        if (score > 5 && score < 16){
            
            moveFactor = 85
            
            
        }
        
        if (score > 15 && score < 25){
            
            moveFactor = 100
            
            
            
            
            
        }
        
        
        
        
        
        if (score > 24 && score < 50){
            
            moveFactor = 125
            
            
        }
        
        if (score > 49 && score < 65){
            
            moveFactor = 135
            
            
        }
        
        if (score > 59){
            
            green.texture = SKTexture(imageNamed: "redBlock")
            purple.texture = SKTexture(imageNamed: "redBlock")
            ground.texture = SKTexture(imageNamed: "redBlock")
            orange.texture = SKTexture(imageNamed: "redBlock")
            five.texture = SKTexture(imageNamed: "redBlock")
            four.texture = SKTexture(imageNamed: "redBlock")
            
        }
        
        if (score > 64 && score < 90){
            
            moveFactor = 150
            
            
            
            
            
        }
        
        if (score > 89 && score < 100){
            
            moveFactor = 175
            
            
        }
        
        if (score >= 100){
            
            
            displayScore.fontColor = SKColor.greenColor()
            
            
        }
        
        
        
        
        
        
        
        if (purple.position.y < 0){
            
            purple.position =  CGPoint(x: random(min: CGRectGetMinX(gameArea) + purple.size.width/2, max: CGRectGetMaxX(gameArea) - purple.size.width/2),
                y: self.frame.size.height)
            
            if (score < 40){
                score = score + 1
            }
            
            
        }
        
        
        
        
        
        if (ground.position.y < 0){
            
            ground.position =  CGPoint(x: random(min: CGRectGetMinX(gameArea) + ground.size.width/2, max: CGRectGetMaxX(gameArea) - ground.size.width/2),
                y: self.frame.size.height)
            
            
            
            
        }
        
        
        if (orange.position.y < 0){
            
            orange.position =  CGPoint(x: random(min: CGRectGetMinX(gameArea) + orange.size.width/2, max: CGRectGetMaxX(gameArea) - orange.size.width/2),
                y: self.frame.size.height)
            
            if (score < 90){
                score = score + 1
            }
        }
        
        
        
        
        if (four.position.y < 0){
            
            four.position =  CGPoint(x: random(min: CGRectGetMinX(gameArea) + four.size.width/2, max: CGRectGetMaxX(gameArea) - four.size.width/2),
                y: self.frame.size.height)
            
            
            
            
        }
        
        if (five.position.y < 0){
            
            five.position =  CGPoint(x: random(min: CGRectGetMinX(gameArea) + five.size.width/2, max: CGRectGetMaxX(gameArea) - five.size.width/2),
                y:self.frame.size.height)
            
            score = score + 1
            
            
            
        }
        
        if (green.position.y < 0){
            
            green.position =  CGPoint(x: random(min: CGRectGetMinX(gameArea) + green.size.width/2, max: CGRectGetMaxX(gameArea) - green.size.width/2),
                y:self.frame.size.height)
            
            
            
            
        }
        
        
        
        
        
    }
    
    

    
    override func didMoveToView(view: SKView) {
        
        

//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "DisplayScore", name: "ScoreToScreen", object: nil)

        
        highScoreLabel = SKLabelNode(fontNamed: "Pusab")
        highScore = defaults.integerForKey("highScoreSaved")
        highScoreLabel.text = String(format: "High Score: %i", highScore)
        highScoreLabel.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.8)
        highScoreLabel.fontSize = 50
        self.addChild(highScoreLabel)
        
        
        if (highScore >= 100){
            
            highScoreLabel.fontColor = SKColor.greenColor()
            
        }
        
        
        
        
        
        back = SKLabelNode(fontNamed: "Pusab")
        back.position =  CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.2)
        back.text = "Menu"
        back.name = "backButton"
        back.fontSize = 70
        back.color = SKColor.redColor()
        self.addChild(back)
        
        button = SKSpriteNode(imageNamed: "fixedButton")
        button.position =  CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.2)
        button.name = "blueButton"
        button.zPosition = -1
        button.size = CGSize(width: 700, height: 300)
        self.addChild(button)
        
        
        
        
        
        
        
        bird = SKSpriteNode(imageNamed: "circle")
        
        bird.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.9)
        bird.size = CGSize(width: 100, height: 100)
        bird.name = "birdy"
        self.addChild(bird)
        bird.hidden = true
        
        
        
        score = defaults.integerForKey("ScoreSaved")
        
        
        displayScore = SKLabelNode(fontNamed: "Pusab")
        displayScore.position = CGPoint(x: self.frame.size.width*0.68 , y: self.frame.size.height*0.95)
        displayScore.fontSize = 70
        displayScore.text = String(format: "Score: %i", score)
        
        self.addChild(displayScore)
        
        
        
        
        startgame = SKLabelNode(fontNamed: "Pusab")
        startgame.fontSize = 70
        startgame.text = "Hold To Play"
        startgame.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.7)
        startgame.name = "start"
        self.addChild(startgame)
        
        
        
        
        backgroundColor = UIColor.blackColor()
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
   
        
        var nodeTouched = SKNode()
        var currentNodeTouched = SKNode()
        
        
        
        for touch: AnyObject in touches {
            
            if (gameStarted == true){
                let location = touch.locationInNode(self)
                nodeTouched = self.nodeAtPoint(location)
                bird.position = location
                hideAds()
                
            }
            
            
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
   
        
        var nodeTouched = SKNode()
        var currentNodeTouched = SKNode()
        
        
        for touch: AnyObject in touches {
            
            
            
            
            
            
            
            let tappedLocation = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(tappedLocation)
            let tappedNodeName: String? = tappedNode.name
            
            
            
            
            if (tappedNodeName == "backButton" || tappedNodeName == "blueButton"){
                
                let myScene = MainMenu(size: self.size)
                myScene.scaleMode = scaleMode
                let reveal = SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5)
                self.view?.presentScene(myScene, transition: reveal)
                
                self.runAction(SKAction.playSoundFileNamed("gameStart.wav", waitForCompletion: false))
                
                
                
            }
                
                
                
            else if (tappedNodeName != "backButton" && gameStarted == false && tappedLocation.y > self.frame.size.height*0.1){
                
                
                score =  0
                playedOnce = true
                
                displayScore.position = CGPoint(x: self.frame.size.width*0.68 , y: self.frame.size.height*0.95)
                displayScore.removeAllActions()
                displayScore.fontSize = 70
                
                
                
                
                
                let location = touch.locationInNode(self)
                nodeTouched = self.nodeAtPoint(location)
                bird.position = location
                startgame.removeFromParent()
                
                
                
                
                
                
                gameStarted = true
                back.removeFromParent()
                button.removeFromParent()
                highScoreLabel.hidden = true
                
                
                
                ground = SKSpriteNode(imageNamed: "bullet1")
                ground.position = CGPoint(x: random(min: CGRectGetMinX(gameArea) + ground.size.width/2, max: CGRectGetMaxX(gameArea) - ground.size.width/2), y: self.frame.size.height)
                
                
                ground.size = CGSize(width: 40, height: 120)
                
                self.addChild(ground)
                
                
                orange = SKSpriteNode(imageNamed: "bullet1")
                orange.position = CGPoint(x: random(min: CGRectGetMinX(gameArea) + orange.size.width/2, max: CGRectGetMaxX(gameArea) - orange.size.width/2), y: self.frame.size.height*1.3)
                orange.size = CGSize(width: 40, height: 120)
                self.addChild(orange)
                
                
                purple = SKSpriteNode(imageNamed: "bullet1")
                purple.position = CGPoint(x: random(min: CGRectGetMinX(gameArea) + purple.size.width/2, max: CGRectGetMaxX(gameArea) - purple.size.width/2), y: self.frame.size.height*1.6)
                purple.size = CGSize(width: 40, height: 120)
                self.addChild(purple)
                
                
                
                four = SKSpriteNode(imageNamed: "bullet1")
                four.position = CGPoint(x: random(min: CGRectGetMinX(gameArea) + four.size.width/2, max: CGRectGetMaxX(gameArea) - four.size.width/2), y: (self.frame.size.height*(1.3)))
                four.size = CGSize(width: 40, height: 120)
                self.addChild(four)
                
                
                
                
                five = SKSpriteNode(imageNamed: "bullet1")
                five.position = CGPoint(x: random(min: CGRectGetMinX(gameArea) + five.size.width/2, max: CGRectGetMaxX(gameArea) - five.size.width/2), y: self.frame.size.height*1.5)
                five.size = CGSize(width: 40, height: 120)
                self.addChild(five)
                
                green = SKSpriteNode(imageNamed: "bullet1")
                green.position = CGPoint(x: random(min: CGRectGetMinX(gameArea) + green.size.width/2, max: CGRectGetMaxX(gameArea) - green.size.width/2), y: (self.frame.size.height*2.4))
                green.size = CGSize(width: 40, height: 120)
                self.addChild(green)
                
                
                
                
                
                timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("movement"), userInfo: nil, repeats: true)
                
                NSRunLoop.mainRunLoop().addTimer(timer, forMode:NSDefaultRunLoopMode)
                
                
                movement()
                
            }
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}