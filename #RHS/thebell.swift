//
//  thebell.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/30/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit
import AVFoundation

class thebell: UIViewController {
    
    @IBOutlet weak var soundbell:UIButton!
    @IBOutlet weak var timerchoice:UISegmentedControl!
    @IBOutlet weak var areyousure:UIButton!
    @IBOutlet weak var setatimerlabel:UILabel!
    var timervalue = NSTimeInterval()
    var bellnotification = UILocalNotification()
    var bellplayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let path:String? = NSBundle.mainBundle().pathForResource("bellsound", ofType: "wav") {
            let succesUrl:NSURL = NSURL(fileURLWithPath: path!)
            bellplayer = try? AVAudioPlayer(contentsOfURL: succesUrl)
        }

    }
    
    @IBAction func soundit () {
        bellplayer .play()
    }
    
    
    @IBAction func settimerint(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            timervalue = 20
        case 1:
            timervalue = 60
        case 2:
            timervalue = 180
        case 3:
            timervalue = 300
        default:
            print("hi")
        }
        
        areyousure.hidden = false
        timerchoice.enabled = false
        
    }
    
    @IBAction func areyousureselect () {
        bellnotification.alertBody = "BELL!"
        bellnotification.alertAction = "Open RHS app"
        bellnotification.timeZone = NSTimeZone .defaultTimeZone()
        bellnotification.fireDate = NSDate(timeIntervalSinceNow: timervalue)
        bellnotification.soundName = "bellsound.wav"
        UIApplication .sharedApplication() .scheduleLocalNotification(bellnotification)
        
        areyousure.hidden = true
        setatimerlabel.text = "Timer set, lock phone."
        soundbell.enabled = false

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
