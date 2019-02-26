//
//  CreditScene.swift
//  Score 100
//
//  Created by S on 08/08/2015.
//  Copyright (c) 2015 KrayemApps. All rights reserved.
//

import Foundation
import SpriteKit


class CreditScene: SKScene {
    
    
    var button = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        
        
        
        backgroundColor = UIColor.blackColor()
        
        let title = SKSpriteNode(imageNamed: "score")
        title.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.8)
        title.size = CGSize(width: 1000, height: 500)
        self.addChild(title)
        
        let creditsLabel = SKLabelNode(fontNamed: "Pusab")
        creditsLabel.text = "Game by KrayemApps"
        creditsLabel.fontSize = 50
        creditsLabel.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.68)
        addChild(creditsLabel)
        
        
        let credits2Label = SKLabelNode(fontNamed: "Pusab")
        credits2Label.text = "Button Graphics: freedesignfile"
        credits2Label.fontSize = 35
        credits2Label.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.57)
        addChild(credits2Label)
        
        let credits3Label = SKLabelNode(fontNamed: "Pusab")
        credits3Label.text = "Font: Pusab by Bagel & Co"
        credits3Label.fontSize = 35
        credits3Label.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.52)
        addChild(credits3Label)
        
        let credits4Label = SKLabelNode(fontNamed: "Pusab")
        credits4Label.text = "Background Audio: zagi2"
        credits4Label.fontSize = 35
        credits4Label.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.47)
        addChild(credits4Label)
        
        let credits5Label = SKLabelNode(fontNamed: "Pusab")
        credits5Label.text = "Button Audio: 'Plasterbrain'"
        credits5Label.fontSize = 35
        credits5Label.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.42)
        addChild(credits5Label)
        
        let credits6Label = SKLabelNode(fontNamed: "Pusab")
        credits6Label.text = "Game End Audio: 'Plasterbrain'"
        credits6Label.fontSize = 35
        credits6Label.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.37)
        addChild(credits6Label)
        
        let credits7Label = SKLabelNode(fontNamed: "Pusab")
        credits7Label.text = "All Audio And Graphics Licensed"
        credits7Label.fontSize = 35
        credits7Label.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.32)
        addChild(credits7Label)
        
        let credits72Label = SKLabelNode(fontNamed: "Pusab")
        credits72Label.text = "Under Creative-Commons License"
        credits72Label.fontSize = 35
        credits72Label.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.3)
        addChild(credits72Label)
        
        let backLabel = SKLabelNode(fontNamed: "Pusab")
        backLabel.text = "Menu"
        backLabel.name = "backButton"
        backLabel.fontSize = 70
        backLabel.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.2)
        addChild(backLabel)
        
        let moreInfo = SKLabelNode(fontNamed: "Pusab")
        moreInfo.text = "Tap to see the full license information"
        moreInfo.name = "infoButton"
        moreInfo.position = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.63)
        moreInfo.fontSize = 37
        self.addChild(moreInfo)
        
        
        
        button = SKSpriteNode(imageNamed: "fixedButton")
        button.position =  CGPoint(x: self.frame.size.width/2, y: self.frame.size.height*0.2)
        button.name = "blueButton"
        button.zPosition = -1
        button.size = CGSize(width: 700, height: 300)
        self.addChild(button)
        
        
        
        
        
        
        
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
   
        
        for touch: AnyObject in touches{
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
            
            
            if (tappedNodeName == "infoButton"){
                
                UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/score100App?ref=profile")!)
                
                
                
            }
            
            
            
        }
        
    }
    
    
    
    
    
    
}

