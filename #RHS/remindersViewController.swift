//
//  remindersViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/20/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class remindersViewController: UIViewController {
    
    @IBOutlet weak var period1:UISwitch!
    @IBOutlet weak var period2:UISwitch!
    @IBOutlet weak var period3:UISwitch!
    @IBOutlet weak var period4:UISwitch!
    @IBOutlet weak var period5:UISwitch!
    @IBOutlet weak var period6:UISwitch!
    @IBOutlet weak var period7:UISwitch!
    @IBOutlet weak var period8:UISwitch!
    @IBOutlet weak var period9:UISwitch!
    @IBOutlet weak var thirty:UISwitch!
    @IBOutlet weak var hour:UISwitch!
    @IBOutlet weak var breakstop:UISwitch!
    @IBOutlet weak var breaksbottom:UISwitch!
    @IBOutlet weak var tim:UILabel!
   

    var firstnotification:UILocalNotification = UILocalNotification ()
    var secondnotification:UILocalNotification = UILocalNotification ()
    var thirdnotification:UILocalNotification = UILocalNotification ()
    var fourthnotification:UILocalNotification = UILocalNotification ()
    var fifthnotification:UILocalNotification = UILocalNotification ()
    var sixthnotification:UILocalNotification = UILocalNotification ()
    var seventhnotification:UILocalNotification = UILocalNotification ()
    var eightnotification:UILocalNotification = UILocalNotification ()
    var ninthnotification:UILocalNotification = UILocalNotification ()
    var thirtynotification:UILocalNotification = UILocalNotification ()
    var hournotification:UILocalNotification = UILocalNotification ()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setremindtime()
/*
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
        if firstLaunch  {
            
            
        }
        else {
            print("First launch, setting values.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "break1default")
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "break2default")
            
        }
*/

        
        if NSUserDefaults .standardUserDefaults() .integerForKey("firstdefault") == 1 {
            period1.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("seconddefault") == 1 {
            period2.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("thirddefault") == 1 {
            period3.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("fourthdefault") == 1 {
            period4.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("fifthdefault") == 1 {
            period5.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("sixthdefault") == 1 {
            period6.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("seventhdefault") == 1 {
            period7.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("eightdefault") == 1 {
            period8.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("ninthdefault") == 1 {
            period9.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("thirtydefault") == 1 {
            thirty.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("hourdefault") == 1 {
            hour.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("break1default") == 1 {
            breakstop.setOn(true, animated: true)
        }
        
        if NSUserDefaults .standardUserDefaults() .integerForKey("break2default") == 1 {
            breaksbottom.setOn(true, animated: true)
        }
        
        
    }
    
    @IBAction func firstperiod(sender: UISwitch) {
        
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 8;
            dateComp.minute = 44;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            firstnotification.alertBody = "Period 1 ends in 5 minutes!"
            firstnotification.alertAction = "Open RHS app"
            firstnotification.timeZone = NSTimeZone .defaultTimeZone()
            firstnotification.fireDate = date
            firstnotification.repeatInterval = NSCalendarUnit.Day
            firstnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(firstnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "firstdefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(firstnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "firstdefault")
        }
        
        
    }
    
    @IBAction func secondperiod(sender: UISwitch) {
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 9;
            dateComp.minute = 28;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            secondnotification.alertBody = "Period 2 ends in 5 minutes!"
            secondnotification.alertAction = "Open RHS app"
            secondnotification.timeZone = NSTimeZone .defaultTimeZone()
            secondnotification.fireDate = date
            secondnotification.repeatInterval = NSCalendarUnit.Day
            secondnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(secondnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "seconddefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(secondnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "seconddefault")
        }

    }
    
    @IBAction func thirdperiod(sender: UISwitch) {
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 10;
            dateComp.minute = 12;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            thirdnotification.alertBody = "Period 3 ends in 5 minutes!"
            thirdnotification.alertAction = "Open RHS app"
            thirdnotification.timeZone = NSTimeZone .defaultTimeZone()
            thirdnotification.fireDate = date
            thirdnotification.repeatInterval = NSCalendarUnit.Day
            thirdnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(thirdnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "thirddefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(thirdnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "thirddefault")
        }
        
    }
    
    @IBAction func fourthperiod(sender: UISwitch) {
        
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 10;
            dateComp.minute = 55;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            fourthnotification.alertBody = "Period 4 ends in 5 minutes!"
            fourthnotification.alertAction = "Open RHS app"
            fourthnotification.timeZone = NSTimeZone .defaultTimeZone()
            fourthnotification.fireDate = date
            fourthnotification.repeatInterval = NSCalendarUnit.Day
            fourthnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(fourthnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "fourthdefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(fourthnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "fourthdefault")
        }

        
    }
    
    @IBAction func fifthperiod(sender: UISwitch) {
        
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 11;
            dateComp.minute = 39;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            fifthnotification.alertBody = "Period 5 ends in 5 minutes!"
            fifthnotification.alertAction = "Open RHS app"
            fifthnotification.timeZone = NSTimeZone .defaultTimeZone()
            fifthnotification.fireDate = date
            fifthnotification.repeatInterval = NSCalendarUnit.Day
            fifthnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(fifthnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "fifthdefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(fifthnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "fifthdefault")
        }

        
    }
    
    @IBAction func sixthperiod(sender: UISwitch) {
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 12;
            dateComp.minute = 24;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            sixthnotification.alertBody = "Period 6 ends in 5 minutes!"
            sixthnotification.alertAction = "Open RHS app"
            sixthnotification.timeZone = NSTimeZone .defaultTimeZone()
            sixthnotification.fireDate = date
            sixthnotification.repeatInterval = NSCalendarUnit.Day
            sixthnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(sixthnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "sixthdefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(sixthnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "sixthdefault")
        }

    }
    
    @IBAction func seventhperiod(sender: UISwitch) {
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 13;
            dateComp.minute = 8;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            seventhnotification.alertBody = "Period 7 ends in 5 minutes!"
            seventhnotification.alertAction = "Open RHS app"
            seventhnotification.timeZone = NSTimeZone .defaultTimeZone()
            seventhnotification.fireDate = date
            seventhnotification.repeatInterval = NSCalendarUnit.Day
            seventhnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(seventhnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "seventhdefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(seventhnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "seventhdefault")
        }
    
    }
    
    @IBAction func eighthperiod(sender: UISwitch) {
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 13;
            dateComp.minute = 52;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            eightnotification.alertBody = "Period 8 ends in 5 minutes!"
            eightnotification.alertAction = "Open RHS app"
            eightnotification.timeZone = NSTimeZone .defaultTimeZone()
            eightnotification.fireDate = date
            eightnotification.repeatInterval = NSCalendarUnit.Day
            eightnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(eightnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "eightdefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(eightnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "eightdefault")
        }

    }
    
    @IBAction func ninthperiod(sender: UISwitch) {
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 14;
            dateComp.minute = 36;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            ninthnotification.alertBody = "Period 9 ends in 5 minutes!"
            ninthnotification.alertAction = "Open RHS app"
            ninthnotification.timeZone = NSTimeZone .defaultTimeZone()
            ninthnotification.fireDate = date
            ninthnotification.repeatInterval = NSCalendarUnit.Day
            ninthnotification.soundName = "wake wave.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(ninthnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "ninthdefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(ninthnotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "ninthdefault")
        }
        
    }
    
    @IBAction func beforethirty(sender: UISwitch) {
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 7;
            dateComp.minute = 30;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            thirtynotification.alertBody = "Wake up! School starts in 30 minutes!"
            thirtynotification.alertAction = "Open RHS app"
            thirtynotification.timeZone = NSTimeZone .defaultTimeZone()
            thirtynotification.fireDate = date
            thirtynotification.repeatInterval = NSCalendarUnit.Day
            thirtynotification.soundName = "goodmorning.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(thirtynotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "thirtydefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(thirtynotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "thirtydefault")
        }
        
    }
    
    @IBAction func beforesixty(sender: UISwitch) {
        if sender.on == true {
            
            let dateComp:NSDateComponents = NSDateComponents()
            dateComp.year = 2015;
            dateComp.month = 11;
            dateComp.day = 10;
            dateComp.hour = 7;
            dateComp.minute = 0;
            dateComp.timeZone = NSTimeZone.systemTimeZone()
            
            let calender:NSCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
            let date:NSDate = calender.dateFromComponents(dateComp)!
            
            hournotification.alertBody = "Wake up! School starts in one hour!"
            hournotification.alertAction = "Open RHS app"
            hournotification.timeZone = NSTimeZone .defaultTimeZone()
            hournotification.fireDate = date
            hournotification.repeatInterval = NSCalendarUnit.Day
            hournotification.soundName = "goodmorning.wav"
            UIApplication .sharedApplication() .scheduleLocalNotification(hournotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(1, forKey: "hourdefault")
        }
        else
        {
            UIApplication .sharedApplication() .cancelLocalNotification(hournotification)
            
            NSUserDefaults .standardUserDefaults() .setInteger(0, forKey: "hourdefault")
        }

    }
    
    @IBAction func breakset1(sender: UISwitch) {
        
    }
    
    @IBAction func breakset2(sender: UISwitch) {
        
    }
    
    func setremindtime() {
        let date = NSDate()
        let dateFormatter2:NSDateFormatter = NSDateFormatter()
        dateFormatter2.dateFormat = "hh:mm a"
        tim.text = dateFormatter2.stringFromDate(date)
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
