//
//  BellViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/18/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class BellViewController: UIViewController {
    
//    var mutarray:NSMutableArray = [1,2,3,4,5];
    @IBOutlet weak var schimage:UIImageView!
    @IBOutlet weak var bellselector:UISegmentedControl!
    @IBOutlet weak var regulartime:UILabel!
    @IBOutlet weak var exacttime2:UILabel!
    @IBOutlet weak var exacttime:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        mutarray.replaceObjectAtIndex(1, withObject: 4)
//        mutarray.insertObject(3, atIndex: 5)

        // Do any additional setup after loading the view.
        
        clockcounter()
        settime()
        setexacttime()
        
    }
    
    func clockcounter() {
        
        NSTimer .scheduledTimerWithTimeInterval(1, target: self, selector: #selector(BellViewController.settime), userInfo: nil, repeats: true)
        NSTimer .scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(BellViewController.setexacttime), userInfo: nil, repeats: true)
    }
    
    func settime() {
        let date = NSDate()
        let dateFormatter2:NSDateFormatter = NSDateFormatter()
        dateFormatter2.dateFormat = "hh:mm a"
        regulartime.text = dateFormatter2.stringFromDate(date)
    }
    
    func setexacttime() {
        let date2 = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm:ss a"
        exacttime.text = dateFormatter.stringFromDate(date2)
        exacttime2.text = dateFormatter.stringFromDate(date2)
    }

    
    @IBAction func selectschedule(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            schimage.image = UIImage(named: "bellscheduledaily.png")
        case 1:
            schimage.image = UIImage(named: "1hourdelay.png")
        case 2:
            schimage.image = UIImage(named: "2hourdelay.png")
        case 3:
            schimage.image = UIImage(named: "periodx.png")
        default:
            schimage.image = UIImage(named: "bellscheduledaily.png")
            
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
