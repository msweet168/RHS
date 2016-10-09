//
//  sixflagsViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 2/3/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import UIKit

class sixflagsViewController: UIViewController {
    
    @IBOutlet weak var enterdata:UIButton!
    @IBOutlet weak var viewdata:UIButton!
    @IBOutlet weak var kingdaka:UIButton!
    @IBOutlet weak var nitro:UIButton!
    @IBOutlet weak var eltoro:UIButton!
    @IBOutlet weak var superman:UIButton!
    @IBOutlet weak var bizzaro:UIButton!
    @IBOutlet weak var batman:UIButton!
    @IBOutlet weak var downloadiride:UIButton!
    @IBOutlet weak var tripcountdoan:UILabel!
    @IBOutlet weak var timelabel:UILabel!
    var hightint = Double()
    var swingint = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settripclock()
        NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: #selector(sixflagsViewController.settripclock), userInfo: nil, repeats: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func settripclock() {
        let date = NSDate()
        let dateFormatter2:NSDateFormatter = NSDateFormatter()
        dateFormatter2.dateFormat = "hh:mm a"
        timelabel.text = dateFormatter2.stringFromDate(date)
        
    }
    
    @IBAction func setdata(sender:AnyObject) {
        
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Enter Data",
            message: "Enter your observations below.",
            preferredStyle: .Alert)
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField: UITextField!) in
                textField.placeholder = "Hight of Dare Devil Dive (m)"
                textField.keyboardType = UIKeyboardType.DecimalPad
        })
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "Time for 3 swings (secs)"
                textField2.keyboardType = UIKeyboardType.DecimalPad
        })
        
        
        
        let action = UIAlertAction(title: "Save",
            style: UIAlertActionStyle.Default,
            handler: {[weak self]
                (paramAction:UIAlertAction!) in
                if let textFields = alertController?.textFields{
                    let theTextFields = textFields as [UITextField]
                    let heightText = theTextFields[0].text
                    let swingtext = theTextFields[1].text
                    
                    if theTextFields[0].text != "" {
                       self!.hightint = Double(heightText!)!
                    }
                    if theTextFields[1].text != "" {
                       self!.swingint = Double(swingtext!)!
                    }
                    self!.savevalues()
                }
            })
        
        alertController?.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alertController?.addAction(action)
        self.presentViewController(alertController!,
            animated: true,
            completion: nil)
        
    }
    
    func savevalues() {
    
        NSUserDefaults .standardUserDefaults().setDouble(hightint, forKey: "height")
        NSUserDefaults .standardUserDefaults().setDouble(swingint, forKey: "swings")
        
        let thealert = UIAlertView(title: "Completed", message: "Your data has been saved. Tap \"View Lab Data\" to see your saved data.", delegate: self, cancelButtonTitle: "Ok")
        thealert.show()
        
        print("Values have been saved")
    }
    
    
    @IBAction func getvalues(sender:AnyObject) {
        
        
        hightint = NSUserDefaults .standardUserDefaults() .doubleForKey("height")
        swingint = NSUserDefaults .standardUserDefaults() .doubleForKey("swings")
        
        let thealert = UIAlertView(title: "Your Data", message: "Height: \(hightint) meters\nTime for 3 swings: \(swingint) seconds", delegate: self, cancelButtonTitle: "Close")
        thealert.show()
        
        
    }
    
    @IBAction func tappedwaittime(sender:AnyObject){
        
        switch(sender.tag) {
            
        case 0:
            print("Choose Kingda ka")
        NSUserDefaults .standardUserDefaults() .setObject("Kingda Ka", forKey: "thecoaster")
            self.performSegueWithIdentifier("waittime", sender: self)
            
        case 1:
            print("Choose Nitro")
        NSUserDefaults .standardUserDefaults() .setObject("Nitro", forKey: "thecoaster")
            self.performSegueWithIdentifier("waittime", sender: self)
            
        case 2:
            print("Choose El Toro")
        NSUserDefaults .standardUserDefaults() .setObject("El Toro", forKey: "thecoaster")
            self.performSegueWithIdentifier("waittime", sender: self)
            
        case 3:
            print("Choose Superman")
        NSUserDefaults .standardUserDefaults() .setObject("Superman", forKey: "thecoaster")
            self.performSegueWithIdentifier("waittime", sender: self)
            
        case 4:
            print("Choose Bizarro")
        NSUserDefaults .standardUserDefaults() .setObject("Bizarro", forKey: "thecoaster")
            self.performSegueWithIdentifier("waittime", sender: self)
            
        case 5:
            print("Choose Batman")
        NSUserDefaults .standardUserDefaults() .setObject("Batman", forKey: "thecoaster")
            self.performSegueWithIdentifier("waittime", sender: self)
            
        default:
            print("Error")
            
        }
        
        
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
