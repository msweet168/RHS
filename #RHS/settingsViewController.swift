//
//  settingsViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/30/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit
import AVFoundation

class settingsViewController: UIViewController {
    
    @IBOutlet weak var bellfield:UITextField!
    var versionint = 0
    var changescore = false
    @IBOutlet weak var firstnamelabel:UILabel!
    @IBOutlet weak var gradething:UILabel!
    var bacotplayer = AVAudioPlayer()
    
    
    @IBAction func versiontap() {
        versionint += 1
//        NSTimer .scheduledTimerWithTimeInterval(0.2, target: self, selector: Selector("reset"), userInfo: nil, repeats: false)
        if versionint == 15 {
            bellfield.hidden = false
        }
    }

    @IBAction func activatebell(sender: UITextField) {
        if sender.text == "bellme" {
            //sender.text = "You have been belled."
            NSUserDefaults .standardUserDefaults().setInteger(11, forKey: "bellapp")
            let theAlert = SCLAlertView()
            theAlert.showError("We're Sorry", subTitle: "This feature is no longer supported.", closeButtonTitle: "Dismiss")
        
        }
        else if sender.text == "unbellme" {
            sender.text = "The bell is gone."
            NSUserDefaults .standardUserDefaults().setInteger(0, forKey: "bellapp")
        }
        else if sender.text == "myscoreistoolow" {
            sender.text = "Ok, enter what you want"
            
            NSTimer .scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(settingsViewController.timedchange), userInfo: nil, repeats: false)
        }
        else if sender.text == "hello"{
            sender.text = "Why hello to you too!"
        }
        else if sender.text == "JK"{
            sender.text = "Rowling!"
        }
        else if sender.text == "BCOT!" {
            bacotplayer .play()
            sender.text = "Thats John!"
        }
        else if (sender.text == "changetheme(blue)") || (sender.text == "resettheme") {
            NSUserDefaults .standardUserDefaults() .setObject("blue", forKey: "themechange")
            sender.text = "Success"
        }
        else if sender.text == "changetheme(yellow)" {
             NSUserDefaults .standardUserDefaults() .setObject("yellow", forKey: "themechange")
            sender.text = "Success"
        }
        else if sender.text == "changetheme(green)" {
             NSUserDefaults .standardUserDefaults() .setObject("green", forKey: "themechange")
            sender.text = "Success"
        }
        else if sender.text == "changetheme(black)" {
             NSUserDefaults .standardUserDefaults() .setObject("black", forKey: "themechange")
            sender.text = "Success"
        }
        else if sender.text == "changetheme(pink)" {
             NSUserDefaults .standardUserDefaults() .setObject("pink", forKey: "themechange")
            sender.text = "Success"
        }
        else if sender.text == "changetheme(orange)" {
             NSUserDefaults .standardUserDefaults() .setObject("orange", forKey: "themechange")
            sender.text = "Success"
        }
        else if sender.text == "changetheme(red)" {
             NSUserDefaults .standardUserDefaults() .setObject("red", forKey: "themechange")
            sender.text = "Success"
        }
        else if sender.text == "changetheme(purple)" {
            NSUserDefaults .standardUserDefaults() .setObject("purple", forKey: "themechange")
            sender.text = "Success"
        }
        else if sender.text == "imissstudentlife" {
            self.performSegueWithIdentifier("life", sender: self)
        }
        else if sender.text == "1.1tut" {
            let vc = updatetutcontroller()
            self.presentViewController(vc, animated: true, completion: nil)
        }
        else if sender.text == "changegrade(fresh)" {
            NSUserDefaults .standardUserDefaults().setObject("fresh", forKey: "class")
            sender.text = "Success"
        }
        else if sender.text == "changegrade(soph)" {
            NSUserDefaults .standardUserDefaults().setObject("soph", forKey: "class")
            sender.text = "Success"
        }
        else if sender.text == "changegrade(junior)" {
            NSUserDefaults .standardUserDefaults() .setObject("junior", forKey: "class")
            sender.text = "Success"
        }
        else if sender.text == "changegrade(senior)" {
            NSUserDefaults .standardUserDefaults().setObject("senior", forKey: "class")
            sender.text = "Success"
        }
        else if sender.text == "changegrade(other)" {
            NSUserDefaults .standardUserDefaults() .setObject("other", forKey: "class")
            sender.text = "Success"
        }
        else if sender.text == "changegrade(alumni)" {
            NSUserDefaults.standardUserDefaults().setObject("alum", forKey: "class")
            sender.text = "Success"
        }
        else if sender.text == "sixflags(going)" {
            NSUserDefaults .standardUserDefaults() .setObject("going", forKey: "sixflags")
            sender.text = "Completed"
        }
        else if sender.text == "sixflags(notgoing)" {
            NSUserDefaults .standardUserDefaults() .setObject("notgoing", forKey: "sixflags")
            sender.text = "Completed"
        }
        else if sender.text == "resetprofilechangecounter" {
            NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "profilechange")
            sender.text = "Counter reset to 0"
        }
        else if sender.text == "space pig" {
            sender.text = "Astronomy Club Rules!!"
        }
        else if sender.text == "physics rules" {
           sender.text = "How are you Mr.K"
        }
        else if changescore == false
        {
            sender.text = "???"
        }
        
        
        if changescore == true {
            changescore = false
            let number = Int(sender.text!)
            NSUserDefaults .standardUserDefaults() .setInteger(number!, forKey: "bestnumber")
            sender.text = "Your score has been changed."
            sender.enabled = false
        }
        
        sender.resignFirstResponder()
        
    }
    
    func timedchange() {
        changescore = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        firstnamelabel.text = "\(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!) \(NSUserDefaults .standardUserDefaults().stringForKey("lastname")!) "
        
        
        let grade:String = NSUserDefaults .standardUserDefaults() .stringForKey("class")!
        
        if grade == "fresh" {
            gradething.text = "Freshman"
        }
        else if grade == "soph" {
            gradething.text = "Sophmore"
        }
        else if grade == "junior" {
            gradething.text = "Junior"
        }
        else if grade == "senior" {
            gradething.text = "Senior"
        }
        else if grade == "other" {
            gradething.text = "Parent/Faculity"
        }
        else if grade == "alum" {
            gradething.text = "Alumni"
        }
        else
        {
            gradething.text = "Error 103"
        }
        
        if let path:String? = NSBundle.mainBundle().pathForResource("bacot", ofType: "mp3") {
            let succesUrl:NSURL = NSURL(fileURLWithPath: path!)
            bacotplayer = try! AVAudioPlayer(contentsOfURL: succesUrl)
        }
        
        
    }
    
    @IBAction func gotowebsite(sender:AnyObject) {
         UIApplication .sharedApplication() .openURL(NSURL(string: "http://www.sweetdevelop.com")!)
    }
    
    @IBAction func gotosupport(sender:AnyObject) {
        UIApplication .sharedApplication() .openURL(NSURL(string: "http://www.sweetdevelop.com/contact")!)
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
