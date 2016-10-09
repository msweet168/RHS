//
//  studentLifeController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/18/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class studentLifeController: UIViewController {
    
    @IBOutlet weak var clocklabel:UILabel!
    @IBOutlet weak var tabselector:UISegmentedControl!
    @IBOutlet weak var topimageall:UIImageView!
    @IBOutlet weak var bottomimageall:UIImageView!
    @IBOutlet weak var topimageipad:UIImageView!
    @IBOutlet weak var bottomimageipad:UIImageView!
    @IBOutlet weak var toplabelall:UILabel!
    @IBOutlet weak var bottomlabelall:UILabel!
    @IBOutlet weak var toplabelipad:UILabel!
    @IBOutlet weak var bottomlabelipad:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setclock()
        clockrepeat()
    }
    
    func clockrepeat() {
        NSTimer .scheduledTimerWithTimeInterval(5, target: self, selector: #selector(studentLifeController.setclock), userInfo: nil, repeats: true)
    }
    
    
    
    func setclock() {
        let date = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        clocklabel.text = dateFormatter.stringFromDate(date)
    }
    
    @IBAction func tabchanged(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            print("hello")
        case 1:
            print("hello")
        case 2:
            print("hello")
        case 3:
            print("hello")
        default:
            print("hello")
            
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
