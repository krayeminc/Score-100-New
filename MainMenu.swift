//
//  MainMenu.swift
//  Score 100
//
//  Created by S on 08/08/2015.
//  Copyright (c) 2015 KrayemApps. All rights reserved.
//

import Foundation
import SpriteKit


class MainMenu: SKScene {
    
    
    func hideAds(){
        
        
        NSNotificationCenter.defaultCenter().postNotificationName("hideadsID", object: nil)
        
    }
    
    func showAds(){
        
        
        NSNotificationCenter.defaultCenter().postNotificationName("showadsID", object: nil)
        
    }
    
    
    
    override func didMoveToView(view: SKView) {
        
        showAds()
        
        
        
        let title = SKSpriteNode(imageNamed: "score")
        title.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.8)
        title.size = CGSize(width: 1000, height: 500)
        self.addChild(title)
        
        
        backgroundColor = UIColor.blackColor()
        
        let startLabel = SKLabelNode(fontNamed: "Pusab")
        startLabel.text = "Tap here to start!"
        startLabel.name = "startButton"
        startLabel.fontSize = 70
        startLabel.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
        self.addChild(startLabel)
        
        let startButton = SKSpriteNode(imageNamed: "fixedRed")
        startButton.position = CGPoint(x: self.frame.size.width*0.495, y: self.frame.size.height/2)
        startButton.size = CGSize(width: 1250, height: 500)
        startButton.zPosition = -1
        startButton.name = "redButton"
        self.addChild(startButton)
        
        
        
        let creditsLabel = SKLabelNode(fontNamed: "Pusab")
        creditsLabel.text = "Credits"
        creditsLabel.name = "creditButton"
        creditsLabel.fontSize = 70
        creditsLabel.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.3)
        self.addChild(creditsLabel)
        
        let creditsButton = SKSpriteNode(imageNamed: "fixedButton")
        creditsButton.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.3)
        creditsButton.size = CGSize(width: 1200, height: 400)
        creditsButton.name = "creditButton1"
        creditsButton.zPosition = -1
        self.addChild(creditsButton)
        
        
        
        
        
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
 
        
        
        
        for touch: AnyObject in touches{
            let currentPoint = touch.locationInNode(self)
            
            let currentNode = nodeAtPoint(currentPoint)
            
            let nodeName: String? = currentNode.name
            
            if (nodeName == "startButton" || nodeName == "redButton"){
                
                self.runAction(SKAction.playSoundFileNamed("gameStart.wav", waitForCompletion: false))
                let myScene = GameScene(size: self.size)
                myScene.scaleMode = scaleMode
                let reveal = SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5)
                self.view?.presentScene(myScene, transition: reveal)
                
                
            }
            
            
            if (nodeName == "creditButton" || nodeName == "creditButton1"){
                
                self.runAction(SKAction.playSoundFileNamed("gameStart.wav", waitForCompletion: false))
                let myScene = CreditScene(size: self.size)
                myScene.scaleMode = scaleMode
                let reveal = SKTransition.fadeWithColor(UIColor.whiteColor(), duration: 0.5)
                self.view?.presentScene(myScene, transition: reveal)
                
                
                
                
                
                
            }
            
            
            
        }
        
    }
    
}