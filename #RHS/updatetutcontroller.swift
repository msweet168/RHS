//
//  updatetutcontroller.swift
//  #RHS
//
//  Created by Mitchell Sweet on 12/15/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class updatetutcontroller: UIViewController {
    
    @IBOutlet weak var toplabel2:UILabel!
    @IBOutlet weak var infolabel2:UILabel!
    @IBOutlet weak var button2:UIButton!
    @IBOutlet weak var progressbar2:UIProgressView!
    @IBOutlet weak var privacybutton2:UIButton!
    var progressint2 = 1
    
    @IBAction func tappedcontinue (sender:AnyObject) {
        nextaction2()
        print(progressint2)
    }
    
    func nextaction2() {
        
        switch progressint2 {
        case 1:
            progressint2 = 2
            toplabel2.text = "Privacy Policy"
            infolabel2.text = "We have updated the privacy policy to accommodate new features. You must agree to updated privacy policy to continue using the app. Tap \"agree\" to agree or you can read the Privacy Policy."
            progressbar2.setProgress(0.3, animated: true)
            privacybutton2.hidden = false
            button2 .setTitle("Agree", forState: UIControlState.Normal)
            
        case 2:
            progressint2 = 3
            privacybutton2.hidden = true
            button2 .setTitle("Continue", forState: UIControlState.Normal)
            toplabel2.text = "Homework"
            infolabel2.text = "Homework is a powerful digital homework planner which makes it quick and easy to write down homework assignments resulting in less forgotten homeworks. You can even set alerts to be reminded about homework assignments."
        case 3:
            progressint2 = 4
            toplabel2.text = "Bug Fixes"
            infolabel2.text = "Reported bugs fixed: Alerts going off on weekends, cut off text. To view all bugs fixed, view release notes on the RHS app's App Store page."
        case 4:
            progressint2 = 5
            toplabel2.text = "Discontinued"
            infolabel2.text = "We are sorry to say that the previous Student Life feature has been discontinued. Due to a lack of feature support, iOS 7 support has been removed. RHS now requires iOS 8.0 and above."
        case 5:
            progressint2 = 6
            progressbar2.setProgress(0.7, animated: true)
            toplabel2.text = "How to use"
            infolabel2.text = "To use the new homework planner, tap \"homework\" on the main menu and tap \"new\" to add a new assignment. Tap an assignment to view more info about it."
            
        case 6:
            progressint2 = 7
            progressbar2.setProgress(1, animated: true)
            toplabel2.text = "Enjoy!"
            infolabel2.text = "We hope you enjoy using RHS version 1.1!"
            button2.setTitle("Go", forState: UIControlState.Normal)
        case 7:
            self.performSegueWithIdentifier("doneagain", sender: self)
        default:
            print("Error")
            toplabel2.text = "Error"
            infolabel2.text = "Please quit and reload this app. We are sorry for the inconvience. Go to Sweetdevelop.com/bugreport to report a problem."
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        toplabel2.text = "Welcome back \(NSUserDefaults .standardUserDefaults().stringForKey("firstname")!)!"
        
    }
    
    @IBAction func privacylink2(sender:AnyObject) {
        UIApplication .sharedApplication() .openURL(NSURL(string: "https://static1.squarespace.com/static/54ed3a0ae4b021b682d4d905/t/5671a4d4e0327cc306e34055/1450288340799/UPDATED+RHS+privacypolicy.pdf")!)
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
