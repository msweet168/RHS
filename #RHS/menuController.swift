//
//  menuController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/13/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

extension UIColor {
    class func RHSBlue() -> UIColor {
        return UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
    }
    struct Constants {
        private static let colorMap: [String: UIColor] = [
            "blue": .RHSBlue(),
            "red": .redColor(),
            "green": .greenColor(),
            "black": .blackColor(),
            "orange": .orangeColor(),
            "pink": .magentaColor(),
            "purple": .purpleColor()
        ]
    }
    class func named(name: String) -> UIColor? {
        return Constants.colorMap[name]
    }
}

class menuController: UIViewController {
    
    @IBOutlet weak var menuscrollview:UIScrollView!
    
    @IBOutlet weak var roslynhighschool:UILabel!
    @IBOutlet weak var welcomelabel:UILabel!
    @IBOutlet weak var datelabel:UILabel!
    @IBOutlet weak var currentperiod:UILabel!
    @IBOutlet weak var time:UILabel!
    @IBOutlet weak var dayprogress:UIProgressView!
    @IBOutlet weak var hallview:UIImageView!
    @IBOutlet weak var letterday:UILabel!
    @IBOutlet weak var bellappimage:UIImageView!
    @IBOutlet weak var bellappbutton:UIButton!
    @IBOutlet weak var bellappview:UIView!
    @IBOutlet weak var whatsnewview:UIView!
    @IBOutlet weak var whatsnewname:UILabel!
    @IBOutlet weak var weekendlabel:UILabel!
    @IBOutlet weak var topdeck:UIView!
    @IBOutlet weak var assignmentsipad:UILabel!
    @IBOutlet weak var yesbutton:UIButton!
    
    
    var letterboola = Bool()
    var clocktimer = NSTimer()
    var dayofweek = String()
    var dayofmonth = String()
    let period1 = ["08:05 AM", "08:06 AM","08:07 AM", "08:08 AM","08:09 AM", "08:10 AM","08:11 AM", "08:12 AM","08:13 AM", "08:14 AM","08:15 AM", "08:16 AM","08:17 AM", "08:18 AM","08:19 AM", "08:20 AM","08:21 AM", "08:22 AM","08:23 AM", "08:24 AM","08:25 AM", "08:26 AM","08:27 AM", "08:28 AM","08:29 AM", "08:30 AM","08:31 AM", "08:32 AM","08:33 AM", "08:34 AM","08:35 AM", "08:36 AM","08:37 AM", "08:38 AM","08:39 AM", "08:40 AM","08:41 AM", "08:42 AM","08:43 AM", "08:44 AM","08:45 AM", "08:46 AM","08:47 AM", "08:48 AM"]
    let period2 = ["08:52 AM", "08:53 AM","08:54 AM", "08:55 AM","08:56 AM", "08:57 AM","08:58 AM", "08:59 AM","09:00 AM", "09:01 AM","09:02 AM", "09:03 AM","09:04 AM", "09:05 AM","09:06 AM", "09:07 AM","09:08 AM", "09:09 AM","09:10 AM", "09:11 AM","09:12 AM", "09:13 AM","09:14 AM", "09:15 AM","09:16 AM", "09:17 AM","09:18 AM", "09:19 AM","09:20 AM", "09:21 AM","09:22 AM", "09:23 AM","09:24 AM", "09:25 AM","09:26 AM", "09:27 AM","09:28 AM", "09:29 AM","09:30 AM", "09:31 AM","09:32 AM"]
    let period3 = ["09:36 AM", "09:37 AM","09:38 AM", "09:39 AM","09:40 AM", "09:41 AM","09:42 AM", "09:43 AM","09:44 AM", "09:45 AM","09:46 AM", "09:47 AM","09:48 AM", "09:49 AM","09:50 AM", "09:51 AM","09:52 AM", "09:53 AM","09:54 AM", "09:55 AM","09:56 AM", "09:57 AM","09:58 AM", "09:59 AM","10:00 AM", "10:01 AM","10:02 AM", "10:03 AM","10:04 AM", "10:05 AM","10:06 AM", "10:07 AM","10:08 AM", "10:09 AM","10:10 AM", "10:11 AM","10:12 AM", "10:13 AM","10:14 AM", "10:15 AM","10:16 AM"]
    let period5 = ["11:20 AM", "11:21 AM","11:22 AM", "11:23 AM","11:24 AM", "11:25 AM","11:26 AM", "11:27 AM","11:28 AM", "11:29 AM","11:30 AM", "11:31 AM","11:32 AM", "11:33 AM","11:34 AM", "11:35 AM","11:36 AM", "11:37 AM","11:38 AM", "11:39 AM","11:40 AM", "11:41 AM","11:42 AM", "11:43 AM","11:44 AM", "11:05 AM","11:06 AM", "11:07 AM","11:08 AM", "11:09 AM","11:10 AM", "11:11 AM","11:12 AM", "11:13 AM","11:14 AM", "11:15 AM","11:16 AM", "11:17 AM","11:18 AM", "11:19 AM","11:04 AM"]
    let period4 = ["10:20 AM", "10:21 AM","10:22 AM", "10:23 AM","10:24 AM", "10:25 AM","10:26 AM", "10:27 AM","10:28 AM", "10:29 AM","10:30 AM", "10:31 AM","10:32 AM", "10:33 AM","10:34 AM", "10:35 AM","10:36 AM", "10:27 AM","10:38 AM", "10:39 AM","10:40 AM", "10:41 AM","10:42 AM", "10:43 AM","10:44 AM", "10:45 AM","10:46 AM", "10:47 AM","10:48 AM", "10:49 AM","10:50 AM", "10:51 AM","10:52 AM", "10:53 AM","10:54 AM", "10:55 AM","10:56 AM", "10:57 AM","10:58 AM", "10:59 AM","11:00 AM"]
    let period6 = ["11:48 AM", "11:49 AM","11:50 AM", "11:51 AM","11:52 AM", "11:53 AM","11:54 AM", "11:55 AM","11:56 AM", "11:57 AM","11:58 AM", "11:59 AM","12:00 PM", "12:01 PM","12:02 PM", "12:03 PM","12:04 PM", "12:05 PM","12:06 PM", "12:07 PM","12:08 PM", "12:09 PM","12:10 PM", "12:11 PM","12:12 PM", "12:13 PM","12:14 PM", "12:15 PM","12:16 PM", "12:17 PM","12:18 PM", "12:19 PM","12:20 PM", "12:21 PM","12:22 PM", "12:23 PM","12:24 PM", "12:25 PM","12:26 PM", "12:27 PM","12:28 PM"]
    let period7 = ["12:32 PM", "12:33 PM","12:34 PM", "12:35 PM","12:36 PM", "12:37 PM","12:38 PM", "12:39 PM","12:40 PM", "12:41 PM","12:42 PM", "12:43 PM","12:44 PM", "12:45 PM","12:46 PM", "12:47 PM","12:48 PM", "12:49 PM","12:50 PM", "12:51 PM","12:52 PM", "12:53 PM","12:54 PM", "12:55 PM","12:56 PM", "12:57 PM","12:58 PM", "12:59 PM","01:00 PM", "01:01 PM","01:02 PM", "01:03 PM","01:04 PM", "01:05 PM","01:06 PM", "01:07 PM","01:08 PM", "01:09 PM","01:10 PM", "01:11 PM","01:12 PM"]
    let period8 = ["01:16 PM", "01:17 PM","01:18 PM", "01:19 PM","01:20 PM", "01:21 PM","01:22 PM", "01:23 PM","01:24 PM", "01:55 PM","01:25 PM", "01:26 PM","01:27 PM", "01:28 PM","01:29 PM", "01:30 PM","01:31 PM", "01:32 PM","01:33 PM", "01:34 PM","01:35 PM", "01:36 PM","01:37 PM", "01:38 PM","01:39 PM", "01:40 PM","01:41 PM", "01:42 PM","01:43 PM", "01:44 PM","01:45 PM", "01:46 PM","01:47 PM", "01:56 PM","01:48 PM", "01:49 PM","01:50 PM", "01:51 PM","01:52 PM", "01:53 PM","01:54 PM"]
    let period9 = ["02:16 PM", "02:17 PM","02:18 PM", "02:19 PM","02:20 PM", "02:21 PM","02:22 PM", "02:23 PM","02:24 PM", "02:15 PM","02:25 PM", "02:26 PM","02:27 PM", "02:28 PM","02:29 PM", "02:30 PM","02:31 PM", "02:32 PM","02:33 PM", "02:34 PM","02:35 PM", "02:36 PM","02:37 PM", "02:38 PM","02:39 PM", "02:40 PM","02:00 PM", "02:01 PM","02:02 PM", "02:03 PM","02:04 PM", "02:05 PM","02:06 PM", "02:07 PM","02:08 PM", "02:09 PM","02:10 PM", "02:11 PM","02:12 PM", "02:13 PM","02:14 PM"]
    let extrahelp = ["02:41 PM", "02:42 PM","02:43 PM", "02:44 PM","02:45 PM", "02:46 PM","02:47 PM", "02:48 PM","02:49 PM", "02:50 PM","02:51 PM", "02:52 PM","02:53 PM", "02:54 PM","02:55 PM", "02:56 PM","02:57 PM", "02:58 PM","02:59 PM", "03:00 PM","03:01 PM", "03:02 PM","03:03 PM", "03:04 PM","03:05 PM", "03:06 PM","03:07 PM", "03:08 PM","03:09 PM", "03:10 PM"]
    let bell = ["08:00 AM", "08:01 AM","08:02 AM", "08:03 AM","08:04 AM", "08:49 AM","08:50 AM", "08:51 AM","09:33 AM", "09:34 AM","09:35 AM", "10:17 AM","10:18 AM", "10:19 AM","11:01 AM", "11:02 AM","11:03 AM", "11:45 AM","11:46 AM", "11:47 AM", "12:29 PM","12:30 PM", "12:31 PM","01:13 PM", "01:14 PM","01:15 PM", "01:57 PM","01:58 PM", "01:59 PM"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //menuscrollview.contentSize = CGSizeMake(self.view.frame.size.width, 1000
        
        let doescontain:Bool = self.view.subviews.contains(assignmentsipad)
        
        if doescontain == true {
            assignmentsipad.text = "\(NSUserDefaults .standardUserDefaults() .stringForKey("assigned")!) Assignments"
        }
        
        //Parallax effects
        let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
            type: .TiltAlongVerticalAxis)
        verticalMotionEffect.minimumRelativeValue = -10
        verticalMotionEffect.maximumRelativeValue = 10
        
        // Set horizontal effect
        let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
            type: .TiltAlongHorizontalAxis)
        horizontalMotionEffect.minimumRelativeValue = -10
        horizontalMotionEffect.maximumRelativeValue = 10
        
        // Create group to combine both
        let group = UIMotionEffectGroup()
        group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
        
        // Add both effects to your view
        hallview.addMotionEffect(group)
        currentperiod.addMotionEffect(group)
        
        //View setters
        welcomelabel.text = "Welcome back \(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!)!"
        whatsnewname.text = "What's up \(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!)!"
        
        setupclock()
        clockupdater()
        setupthedate()
        setbell()
       
        
        let themestring = NSUserDefaults.standardUserDefaults()
                                        .stringForKey("themechange") ?? "blue"
        topdeck.backgroundColor = UIColor.named(themestring) ?? .RHSBlue()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        splashScreen()
    }
    
    func setupthedate() {
        
        let currentdate = NSDate()
        let currentdateFormatter:NSDateFormatter = NSDateFormatter()
        currentdateFormatter.dateFormat = "EEEE MM/dd/YYYY"
        datelabel.text = currentdateFormatter.stringFromDate(currentdate)
        
        let dayofmonthformatter:NSDateFormatter = NSDateFormatter()
        dayofmonthformatter.dateFormat = "dd"
        dayofmonth = dayofmonthformatter.stringFromDate(currentdate)
        
        let colordateformat:NSDateFormatter = NSDateFormatter()
        colordateformat.dateFormat = "EEEE"
        let forcolorstring = colordateformat.stringFromDate(currentdate)
        //Day of week string for extra help detector
        dayofweek = forcolorstring
        //Monday/Friday greetings
        if forcolorstring == "Monday" {
            welcomelabel.text = "Happy Monday \(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!)!"
        }
        else if forcolorstring == "Friday" {
            welcomelabel.text = "Happy Friday \(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!)!"
        }
        else if forcolorstring == "Thursday" {
            welcomelabel.text = "Happy Nugget Thursday!"
        }
        
        if (forcolorstring == "Saturday") || (forcolorstring == "Sunday") {
            
            letterday.hidden = true
            currentperiod.hidden = true
            dayprogress.hidden = true
            weekendlabel.hidden = false
            NSUserDefaults.standardUserDefaults() .setBool( true, forKey: "isweekend")
        }
        else{
            NSUserDefaults .standardUserDefaults() .setBool(false, forKey: "isweekend")
        }
        
        //Holiday greetings
        if datelabel.text == "Friday 12/25/2016" {
            welcomelabel.text = "Happy Holidays \(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!)!"
        }
        
        if datelabel.text == "Tuesday 12/31/2016" {
            welcomelabel.text = "Happy New Year's Eve \(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!)!"
        }
        
        if datelabel.text == "Wednesday 01/01/2017" {
            welcomelabel.text = "Happy New Year \(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!)!"
            
        }
        
        
        lettersetting()
        
    }
    
    func clockupdater() {
        clocktimer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(menuController.setupclock), userInfo: nil, repeats: true)
    }
    
    func setupclock() {
        let date = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        time.text = dateFormatter.stringFromDate(date)
        setupperiodlabel()
        setupthedate()
    }
    
    func findcorrecttime() -> Int {
        let currenttime = time.text
        
        if period1 .contains(currenttime!) {
            return 1
        }
        else if period2 .contains(currenttime!) {
            return 2
        }
        else if period3 .contains(currenttime!) {
            return 3
        }
        else if period4 .contains(currenttime!) {
            return 4
        }
        else if period5 .contains(currenttime!) {
            return 5
        }
        else if period6 .contains(currenttime!) {
            return 6
        }
        else if period7 .contains(currenttime!) {
            return 7
        }
        else if period8 .contains(currenttime!) {
            return 8
        }
        else if period9 .contains(currenttime!) {
            return 9
        }
        else if bell .contains(currenttime!) {
            return 11
        }
        else if extrahelp .contains(currenttime!) {
            if (dayofweek == "Monday") || (dayofweek == "Wednesday") || (dayofweek == "Thursday") {
                
                return 10
            }
            
        }
        
        return 0
        
    }
    
//    var 😒 = ["Hello," ,"world"]
//    var number = 3
//    let number2 = 3
//
//    
//    @IBAction func backbutton(sender:AnyObject) {
//        
//        thelabel.text = "hello world!"
//        thelabel.textColor = UIColor .blueColor()
//        
//        thetimer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(themethod), userInfo: nil, repeats: false)
//        
//        
//    }
//    
//    func themethod() {
//        thelabel.text = "timer ran"
//    }
    
    func setupperiodlabel() {
        
        let setnumber = findcorrecttime()
        dayprogress.progressTintColor = UIColor .whiteColor()
        
        if setnumber == 1 {
            currentperiod.text = "Current period: 1/9"
            dayprogress.progress = 0.1
        }
        else if setnumber == 2 {
            currentperiod.text = "Current period: 2/9"
            dayprogress.progress = 0.2
        }
        else if setnumber == 3 {
            currentperiod.text = "Current period: 3/9"
            dayprogress.progress = 0.3
        }
        else if setnumber == 4 {
            currentperiod.text = "Current period: 4/9"
            dayprogress.progress = 0.4
        }
        else if setnumber == 5 {
            currentperiod.text = "Current period: 5/9"
            dayprogress.progress = 0.5
        }
        else if setnumber == 6 {
            currentperiod.text = "Current period: 6/9"
            dayprogress.progress = 0.6
        }
        else if setnumber == 7 {
            currentperiod.text = "Current period: 7/9"
            dayprogress.progress = 0.7
        }
        else if setnumber == 8 {
            currentperiod.text = "Current period: 8/9"
            dayprogress.progress = 0.8
        }
        else if setnumber == 9 {
            currentperiod.text = "Last period of the day!"
            dayprogress.progress = 0.9
        }
        else if setnumber == 10 {
            currentperiod.text = "Extra help"
            dayprogress.progress = 1
        }
        else if setnumber == 11 {
            currentperiod.text = "Bell period"
            dayprogress.progress = belltime()
            dayprogress.progressTintColor = UIColor .redColor()
            
        }
        else
        {
            currentperiod.text = "School starts 8:00 AM"
            dayprogress.progress = 0
        }
        
    }
    
    func belltime() -> Float {
        let thetime = time.text
        let belltimes = bell.indexOf(thetime!)
        print("Bell is in index \(belltimes!)")
        
        if belltimes <= 4 {
            if time.text == "08:00 AM" {
                return 0.3
            
            }
            else if time.text == "08:01 AM" {
                return 0.6
            }
            else if time.text == "08:02 AM" {
                return 0.8
            }
            else if time.text == "08:03 AM" {
                return 0.9
            }
            else if time.text == "08:04 AM" {
                
                return 1
            }
        
        }
        else if (belltimes >= 5) && (belltimes <= 7) {
            if time.text == "08:49 AM" {
                return 0.3
            }
            else if time.text == "08:50 AM" {
                return 0.6
            }
            else if time.text == "08:51 AM" {
                return 0.9
            }
        
        }
        else if (belltimes >= 8) && (belltimes <= 10) {
            if time.text == "09:33 AM" {
                return 0.3
            }
            else if time.text == "09:34 AM" {
                return 0.6
            }
            else if time.text == "09:35 AM" {
                return 0.9
            }
        
        }
        else if (belltimes >= 11) && (belltimes <= 13) {
            if time.text == "10:17 AM" {
                return 0.3
            }
            else if time.text == "10:18 AM" {
                return 0.6
            }
            else if time.text == "10:19 AM" {
                return 0.9
            }

        
        }
        else if (belltimes >= 14) && (belltimes <= 16) {
            if time.text == "11:01 AM" {
                return 0.3
            }
            else if time.text == "11:02 AM" {
                return 0.6
            }
            else if time.text == "11:03 AM" {
                return 0.9
            }
        
        }
        else if (belltimes >= 17) && (belltimes <= 19) {
            if time.text == "11:45 AM" {
                return 0.3
            }
            else if time.text == "11:46 AM" {
                return 0.6
            }
            else if time.text == "11:47 AM" {
                return 0.9
            }
        
        }
        else if (belltimes >= 20) && (belltimes <= 22) {
            if time.text == "12:29 PM" {
                return 0.3
            }
            else if time.text == "12:30 PM" {
                return 0.6
            }
            else if time.text == "12:31 PM" {
                return 0.9
            }
        
        }
        else if (belltimes >= 23) && (belltimes <= 25) {
            if time.text == "01:13 PM" {
                return 0.3
            }
            else if time.text == "01:14 PM" {
                return 0.6
            }
            else if time.text == "01:15 PM" {
                return 0.9
            }
        
        }
        else if (belltimes >= 26) && (belltimes <= 28) {
            if time.text == "01:57 PM" {
                return 0.3
            }
            else if time.text == "01:58 PM" {
                return 0.6
            }
            else if time.text == "01:59 PM" {
                return 0.9
            }
        
        }
        
        return 1
    }

    
    func lettersetting() {
        
        let day = Int(dayofmonth)
        if day!%2 == 0 {
            letterday.text = "B Day"
        }
        else
        {
            letterday.text = "A Day"
        }
        
    }
    
    func setbell() {
        
        let status = NSUserDefaults .standardUserDefaults() .integerForKey("bellapp")
        
        /*
        if NSUserDefaults .standardUserDefaults() .stringForKey("sixflags") == "going" {
            print("Going to Six Flags")
            bellappbutton.setTitle("Six Flags", forState: UIControlState.Normal)
            bellappimage.image = UIImage(named: "sixflagscoaster.png")
            bellappbutton.hidden = false
            bellappimage.hidden = false
            bellappview.hidden = false
            
        }
        */
            
            
        if status == 11 {
            
            bellappbutton.hidden = false
            bellappimage.hidden = false
            bellappview.hidden = false
            
        }
        
    }
    
    
    func splashScreen () {
        let magicNumber = NSUserDefaults .standardUserDefaults() .integerForKey("splash")
        
        if magicNumber != 30 {
            NSUserDefaults .standardUserDefaults() .setInteger(30, forKey: "splash")
            
            let splashAlert = SCLAlertView()
            splashAlert.showCloseButton = false
            splashAlert.addButton("Continue") {
                let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("splashScreen") as UIViewController
                
                self.presentViewController(viewController, animated: false, completion: nil)
                
            }
            splashAlert.showInfo("RHS Mobile 3", subTitle: "Welcome the new RHS Mobile! Tap \"Continue\" to see what's new!")
        }
        
    }
    
    
    
    /*
    @IBAction func yesbuttonhit(sender:AnyObject) {
        NSUserDefaults .standardUserDefaults() .setObject("going", forKey: "sixflags");
        whatsnewview.hidden = true
        yesbutton.hidden = true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if whatsnewview.hidden == false {
            whatsnewview.hidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 */
    
    
    
    
    func businessCard() {
        let name = "Mitchell Sweet"
        let profession = "App Developer"
        let contactInfo = ["mitchell@mitchellsweet.com",
                           "(516) 660-3255",
                           "mitchellsweet.com"]
        print(name, profession, contactInfo)
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    /*
    let verticalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.y",
        type: .TiltAlongVerticalAxis)
    verticalMotionEffect.minimumRelativeValue = -15
    verticalMotionEffect.maximumRelativeValue = 15
    
    // Set horizontal effect
    let horizontalMotionEffect = UIInterpolatingMotionEffect(keyPath: "center.x",
        type: .TiltAlongHorizontalAxis)
    horizontalMotionEffect.minimumRelativeValue = -15
    horizontalMotionEffect.maximumRelativeValue = 15
    
    // Create group to combine both
    let group = UIMotionEffectGroup()
    group.motionEffects = [horizontalMotionEffect, verticalMotionEffect]
    
    // Add both effects to your view
    menubackground.addMotionEffect(group)
    menubackgroundcover.addMotionEffect(group)
    mecircle.addMotionEffect(group)
*/

}
