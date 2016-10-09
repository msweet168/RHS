//
//  contactsViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 11/25/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class contactsViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var anotherclockthing:UILabel!
    @IBOutlet weak var webview:UIWebView!
    @IBOutlet weak var loadingcontacts:UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setcontacttime()
        
        webview.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.roslynschools.org/Page/77")!))
        
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingcontacts.hidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setcontacttime() {
        let date = NSDate()
        let dateFormatter2:NSDateFormatter = NSDateFormatter()
        dateFormatter2.dateFormat = "hh:mm a"
        anotherclockthing.text = dateFormatter2.stringFromDate(date)
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
