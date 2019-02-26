//
//  GameViewController.swift
//  Score 100
//
//  Created by S on 08/08/2015.
//  Copyright (c) 2015 KrayemApps. All rights reserved.
//
import iAd
import UIKit
import SpriteKit
import AVFoundation




extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            let sceneData = try! NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController, ADBannerViewDelegate{
    
    
     var HeyZap = HeyzapAds()
    var ThemePlayer = AVAudioPlayer()
    
    
    var SH = UIScreen.mainScreen().bounds.height
    let transition = SKTransition.fadeWithDuration(1)
    var UIiAd: ADBannerView = ADBannerView()

  /*
    var interAd = ADInterstitialAd()
    var interAdView: UIView = UIView()
    
    var closeButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    /*
        closeButton.frame = CGRectMake(20 , 20, 40, 40)
        closeButton.layer.cornerRadius = 20
        closeButton.setTitle("x", forState: .Normal)
        closeButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        closeButton.backgroundColor = UIColor.whiteColor()
        closeButton.layer.borderColor = UIColor.blackColor().CGColor
        closeButton.layer.borderWidth = 1
        closeButton.addTarget(self, action: "close:", forControlEvents: UIControlEvents.TouchDown) 
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadAd", name: "loadAdID", object: nil) */

        
        /*
        let path = NSBundle.mainBundle().pathForResource("music1", ofType: "wav")
        let backingMusic = NSURL(fileURLWithPath:path!)
      //  ThemePlayer = AVAudioPlayer(contentsOfURL:backingMusic, fileTypeHint: nil)
        //ThemePlayer.prepareToPlay()
        ThemePlayer.numberOfLoops = -1
        ThemePlayer.play() */

        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "muteGame", name: "mutingGame", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "unmuteGame", name: "unmutingGame", object: nil)
        
        
        
        
        self.UIiAd.hidden = true
        self.UIiAd.alpha = 0
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "hideBannerAd", name: "hideadsID", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showBannerAd", name: "showadsID", object: nil)
        
        
        let scene = MainMenu(size:CGSize(width: 1536, height: 2048))
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFill
        
        skView.presentScene(scene)
        
        
        
        
        
        
        
    }
    

    
    func unmuteGame(){
        
        ThemePlayer.play()
        
        
    }
    
    func muteGame(){
        
        ThemePlayer.pause()
        
        
    }
    
    
    /*
    func close(sender: UIButton) {
        
        closeButton.removeFromSuperview()
        interAdView.removeFromSuperview()
        
    }
    
    
    
    
    func loadAd(){
        
        println("load Ad")
        interAd = ADInterstitialAd()
        interAd.delegate = self
        
    }
    
    
    func interstitialAdDidLoad(interstitialAd: ADInterstitialAd!) {
        println("ad did load")
        interAdView = UIView()
        interAdView.frame = self.view.bounds
        view.addSubview(interAdView)
        
        interAd.presentInView(interAdView)
        UIViewController.prepareInterstitialAds()
        
        interAdView.addSubview(closeButton)
        
        
    }
    
    
    func interstitialAdDidUnload(interstitialAd: ADInterstitialAd!) {
        
        
        
        
    }
    
    func interstitialAd(interstitialAd: ADInterstitialAd!, didFailWithError error: NSError!) {
        println("failed to recieve")
        println(error.localizedDescription)
        
        closeButton.removeFromSuperview()
        interAdView.removeFromSuperview()
        
    }
    

    
    
   func interstitialAdActionShouldBegin(interstitialAd: ADInterstitialAd!, willLeaveApplication willLeave: Bool) -> Bool {
        // Configure the view.
        let skView = self.view as! SKView
        skView.paused = true
        
        
        
        
        println("3")
        
        return true

        
        
        
        
    }
    
    
    func interstitialAdActionDidFinish(interstitialAd: ADInterstitialAd!) {
        println("2")
        
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.paused = false
    } */
    
    

    

    
    
    
    override func viewWillAppear(animated: Bool) {
        let BV = UIiAd.bounds.height
        UIiAd.delegate = self
        UIiAd.frame = CGRectMake(0, SH + BV, 0, 0)
        self.view.addSubview(UIiAd)
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIiAd.delegate = nil
        UIiAd.removeFromSuperview()
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        var BV = UIiAd.bounds.height
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1) // Time it takes the animation to complete
        UIiAd.alpha = 1 // Fade in the animation
        UIView.commitAnimations()
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        UIiAd.alpha = 0
        UIView.commitAnimations()
    }
    
    func showBannerAd() {
        UIiAd.hidden = false
        let BV = UIiAd.bounds.height
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1) // Time it takes the animation to complete
        UIiAd.frame = CGRectMake(0, SH - BV, 0, 0) // End position of the animation
        UIView.commitAnimations()
    }
    
    func hideBannerAd() {
        UIiAd.hidden = true
        let BV = UIiAd.bounds.height
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1) // Time it takes the animation to complete
        UIiAd.frame = CGRectMake(0, SH + BV, 0, 0) // End position of the animation
        UIView.commitAnimations()
    }
    

    
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return UIInterfaceOrientationMask.AllButUpsideDown
        } else {
            return UIInterfaceOrientationMask.All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

