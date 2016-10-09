//
//  waittimeViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 2/9/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import UIKit

class waittimeViewController: UIViewController {
    
    @IBOutlet weak var labelbutton:UIButton!
    @IBOutlet weak var timeclock:UILabel!
    @IBOutlet weak var waittimelabel:UILabel!
    @IBOutlet weak var backimage:UIImageView!
    @IBOutlet weak var boardinglabel:UILabel!
    var coasterchoosen = String()
    var countingtimer = NSTimer()
    var countingnumber = Int()
    var currentwaittime = Int()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        let dateFormatter2:NSDateFormatter = NSDateFormatter()
        dateFormatter2.dateFormat = "hh:mm a"
        timeclock.text = dateFormatter2.stringFromDate(date)
        
        coasterchoosen = NSUserDefaults .standardUserDefaults() .stringForKey("thecoaster")!
        print("Coaster Choosen: \(coasterchoosen)")
        labelbutton .setTitle("⬅︎ \(coasterchoosen)", forState: UIControlState.Normal)
        backimage.image = UIImage(named: "\(coasterchoosen).png");
        
        currentwaittime = findcurrentwaittime()
        
        countingnumber = 0
        countingtimer = NSTimer .scheduledTimerWithTimeInterval(0.04, target: self, selector: #selector(waittimeViewController.middlemethod), userInfo: nil, repeats: true)
        

        // Do any additional setup after loading the view.
    }
    
    func middlemethod() {
        
        if currentwaittime == 0 {
            waittimelabel.text = "Walk-On"
            boardinglabel.text = "Can board now."
            countingtimer.invalidate()
        }
        else
        {
            counttonumber(currentwaittime)
        }
        
    }
    
    
    
    func counttonumber(thenumber: Int) {
        countingnumber += 1
        
        if countingnumber == thenumber {
            if thenumber == 120
            {
                countingtimer.invalidate()
                waittimelabel.text = "\(thenumber)+ Mins"
                countingnumber = 0
                
                boardinglabel.text = "Will board at \(findtimetoboard(thenumber))"
            }
            else
            {
                countingtimer.invalidate()
                waittimelabel.text = "\(thenumber) Mins"
                countingnumber = 0
                
                boardinglabel.text = "Will board at \(findtimetoboard(thenumber))"
            }
        }
        else
        {
           waittimelabel.text = "\(countingnumber) Mins"
        }
        
        if thenumber == 120 {
            if countingnumber == 45 {
                countingnumber = 118
            }
        }
        else if thenumber == 90 {
            if countingnumber == 30 {
                countingnumber = 88
            }
        }
        else if thenumber == 45 {
            if countingnumber == 20 {
                countingnumber = 42
            }
        }
        else if thenumber == 60 {
            if countingnumber == 25 {
                countingnumber = 58
            }
        }
        
    }
    
    func findtimetoboard(waittime: Int) -> String {
        
        let amountoftime:NSTimeInterval = Double(waittime*60)
        
        let currentdate = NSDate()
        let boardingtime = currentdate.dateByAddingTimeInterval(amountoftime)
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.stringFromDate(boardingtime)
    }
    
    func timeofday() -> String {
        
        let currentdate = NSDate()
        let dateformatter:NSDateFormatter = NSDateFormatter()
        dateformatter.dateFormat = "a"
        return dateformatter.stringFromDate(currentdate)
    }
    
    func showhour() -> Int {
        
        let currentdate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh"
        let thehour = dateFormatter.stringFromDate(currentdate)
        return Int(thehour)!
        
    }
    
    func findcurrentwaittime()->Int {
        
        //print(showhour())
        
        if showhour() == 10 {
            
            if coasterchoosen == "Nitro" {
                return 0
            }
            else if coasterchoosen == "Kingda Ka" {
                return 30
            }
            else if coasterchoosen == "El Toro" {
                return 25
            }
            else if coasterchoosen == "Superman" {
                return 15
            }
            else if coasterchoosen == "Batman" {
                return 5
            }
            else if coasterchoosen == "Bizarro" {
                return 0
            }
            
            
        }
        else if showhour() == 11 {
            
            if coasterchoosen == "Nitro" {
                return 45
            }
            else if coasterchoosen == "Kingda Ka" {
                return 45
            }
            else if coasterchoosen == "El Toro" {
                return 25
            }
            else if coasterchoosen == "Superman" {
                return 15
            }
            else if coasterchoosen == "Batman" {
                return 15
            }
            else if coasterchoosen == "Bizarro" {
                return 15
            }
            
        }
        else if showhour() == 12 {
            
            if coasterchoosen == "Nitro" {
                return 45
            }
            else if coasterchoosen == "Kingda Ka" {
                return 60
            }
            else if coasterchoosen == "El Toro" {
                return 30
            }
            else if coasterchoosen == "Superman" {
                return 25
            }
            else if coasterchoosen == "Batman" {
                return 25
            }
            else if coasterchoosen == "Bizarro" {
                return 25
            }
            
        }
        else if showhour() == 01 {
            
            if coasterchoosen == "Nitro" {
                return 60
            }
            else if coasterchoosen == "Kingda Ka" {
                return 120
            }
            else if coasterchoosen == "El Toro" {
                return 45
            }
            else if coasterchoosen == "Superman" {
                return 45
            }
            else if coasterchoosen == "Batman" {
                return 25
            }
            else if coasterchoosen == "Bizarro" {
                return 15
            }
            
        }
        else if showhour() == 02 {
            
            if coasterchoosen == "Nitro" {
                return 90
            }
            else if coasterchoosen == "Kingda Ka" {
                return 120
            }
            else if coasterchoosen == "El Toro" {
                return 60
            }
            else if coasterchoosen == "Superman" {
                return 60
            }
            else if coasterchoosen == "Batman" {
                return 45
            }
            else if coasterchoosen == "Bizarro" {
                return 45
            }
            
        }
        else if showhour() == 03 {
            
            if coasterchoosen == "Nitro" {
                return 60
            }
            else if coasterchoosen == "Kingda Ka" {
                return 90
            }
            else if coasterchoosen == "El Toro" {
                return 45
            }
            else if coasterchoosen == "Superman" {
                return 45
            }
            else if coasterchoosen == "Batman" {
                return 30
            }
            else if coasterchoosen == "Bizarro" {
                return 30
            }
            
        }
        else if showhour() == 04 {
            
            if coasterchoosen == "Nitro" {
                return 45
            }
            else if coasterchoosen == "Kingda Ka" {
                return 60
            }
            else if coasterchoosen == "El Toro" {
                return 25
            }
            else if coasterchoosen == "Superman" {
                return 25
            }
            else if coasterchoosen == "Batman" {
                return 25
            }
            else if coasterchoosen == "Bizarro" {
                return 15
            }
            
        }
        else if showhour() == 05 {
            
            if coasterchoosen == "Nitro" {
                return 45
            }
            else if coasterchoosen == "Kingda Ka" {
                return 45
            }
            else if coasterchoosen == "El Toro" {
                return 30
            }
            else if coasterchoosen == "Superman" {
                return 30
            }
            else if coasterchoosen == "Batman" {
                return 15
            }
            else if coasterchoosen == "Bizarro" {
                return 25
            }
            
        }
        else if showhour() == 06 {
            
            if coasterchoosen == "Nitro" {
                return 60
            }
            else if coasterchoosen == "Kingda Ka" {
                return 60
            }
            else if coasterchoosen == "El Toro" {
                return 90
            }
            else if coasterchoosen == "Superman" {
                return 25
            }
            else if coasterchoosen == "Batman" {
                return 15
            }
            else if coasterchoosen == "Bizarro" {
                return 25
            }
            
        }
        else if showhour() == 07 {
            
            if coasterchoosen == "Nitro" {
                return 45
            }
            else if coasterchoosen == "Kingda Ka" {
                return 45
            }
            else if coasterchoosen == "El Toro" {
                return 25
            }
            else if coasterchoosen == "Superman" {
                return 30
            }
            else if coasterchoosen == "Batman" {
                return 15
            }
            else if coasterchoosen == "Bizarro" {
                return 15
            }
            
        }
        else if showhour() == 08 {
            
            if coasterchoosen == "Nitro" {
                return 45
            }
            else if coasterchoosen == "Kingda Ka" {
                return 30
            }
            else if coasterchoosen == "El Toro" {
                return 5
            }
            else if coasterchoosen == "Superman" {
                return 25
            }
            else if coasterchoosen == "Batman" {
                return 25
            }
            else if coasterchoosen == "Bizarro" {
                return 5
            }
            
        }
        else if showhour() == 09 {
            
            if coasterchoosen == "Nitro" {
                return 30
            }
            else if coasterchoosen == "Kingda Ka" {
                return 45
            }
            else if coasterchoosen == "El Toro" {
                return 5
            }
            else if coasterchoosen == "Superman" {
                return 5
            }
            else if coasterchoosen == "Batman" {
                return 5
            }
            else if coasterchoosen == "Bizarro" {
                return 0
            }
            
        }
        else if showhour() == 19 {
            
            if coasterchoosen == "Nitro" {
                return 25
            }
            else if coasterchoosen == "Kingda Ka" {
                return 30
            }
            else if coasterchoosen == "El Toro" {
                return 0
            }
            else if coasterchoosen == "Superman" {
                return 0
            }
            else if coasterchoosen == "Batman" {
                return 5
            }
            else if coasterchoosen == "Bizarro" {
                return 0
            }
            
        }
        
        return 0
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
