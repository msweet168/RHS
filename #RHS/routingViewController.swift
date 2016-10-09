//
//  routingViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/19/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class routingViewController: UIViewController {
    
    @IBOutlet weak var loadwheel:UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NSTimer .scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(routingViewController.route), userInfo: nil, repeats: false)
    }
    
    func route() {
        
//        let firstLaunch2 = NSUserDefaults.standardUserDefaults().boolForKey("onepointonetut10")
//        if firstLaunch2  {
            let status = NSUserDefaults .standardUserDefaults().integerForKey("setup")
            
            
            if status == 12 {
                self.performSegueWithIdentifier("app", sender: self)
            }
            else
            {
                self.performSegueWithIdentifier("set", sender: self)
     
            /*}
            
        }
        else {
            print("First launch, showing tutorial.")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "onepointonetut10")
            let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("squarefirsttwot")
            if firstLaunch  {
                print("Showing 1.1 tutorial")
                self.performSegueWithIdentifier("onepointone", sender: self)
                
            }
            else {
                print("First launch, showing tutorial again.")
                
                let status = NSUserDefaults .standardUserDefaults().integerForKey("setup")
                
                if status == 11 {
                    self.performSegueWithIdentifier("app", sender: self)
                }
                else
                {
                    self.performSegueWithIdentifier("set", sender: self)
                }
                
            }
 */

            
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
