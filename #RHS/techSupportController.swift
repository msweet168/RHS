//
//  techSupportController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/30/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit
import Foundation
import MessageUI

class techSupportController: UIViewController,MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var firstview:UIView!
    @IBOutlet weak var secondview:UIView!
    @IBOutlet weak var thirdview:UIView!
    @IBOutlet weak var fourthview:UIView!
    @IBOutlet weak var fifthview:UIView!
    @IBOutlet weak var sixthview:UIView!
    @IBOutlet weak var seventhview:UIView!
    
    @IBAction func contactsupport(sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.presentViewController(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self // Extremely important to set the --mailComposeDelegate-- property, NOT the --delegate-- property
        
        mailComposerVC.setToRecipients(["support@roslynschools.org"])
        mailComposerVC.setSubject("Tech Problem")
        mailComposerVC.setMessageBody("                -Sent from the RHS app", isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        
        let theAlert = SCLAlertView()
        theAlert.showError("Failed to send", subTitle: "There was a problem sending your e-mail. Please try again.", closeButtonTitle: "Ok")
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func topbutton() {
        
        let theAlert = SCLAlertView()
        theAlert.showInfo("Solution", subTitle: "Hold the home button and sleep/wake button both at the same time until your iPad screen turns off and the Apple logo appears. Wait for your iPad to reboot.", closeButtonTitle: "Ok")
        
    }
    @IBAction func secondbutton() {
        
        let theAlert = SCLAlertView()
        theAlert.showInfo("Solution", subTitle: "There are a number of solutions for this problem. First, try toing to settings> messages, and turn iMessage off and then on. Make sure that iMessage activates. If it says \"Activation unsuccessful\" under the iMessage switch, contact support. If this does not work, reset your iPad by holding the home and sleep button until the iPad shuts off and you see the Apple logo.", closeButtonTitle: "Ok")
    }
    @IBAction func thirdbutton() {
        
        let theAlert = SCLAlertView()
        theAlert.showInfo("Solution", subTitle: "First try toggleing wifi off and then back on. Then try doing a device reset by holding the home and sleep/wake buttons until your iPad shuts off and you can see the Apple logo. If that does not work, contact support.", closeButtonTitle: "Ok")
    }
    @IBAction func fourthbutton() {
        
        let theAlert = SCLAlertView()
        theAlert.showInfo("Solution", subTitle: "Go to settings> general> usage and delete songs, apps, pictures, and videos which are taking up a lot of memory. Your iPad will only run full speed if there is at least 500MB avilable.", closeButtonTitle: "Ok")
        
    }
    @IBAction func fifthbutton() {
        
        let theAlert = SCLAlertView()
        theAlert.showInfo("Solution", subTitle: "There are two options to free up iCloud storage. The first option is to upgrade our plan to have more storage in the cloud. The least expensive is 50 GB for $0.99 per month. Do this in iCloud settings. The other option is to turn off your iCloud backup, however this means your iPad will not be able to back up to the cloud and you will have to use iTunes to do it.", closeButtonTitle: "Ok")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstview.backgroundColor = UIColor .whiteColor() .colorWithAlphaComponent(0.5)
        secondview.backgroundColor = UIColor .whiteColor() .colorWithAlphaComponent(0.5)
        thirdview.backgroundColor = UIColor .whiteColor() .colorWithAlphaComponent(0.5)
        fourthview.backgroundColor = UIColor .whiteColor() .colorWithAlphaComponent(0.5)
        fifthview.backgroundColor = UIColor .whiteColor() .colorWithAlphaComponent(0.5)
        sixthview.backgroundColor = UIColor .whiteColor() .colorWithAlphaComponent(0.5)
        seventhview.backgroundColor = UIColor .whiteColor() .colorWithAlphaComponent(0.5)

        // Do any additional setup after loading the view.
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
