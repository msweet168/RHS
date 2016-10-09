//
//  SplashScreen.swift
//  #RHS
//
//  Created by Mitchell Sweet on 10/3/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import UIKit

class SplashScreen: UIViewController {
    
    
    
    @IBOutlet var Images: [UIImageView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIScreen.mainScreen().bounds.size.height == 568 {
            for view in self.Images {
                view.hidden = true
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
