//
//  ViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/12/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstname:UITextField!
    @IBOutlet weak var lastname:UITextField!
    @IBOutlet weak var freshbutotn:UIButton!
    @IBOutlet weak var sophbutton:UIButton!
    @IBOutlet weak var juniorbutton:UIButton!
    @IBOutlet weak var seniorbutton:UIButton!
    @IBOutlet weak var otherbutton:UIButton!
    @IBOutlet weak var alumbutton:UIButton!
    @IBOutlet weak var continuebutton:UIButton!
    @IBOutlet weak var toplabel:UILabel!
    @IBOutlet weak var bytappingcontinue:UILabel!
    @IBOutlet weak var privacypolicybutton:UIButton!
    @IBOutlet weak var bytappingcontinue2:UILabel!
    @IBOutlet weak var privacypolicybutton2:UIButton!
    var anint = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        continuebutton.alpha = 0
        
        toplabel.alpha = 0
        freshbutotn.alpha = 0
        sophbutton.alpha = 0
        juniorbutton.alpha = 0
        seniorbutton.alpha = 0
        otherbutton.alpha = 0
        alumbutton.alpha = 0
        firstname.alpha = 0
        lastname.alpha = 0
        bytappingcontinue.alpha = 0
        privacypolicybutton.alpha = 0
        bytappingcontinue2.alpha = 0
        privacypolicybutton2.alpha = 0
        
    }
    
    override func viewDidAppear(animated: Bool) {
        NSTimer .scheduledTimerWithTimeInterval(1.5, target: self, selector: #selector(ViewController.setupview), userInfo: nil, repeats: false)
    }
    
    func setupview() {
        
        UIView.animateWithDuration(3, animations:{
            self.toplabel.alpha = 1
            self.freshbutotn.alpha = 1
            self.sophbutton.alpha = 1
            self.juniorbutton.alpha = 1
            self.seniorbutton.alpha = 1
            self.otherbutton.alpha = 1
            self.alumbutton.alpha = 1
            self.firstname.alpha = 1
            self.lastname.alpha = 1
            self.privacypolicybutton.alpha = 1
            self.bytappingcontinue.alpha = 1
            self.bytappingcontinue2.alpha = 1
            self.privacypolicybutton2.alpha = 1
        },
            completion: {
                (value: Bool) in
        })
        
    }
    
    @IBAction func donetypingfirst (sender:AnyObject) {
        firstname.resignFirstResponder()
        
        firstname.backgroundColor = UIColor .whiteColor()
        print(firstname.text)
        
        if lastname.text != "" {
            firstname.enabled = false
            lastname.enabled = false
        }
        
    }
    
    @IBAction func donetypinglast (sender:AnyObject) {
        lastname.resignFirstResponder()
        
        lastname.backgroundColor = UIColor .whiteColor()
        
        if firstname.text != "" {
            firstname.enabled = false
            lastname.enabled = false
        }
        
    }
    
    @IBAction func classselected(sender:UIButton) {
        
        
        if (firstname.text != "") && (lastname.text != "") {
            
            switch sender.tag {
            case 0:
                print("fresh")
            NSUserDefaults .standardUserDefaults() .setObject("fresh", forKey: "class")
                unhidecontinue()
                sophbutton.alpha = 0.5
                juniorbutton.alpha = 0.5
                seniorbutton.alpha = 0.5
                otherbutton.alpha = 0.5
                alumbutton.alpha = 0.5
                
                
            case 1:
                print("soph")
                NSUserDefaults .standardUserDefaults().setObject("soph", forKey: "class")
                unhidecontinue()
                freshbutotn.alpha = 0.5
                juniorbutton.alpha = 0.5
                seniorbutton.alpha = 0.5
                otherbutton.alpha = 0.5
                alumbutton.alpha = 0.5
            
            case 2:
                print("junior")
                NSUserDefaults .standardUserDefaults() .setObject("junior", forKey: "class")
                unhidecontinue()
                sophbutton.alpha = 0.5
                freshbutotn.alpha = 0.5
                seniorbutton.alpha = 0.5
                otherbutton.alpha = 0.5
                alumbutton.alpha = 0.5
                
            case 3:
                print("senior")
                NSUserDefaults .standardUserDefaults() .setObject("senior", forKey: "class")
                unhidecontinue()
                sophbutton.alpha = 0.5
                juniorbutton.alpha = 0.5
                freshbutotn.alpha = 0.5
                otherbutton.alpha = 0.5
                alumbutton.alpha = 0.5
                
            case 4:
                print("other")
                NSUserDefaults .standardUserDefaults() .setObject("other", forKey: "class")
                unhidecontinue()
                sophbutton.alpha = 0.5
                juniorbutton.alpha = 0.5
                seniorbutton.alpha = 0.5
                freshbutotn.alpha = 0.5
                alumbutton.alpha = 0.5
                
            case 5:
                print("alum")
                NSUserDefaults .standardUserDefaults() .setObject("alum", forKey: "class")
                unhidecontinue()
                sophbutton.alpha = 0.5
                juniorbutton.alpha = 0.5
                seniorbutton.alpha = 0.5
                freshbutotn.alpha = 0.5
                otherbutton.alpha = 0.5
                
            default:
                print("Error")
            }
            
            NSUserDefaults .standardUserDefaults() .setObject(firstname.text, forKey: "firstname")
            NSUserDefaults .standardUserDefaults() .setObject(lastname.text, forKey: "lastname")
            
            let firststring = NSUserDefaults .standardUserDefaults().objectForKey("firstname")!
            let secondstring = NSUserDefaults .standardUserDefaults() .objectForKey("lastname")!
            print("\(firststring) \(secondstring)")
            
        }
        else
        {
            if firstname.text == "" {
                firstname.backgroundColor = UIColor .redColor()
            }
            if lastname.text == "" {
                lastname.backgroundColor = UIColor .redColor()
            }
        }
        
    }
    
    func unhidecontinue() {
        
        freshbutotn.enabled = false
        sophbutton.enabled = false
        juniorbutton.enabled = false
        seniorbutton.enabled = false
        otherbutton.enabled = false
        alumbutton.enabled = false
        
        self.continuebutton.clipsToBounds = true
        UIView.animateWithDuration(2, animations:{
            self.continuebutton.alpha = 1
            },
            completion: {
            (value: Bool) in
        })

    }
    
    @IBAction func linktoprivacy (sender:AnyObject) {
        UIApplication .sharedApplication() .openURL(NSURL(string: "https://static1.squarespace.com/static/54ed3a0ae4b021b682d4d905/t/57b7eac215d5dbf599f693dc/1471670978981/V.3.1+RHS+privacy+policy.pdf")!)
    }
    
    @IBAction func enterapp(sender:AnyObject) {
        
        NSUserDefaults .standardUserDefaults() .setInteger(12, forKey: "setup")
        print("User is set up successfully")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

