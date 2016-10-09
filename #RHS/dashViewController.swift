//
//  dashViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/26/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class dashViewController: UIViewController {
    
    @IBOutlet weak var bestlabel:UILabel!
    @IBOutlet weak var scorelabel:UILabel!
    @IBOutlet weak var startbutton:UIButton!
    @IBOutlet weak var goodsquare:UIImageView!
    @IBOutlet weak var righttapjump:UIButton!
    @IBOutlet weak var lefttapjump:UIButton!
    @IBOutlet weak var fulltap:UIButton!
    @IBOutlet weak var badsquare:UIImageView!
    @IBOutlet weak var theview:UIView!
    var score = Int()
    var movementetimer = NSTimer()
    var shown = true
    var new = true
    var best = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        badsquare.clipsToBounds = true
        
        let bestfirst = NSUserDefaults .standardUserDefaults() .integerForKey("bestnumber")
        best = bestfirst
        bestlabel.text = "Best \(bestfirst)"
        
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("squarefirst")
        if firstLaunch  {
            
            
        }
        else {
            print("First launch, showing tutorial.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "squarefirst")
            theview.hidden = false
        }

    }
    
    override func viewDidAppear(animated: Bool) {
        let hwload = NSUserDefaults .standardUserDefaults() .integerForKey("assigned")
        if hwload >= 6 {
            
            let hwAlert = SCLAlertView()
            hwAlert.showWarning("You have a lot of hw!", subTitle: "Why don't you do your homework, and then play Square Dash? If you get addicted it will never get done!", closeButtonTitle: "Ok")
        }

    }
    
    @IBAction func start(sender:AnyObject) {
        if new == true {
            animations()
            startbutton.hidden = true
        }
        else {
            startbutton .setTitle("Tap to Start", forState: UIControlState.Normal)
            badsquare.frame.origin.x = 415
            score = 0
            scorelabel.text = "00"
            new = true
        }
    }
    
    func animations() {
        movementetimer = NSTimer .scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(dashViewController.squaremove), userInfo: nil, repeats: true)
    }
    
    func squaremove() {
        
        if badsquare.frame.origin.x <= -70 {
            score += 1
            scorelabel.text = "\(score)"
            badsquare.frame.origin.x = 600
        }
        
        if (badsquare.frame.intersects(goodsquare.frame)) && (shown == true) {
            gameover()
        }
        
        badsquare.frame.origin.x = badsquare.frame.origin.x-3
    }
 
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        theview.hidden = true
        //goodsquare.image = UIImage(named: "blankimage.png")
        //shown = false
    }
/*
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        goodsquare.image = UIImage(named: "squaredash.png")
        shown = true
    }
*/
    
    @IBAction func tapjumped(sender:AnyObject) {
        goodsquare.image = UIImage(named: "blankimage.png")
        shown = false
        righttapjump.enabled = false
        lefttapjump.enabled = false
        fulltap.enabled = false
        NSTimer .scheduledTimerWithTimeInterval(0.55, target: self, selector: #selector(dashViewController.reshow), userInfo: nil, repeats: false)
        
    }
    
    func reshow() {
        goodsquare.image = UIImage(named: "squaredash.png")
        shown = true
        righttapjump.enabled = true
        lefttapjump.enabled = true
        fulltap.enabled = true
    }
    
    func gameover() {
        movementetimer.invalidate()
        startbutton.hidden = false
        startbutton .setTitle("Tap to Restart", forState: UIControlState.Normal)
        new = false
        if score > best {
            bestlabel.text = "Best \(score)"
            NSUserDefaults .standardUserDefaults() .setInteger(score, forKey: "bestnumber")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
