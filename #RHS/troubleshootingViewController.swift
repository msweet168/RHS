//
//  troubleshootingViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 12/1/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class troubleshootingViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    var testnotification = UILocalNotification()

    
    @IBAction func buttontapped(sender:AnyObject) {
        
        switch sender.tag {
            
        case 0:
            
            let theAlert = SCLAlertView()
            theAlert.addButton("Test", action: testnotificationmethod)
            theAlert.showInfo("Notifications", subTitle: "If notifications are not sending, that probably means that you did not allow the app to send them. Go to settings > RHS > Notifications > and turn on all of the switches. Tap \"test\" to send a test notification. After you tap test, lock your phone and in 10 seconds you will recieve a test notification.", closeButtonTitle: "Ok")
            
            
            /*
                let alertView = UIAlertController(title: "Notifications", message: "If notifications are not sending, that probably means that you did not allow the app to send them. Go to settings > RHS > Notifications > and turn on all of the switches. Tap \"test\" to send a test notification. After you tap test, lock your phone and in 10 seconds you will recieve a test notification.", preferredStyle: .Alert)
                alertView.addAction(UIAlertAction(title: "Test", style: .Default, handler: { (alertAction) -> Void in
                    self.testnotificationmethod()
                }))
                alertView.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
                presentViewController(alertView, animated: true, completion: nil)
            */

            case 1:
                
                let theAlert = SCLAlertView()
                theAlert.showInfo("Notifications", subTitle: "If the switch for a particular notification is toggled off but you are still recieveing the notification, simply try turning the notification on and then back off. Sometimes, if toggled too fast, the notification does not cancel. Please notify Sweet development about this problem.", closeButtonTitle: "Ok")
        case 2:
 
            let theAlert = SCLAlertView()
            theAlert.showInfo("Square Dash", subTitle: "If your score is not being saved, please try closing the app and removing it from your app switcher. Then, relaunch the app and the score should save.", closeButtonTitle: "Ok")
            
        case 3:
            
            let theAlert = SCLAlertView()
            theAlert.showInfo("Your Profile", subTitle: "To change your login name, tap \"change profile\" under your grade level on the settings page. You can then change your name.", closeButtonTitle: "Ok")
            
        case 4:
            
            let theAlert = SCLAlertView()
            theAlert.showInfo("Top Deck", subTitle: "If the time or period progress is not correct, exit the RHS app and remove it from your app switcher. Then relaunch the app and the time should be correct.", closeButtonTitle: "Ok")
            
        case 5:
            
            let theAlert = SCLAlertView()
            theAlert.showInfo("Top Deck", subTitle: "If Top Deck shows it's an A day or B day when it is not, close the RHS app and remove it from your app switcher. Then relaunch the app. If the day is still incorrect, please report the problem to Sweet development ASAP.", closeButtonTitle: "Ok")
            
        case 6:
            
            let theAlert = SCLAlertView()
            theAlert.showInfo("Slow Performance", subTitle: "If RHS is running slow, exit the app and open your app switcher by double-tapping the home button. Remove all apps that are open and relaunch RHS. The app should now be running normally.", closeButtonTitle: "Ok")
            
        default:
            print("Idk wtf could have happened")
        }
        
    }
    
    @IBAction func nothingworked(sender:AnyObject) {
        
            let alertView = UIAlertController(title: "Contact Us", message: "We are sorry you are having problems with the RHS app. We are always here to help with issues. How would you like to contact us?", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Our support website", style: .Default, handler: { (alertAction) -> Void in
                UIApplication .sharedApplication() .openURL(NSURL(string: "http://www.sweetdevelop.com/contact")!)
            }))
            alertView.addAction(UIAlertAction(title: "By E-mail (response within 10 mins)", style: .Default, handler: { (alertAction) -> Void in
                let mailComposeViewController = self.configuredMailComposeViewController()
                if MFMailComposeViewController.canSendMail() {
                    self.presentViewController(mailComposeViewController, animated: true, completion: nil)
                } else {
                    self.showSendMailErrorAlert()
                }
            }))
            alertView.addAction(UIAlertAction(title: "By phone (will call now)", style: .Default, handler: { (alertAction) -> Void in
                UIApplication.sharedApplication().openURL(NSURL(string: "tel://5163991791")!)
            }))
            alertView.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)

    }
    
    func testnotificationmethod () {
        testnotification.alertBody = "Hey it worked!"
        testnotification.alertAction = "Go back to RHS app"
        testnotification.timeZone = NSTimeZone .defaultTimeZone()
        testnotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        testnotification.soundName = "wake wave.wav"
        UIApplication .sharedApplication() .scheduleLocalNotification(testnotification)
    }
    
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["contact@sweetdevelop.com"])
        mailComposerVC.setSubject("RHS app bug")
        mailComposerVC.setMessageBody("< Your message here >", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
        let theAlert = SCLAlertView()
        theAlert.showError("Failed to send", subTitle: "There was a problem sending your e-mail. Please try again.", closeButtonTitle: "Ok")
        /*
        let sendMailErrorAlert = UIAlertView(title: "Could Not Send Email", message: "There was a problem sending your e-mail. Please try again.", delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
        */
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let theAlert = SCLAlertView()
        //theAlert.showInfo("<#Title Here#>", subTitle: "<#Message Here#>", closeButtonTitle: "<#Closebutton Here#>")
        
        //theAlert.addButton("Im a button", action: testAction)

        // Do any additional setup after loading the view.
    }
    
    //func testAction() {
    
    //}

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
