//
//  TutorialViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/20/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet weak var infolabel:UILabel!
    @IBOutlet weak var button:UIButton!
    @IBOutlet weak var progressbar:UIProgressView!
    @IBOutlet weak var toplabel:UILabel!
    @IBOutlet weak var privacybutton:UIButton!
    var progressint = 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttontapped(sender:AnyObject) {
        nextaction()
        print(progressint)
    }
    
    func nextaction() {
        
        switch progressint {
        case 1:
            progressint = 2
            toplabel.text = "Privacy Policy"
            infolabel.text = "You must agree to the Privacy Policy before using this app. Tap \"Agree\" to agree or tap below to read the Privacy policy."
            progressbar.setProgress(0.3, animated: true)
            privacybutton.hidden = false
            button .setTitle("Agree", forState: UIControlState.Normal)
            
        case 2:
            progressint = 3
            toplabel.text = "Notifications"
            infolabel.text = "Some features require you to allow notifications. You will never be spammed. Please allow the app to send notifications by tapping \"allow\" and then tapping \"Ok.\""
            privacybutton.hidden = true
            button .setTitle("Allow", forState: UIControlState.Normal)
        case 3:
            progressint = 4
            allownotifications()
            button .setTitle("Continue", forState: UIControlState.Normal)
        case 4:
            progressint = 5
            progressbar.setProgress(0.7, animated: true)
            toplabel.text = "3D Touch"
            infolabel.text = "On your home screen, tap firmly on the app icon to quickly add a homework or see the bell schedule. On the RHS menu, tap firmly on homework, bell schedule, or reminders to see a preview without entering the page. (iPhone 6S/7 only)"
        case 5:
            progressint = 6
            toplabel.text = "Homework"
            infolabel.text = "Homework is a powerful digital homework planner which makes it quick and easy to write down homework assignments resulting in less forgotten homeworks."
        case 6:
            progressint = 7
            toplabel.text = "Reminders"
            infolabel.text = "Go to the Reminders page to set alerts that will go off 5 mins before the end of a period and wake you up before school."
        case 7:
            progressint = 8
            toplabel.text = "Questions/Bugs"
            infolabel.text = "If you have any questions or find any bugs in the app, let us know on the settings page or at Sweetdevelop.com. (Guaranteed question response within 10 mins Mon-Fri.)"
            
        case 8:
            progressint = 9
            progressbar.setProgress(1, animated: true)
            toplabel.text = "Enjoy!"
            infolabel.text = "You're all ready! Enjoy the RHS app and if you have any feature requests, feel free to let us know at Sweetdevelop.com/contact. Enjoy the 2016-2017 year!"
            button.setTitle("Go", forState: UIControlState.Normal)
        case 9:
            self.performSegueWithIdentifier("done", sender: self)
        default:
            print("Error")
            toplabel.text = "Error"
            infolabel.text = "Please quit and reload this app. We are sorry for the inconvience. Go to Sweetdevelop.com/system-status to report a problem."
        }
        
    }
    
    @IBAction func privacybuttontapped(sender:AnyObject) {
        linktoprivacypolicy()
    }
    
    func linktoprivacypolicy() {
         UIApplication .sharedApplication() .openURL(NSURL(string: "https://static1.squarespace.com/static/54ed3a0ae4b021b682d4d905/t/57f2661c1b631b0bd9144fa4/1475503644744/V4.0+RHS+Privacy+Policy.pdf")!)
    }
    
    func allownotifications() {
             UIApplication .sharedApplication() .registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [UIUserNotificationType.Sound, UIUserNotificationType.Alert, UIUserNotificationType.Badge], categories: nil))
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
