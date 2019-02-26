//
//  GameOverScene.swift
//  Score 100
//
//  Created by S on 19/08/2015.
//  Copyright (c) 2015 KrayemApps. All rights reserved.
//

import Foundation
import SpriteKit
import iAd


class gameOverScene: SKScene, ADInterstitialAdDelegate {
    
     var HeyZap = HeyzapAds()
    
    var highScore = Int()
    var highScoreLabel = SKLabelNode()
    let defaults = NSUserDefaults()
    var score = Int()
    var displayScore = SKLabelNode()
    var startButton = SKSpriteNode()
    var startLabel = SKLabelNode()
    var gameOver = SKLabelNode()
    
    
    
    
    var interAd = ADInterstitialAd()
    var interAdView: UIView = UIView()
    
    var closeButton = UIButton(type: UIButtonType.System)
    
    
    func interstitialAdActionDidFinish(interstitialAd: ADInterstitialAd!) {
        
        
        
    }
    
    
    func interstitialAdActionShouldBegin(interstitialAd: ADInterstitialAd!, willLeaveApplication willLeave: Bool) -> Bool {
        
        
        

        
        print("3", terminator: "")
        return true
        
        
        
        
        
    }
    
    func close(sender: UIButton) {
        
        closeButton.removeFromSuperview()
        interAdView.removeFromSuperview()

        self.addChild(startLabel)
        self.addChild(startButton)
        self.addChild(gameOver)
        self.addChild(highScoreLabel)
        self.addChild(displayScore)
    }
    
    
    
    
    func loadAd(){
        
        print("load Ad", terminator: "")
        interAd = ADInterstitialAd()
        interAd.delegate = self

        
    }
    
    
    func interstitialAdDidLoad(interstitialAd: ADInterstitialAd!) {
        print("ad did load", terminator: "")
        interAdView = UIView()
        interAdView.frame = self.view!.bounds
        view!.addSubview(interAdView)
        
        interAd.presentInView(interAdView)
        UIViewController.prepareInterstitialAds()
        
        interAdView.addSubview(closeButton)
      //  self.view!.paused = true

        startButton.removeFromParent()
        startLabel.removeFromParent()
        gameOver.removeFromParent()
        highScoreLabel.removeFromParent()
        displayScore.removeFromParent()
        
    }
    
    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        
        
        
        
    }
    
    func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
        print("failed to recieve", terminator: "")
        
        closeButton.removeFromSuperview()
        interAdView.removeFromSuperview()
        
    }
    

   
    

    
 
    
    
    override func didMoveToView(view: SKView) {
        //loadAd()

        
        
        HZVideoAd.show()
        HZVideoAd.fetch()


        closeButton.frame = CGRectMake(20 , 20, 40, 40)
        closeButton.layer.cornerRadius = 20
        closeButton.setTitle("x", forState: .Normal)
        closeButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        closeButton.backgroundColor = UIColor.whiteColor()
        closeButton.layer.borderColor = UIColor.blackColor().CGColor
        closeButton.layer.borderWidth = 1
        closeButton.addTarget(self, action: "close:", forControlEvents: UIControlEvents.TouchDown)

        
        
        backgroundColor = UIColor.blackColor()

        
        
        gameOver = SKLabelNode(fontNamed: "Pusab")
        gameOver.text = "Game Over"
        gameOver.name = "GameOverButton"
        gameOver.fontSize = 100
        gameOver.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.7)
        self.addChild(gameOver)
        
        startLabel = SKLabelNode(fontNamed: "Pusab")
        startLabel.text = "Tap here to start!"
        startLabel.name = "startButton"
        startLabel.fontSize = 70
        startLabel.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.2)
        self.addChild(startLabel)
        

        highScoreLabel.text = String(format: "High Score: %i", highScore)

        
        highScoreLabel = SKLabelNode(fontNamed: "Pusab")
        highScore = defaults.integerForKey("highScoreSaved")
        highScoreLabel.text = String(format: "High Score: %i", highScore)
        highScoreLabel.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.8)
        highScoreLabel.fontSize = 50
        self.addChild(highScoreLabel)
        
        
        displayScore.text = String(format: "Score: %i", score)
        
        
        displayScore = SKLabelNode(fontNamed: "Pusab")
        score = defaults.integerForKey("ScoreSaved")

        displayScore.position = CGPoint(x: self.frame.size.width*0.68 , y: self.frame.size.height*0.95)
        displayScore.fontSize = 70
        displayScore.text = String(format: "Score: %i", score)
        
        self.addChild(displayScore)
        
        
        if (highScore >= 100){
            
            highScoreLabel.fontColor = SKColor.greenColor()
            
        }
        if (score >= 100){
            
            
            displayScore.fontColor = SKColor.greenColor()
            
            
        }
        
        
        startButton = SKSpriteNode(imageNamed: "fixedRed")
        startButton.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.2)
        startButton.size = CGSize(width: 1250, height: 500)
        startButton.zPosition = -1
        startButton.name = "redButton"
        self.addChild(startButton)
        

        
    }
    
    
    
    
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
  
        for touch: AnyObject in touches {
            
            
            
            
            let tappedLocation = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(tappedLocation)
            let tappedNodeName: String? = tappedNode.name
            
            
            
            
            if (tappedNodeName == "startButton" || tappedNodeName == "redButton"){
                
                let myScene = GameScene(size: self.size)
                myScene.scaleMode = scaleMode
                let reveal = SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5)
                self.view?.presentScene(myScene, transition: reveal)
                print("hello")
                
                
            }
            
        }
        
        
        
    }
    

    
    
    
    
}
