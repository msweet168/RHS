//
//  prochangeViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 12/10/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class prochangeViewController: UIViewController {
    
    @IBOutlet weak var profilechangedconfirm:UILabel!
    @IBOutlet weak var firstnamefield:UITextField!
    @IBOutlet weak var lastnamefield:UITextField!
    @IBOutlet weak var savebutton:UIButton!
    @IBOutlet weak var backbutton:UIButton!
    let cursearray = ["Fuck","Bitch","Mother Fucker","Boobs","Tits","Curseword","Dick","Bill Jones","Bill","Jones","Weed","Pot","Pussy","Nigga","Nigger","Ass Hole", "Ass","Cunt", "Penis", "Vagina"]
    
    var totalchanges = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        totalchanges = NSUserDefaults .standardUserDefaults().integerForKey("profilechange")
        
        if totalchanges >= 2 {
            let theAlert = SCLAlertView()
            theAlert.addButton("Ok") {
                self.performSegueWithIdentifier("back", sender: self)
            }
            theAlert.showCloseButton = false
            theAlert.showError("Cannot Change", subTitle: "Your profile cannot be changed more then 2 times. Please go to the troubleshooting page and contact Sweet Development for more info.")
        }
        else {
            
            if totalchanges != 0 {
                let theAlert = SCLAlertView()
                theAlert.showWarning("Profile Changes", subTitle: "You may only change your profile 2 times. You have already changed it \(totalchanges) time.", closeButtonTitle: "Ok")
            }
            
        }
        
    }
    
    
    @IBAction func savetapped(sender:AnyObject) {
        
        if (cursearray.contains(firstnamefield.text!)) || (cursearray.contains(lastnamefield.text!)) {
            if cursearray.contains(firstnamefield.text!) {
                firstnamefield.backgroundColor = UIColor.redColor()
            }
            if cursearray.contains(lastnamefield.text!) {
                lastnamefield.backgroundColor = UIColor.redColor()
            }
            
            profilechangedconfirm.hidden = false
            profilechangedconfirm.text = "This name is not appropriate."
            
            if (firstnamefield.text == "Bill") && (lastnamefield.text == "Jones") {
                profilechangedconfirm.text = "You are not Bill Jones"
            }
        }
        else
        {
            
            if (firstnamefield.text == NSUserDefaults .standardUserDefaults() .stringForKey("firstname")!) && (lastnamefield.text == NSUserDefaults .standardUserDefaults() .stringForKey("lastname")!) {
                
                profilechangedconfirm.text = "This is your current profile."
                profilechangedconfirm.hidden = false
                firstnamefield.backgroundColor = UIColor .redColor()
                lastnamefield.backgroundColor = UIColor.redColor()
                
            }
            else
            {
                save()
            }
            
        }
        
        
    }
    
    func save() {
        firstnamefield.enabled = false
        lastnamefield.enabled = false
        savebutton.enabled = false
        //profilechangedconfirm.hidden = false
        //profilechangedconfirm.text = "Your profile has been changed."
        totalchanges += 1
        NSUserDefaults .standardUserDefaults() .setInteger(totalchanges, forKey: "profilechange")
        firstnamefield.resignFirstResponder()
        lastnamefield.resignFirstResponder()
        
    NSUserDefaults .standardUserDefaults() .setObject(firstnamefield.text, forKey: "firstname")
       NSUserDefaults .standardUserDefaults() .setObject(lastnamefield.text, forKey: "lastname")
        
        let confirmAlert = SCLAlertView()
        confirmAlert.showCloseButton = false
        confirmAlert.addButton("Ok") {
            self.performSegueWithIdentifier("back", sender: self)
        }
        confirmAlert.showSuccess("Success", subTitle: "Your profile has been changed")
        
    }
    
    @IBAction func firstnameenter(sender:UITextField) {
        sender.resignFirstResponder()
        if (sender.text != "") && (lastnamefield.text != "") {
            savebutton.enabled = true
        }
    }
    
    @IBAction func lastnameenter(sender:UITextField) {
        sender.resignFirstResponder()
        if (sender.text != "") && (firstnamefield.text != "") {
            savebutton.enabled = true
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
