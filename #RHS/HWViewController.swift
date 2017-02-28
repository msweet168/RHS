//
//  HWViewController.swift
//  #RHS
//
//  Created by Mitchell Sweet on 12/14/15.
//  Copyright © 2015 Mitchell Sweet. All rights reserved.
//

import UIKit

class HWViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var assignmentlabel: UILabel!
    @IBOutlet weak var fulldatelabel:UILabel!
    @IBOutlet weak var countdownlabel:UILabel!
    @IBOutlet weak var hwclocklabel:UILabel!
    
    //Precondition: Assignment and Details must have equil lengths.
    var assignment = ["Tap \"new\" to add assignment."]
    //var details = [String]()
    var details = ["Tap an assignment for more."]
    var notes = ["Your notes will be here."]
    var assignmentlength = Int()
    var detailslength = Int()
    var noteslength = Int()
    var thestring = "hello"
    var notschoolam = ["12","01","02","03","04","05","06","07"]
    var notschoolpm = ["03","04","05","06","07","08","09","10","11"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if NSUserDefaults .standardUserDefaults().arrayForKey("assignmentsarray2") != nil {
            loadarraydata()
        }
        
        setfulldate()
//        timeanddateupdater()
        
        assignmentlength = assignment.count
        detailslength = details.count
        noteslength = notes.count
        
        if assignment.count != details.count {
            print("Error 128, arrays did not match.")
            let thealert = UIAlertView(title: "Error 128, info might be missing.", message: "There has been an error. This error means that some previously saved homework assignments might be missing. Please go to the troubleshooting page of the app and report it to Sweet development. Thank you.", delegate: self, cancelButtonTitle: "Dismiss")
            thealert.show()
        }
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorColor = UIColor .whiteColor()
        tableView.rowHeight = 80
    }
    
    func reloadtableview() {
        self.tableView.reloadData()
    }
    
    func addinfo() {
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "New Assignment",
            message: "Enter assignment details below.",
            preferredStyle: .Alert)
        
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField: UITextField!) in
                textField.placeholder = "Task name (test, essay, etc)"
                textField.returnKeyType = UIReturnKeyType.Next
                textField.autocapitalizationType = UITextAutocapitalizationType.Words
                textField.autocorrectionType = UITextAutocorrectionType.Yes
                textField.spellCheckingType = UITextSpellCheckingType.Yes
        })
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField2: UITextField!) in
                textField2.placeholder = "Enter class or teacher here"
                textField2.returnKeyType = UIReturnKeyType.Next
                textField2.autocapitalizationType = UITextAutocapitalizationType.Words
                textField2.autocorrectionType = UITextAutocorrectionType.No
                textField2.spellCheckingType = UITextSpellCheckingType.No
        })
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField3: UITextField!) in
                textField3.placeholder = "Enter due date here"
                textField3.returnKeyType = UIReturnKeyType.Next
                textField3.autocapitalizationType = UITextAutocapitalizationType.Words
                textField3.autocorrectionType = UITextAutocorrectionType.Yes
                textField3.spellCheckingType = UITextSpellCheckingType.Yes
        })
        alertController!.addTextFieldWithConfigurationHandler(
            {(textField4: UITextField!) in
                textField4.placeholder = "Enter question numbers, notes, etc. here."
                textField4.returnKeyType = UIReturnKeyType.Done
                textField4.autocapitalizationType = UITextAutocapitalizationType.Sentences
                textField4.autocorrectionType = UITextAutocorrectionType.Yes
                textField4.spellCheckingType = UITextSpellCheckingType.Yes
        })
        
        let action = UIAlertAction(title: "Save",
            style: UIAlertActionStyle.Default,
            handler: {[weak self]
                (paramAction:UIAlertAction!) in
                if let textFields = alertController?.textFields{
                    let theTextFields = textFields as [UITextField]
                    let taskname = theTextFields[0].text
                    let teacher = theTextFields[1].text
                    let duedate = theTextFields[2].text
                    let more = theTextFields[3].text
                    
                    // Delete next three lines if you want most recent assignments to show up at the top instead of the bottom. \
                    self!.assignmentlength = self!.assignment.count
                    self!.detailslength = self!.details.count
                    self!.noteslength = self!.notes.count
                    
                    var taskstring = taskname!
                    if taskstring == "" {
                        taskstring = "Unnammed Assignment"
                    }
                    
                        self!.assignment.insert(taskstring, atIndex: self!.assignmentlength)
                        print(self!.assignment)
                        NSUserDefaults .standardUserDefaults() .setObject(self!.assignment, forKey: "assignmentsarray2")
                    
                            var astring = String()
                    
                            if (teacher! == "") && (duedate! == "") {
                                astring = ""
                            }
                            else if (teacher! == "") {
                                astring = "Due \(duedate!)"
                            }
                            else if (duedate! == "") {
                                astring = "\(teacher!)"
                            }
                            else
                            {
                                astring = "\(teacher!), Due \(duedate!)"
                            }
                        self!.details.insert(astring, atIndex: self!.detailslength)
                        print(self!.details)
                        NSUserDefaults .standardUserDefaults() .setObject(self!.details, forKey: "detailsarray2")
                        self!.notes.insert(more!, atIndex: self!.noteslength)
                        print(self!.notes)
                        NSUserDefaults .standardUserDefaults() .setObject(self!.notes, forKey: "notesarray2")
                    
                    NSUserDefaults .standardUserDefaults() .setInteger(self!.assignment.count-1, forKey: "assigned")
                    
                    self!.assignmentlabel.text = "\(self!.assignment.count-1) Assignments"
                    

                    self!.reloadtableview()
                    
                }
            })
        
        alertController?.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alertController?.addAction(action)
        self.presentViewController(alertController!,
            animated: true,
            completion: nil)

    }
    
    override func viewDidAppear(animated: Bool) {
        if NSUserDefaults .standardUserDefaults() .boolForKey("hwShortcut") {
            addinfo()
            NSUserDefaults .standardUserDefaults() .setBool(false, forKey: "hwShortcut")
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.assignment.count;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell

        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,
            reuseIdentifier: "cell")
        cell.textLabel?.text = self.assignment[indexPath.row]
        cell.textLabel?.textColor = UIColor .whiteColor()
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(20)
        cell.backgroundColor = UIColor .clearColor()
        cell.detailTextLabel?.text = self.details[indexPath.row]
        cell.detailTextLabel?.textColor = UIColor .whiteColor()
        cell.detailTextLabel?.font = UIFont.systemFontOfSize(12)
        
        if indexPath.row == 0 {
            //cell.textLabel?.textColor = UIColor .blackColor()
            //cell.detailTextLabel?.textColor = UIColor.blackColor()
            cell.textLabel?.font = UIFont.systemFontOfSize(20)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let infoAlert = SCLAlertView()
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //let alert = UIAlertController(title: self.assignment[indexPath.row], message: self.notes[indexPath.row], preferredStyle: UIAlertControllerStyle.Alert)
        
       // alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
       // self.presentViewController(alert, animated: true, completion: nil)
        
        
        if indexPath.row != 0 {
            
            infoAlert.addButton("Delete") {
                
                print("Delete Assignment")
                let temp = self.assignment[indexPath.row]
                self.assignment.removeAtIndex(indexPath.row)
                self.details.removeAtIndex(indexPath.row)
                self.notes.removeAtIndex(indexPath.row)
                NSUserDefaults .standardUserDefaults() .setObject(self.assignment, forKey: "assignmentsarray2")
                NSUserDefaults .standardUserDefaults() .setObject(self.details, forKey: "detailsarray2")
                NSUserDefaults .standardUserDefaults() .setObject(self.notes, forKey: "notesarray2")
                
                self.tableView.reloadData()
                
                print(self.assignment)
                print(self.details)
                print(self.notes)
                
                self.assignmentlabel.text = "\(self.assignment.count-1) Assignments"
                
                NSUserDefaults .standardUserDefaults() .setInteger(self.assignment.count-1, forKey: "assigned")
                
                
                let confDelete = SCLAlertView()
                confDelete.showSuccess("Deleted", subTitle: "The assignment \"\(temp)\" has been deleted.", closeButtonTitle: "Ok")
            }
            
            
            
            /*
            alert.addAction(UIAlertAction(title: "Delete", style: .Default, handler: { action in
                switch action.style{
                case .Default:
                    print("Delete Assignment")
                    let temp = self.assignment[indexPath.row]
                    self.assignment.removeAtIndex(indexPath.row)
                    self.details.removeAtIndex(indexPath.row)
                    self.notes.removeAtIndex(indexPath.row)
                    NSUserDefaults .standardUserDefaults() .setObject(self.assignment, forKey: "assignmentsarray2")
                    NSUserDefaults .standardUserDefaults() .setObject(self.details, forKey: "detailsarray2")
                    NSUserDefaults .standardUserDefaults() .setObject(self.notes, forKey: "notesarray2")
                    
                    self.tableView.reloadData()
                    
                    print(self.assignment)
                    print(self.details)
                    print(self.notes)
                    
                    self.assignmentlabel.text = "\(self.assignment.count-1) Assignments"
                    
                     NSUserDefaults .standardUserDefaults() .setInteger(self.assignment.count-1, forKey: "assigned")
                    
                    
                    let confDelete = SCLAlertView()
                    confDelete.showSuccess("Deleted", subTitle: "The assignment \"\(temp)\" has been deleted.", closeButtonTitle: "Ok")
                    
                    
                case .Cancel:
                    print("cancel")
                    print("error")
                    
                case .Destructive:
                    print("destructive")
                }
            }))
          */

        }
        
         infoAlert.showInfo(self.assignment[indexPath.row], subTitle: self.notes[indexPath.row],closeButtonTitle: "Close")
        
        /*
        let thealert = UIAlertView(title: self.assignment[indexPath.row], message: self.notes[indexPath.row], delegate: self, cancelButtonTitle: "Close")
        thealert.show()
        */

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addinfo(sender:AnyObject) {
        addinfo()
    }
    
    @IBAction func clearall(sender:AnyObject) {
        
        if assignment.count == 1 {
            
            let thealert = SCLAlertView()
            thealert.showError("No Assignments", subTitle: "There are no assignments to clear.", closeButtonTitle: "Ok")
            
        }
        else
        {
            
            let thealert = SCLAlertView()
            thealert.addButton("Clear All", action: clearAllAssignments)
            thealert.showWarning("Are you sure?", subTitle: "This will delete all assignments. This cannot be undone.", closeButtonTitle: "Cancel")
            
        /*
        let alert = UIAlertController(title: "Are you sure?",message: "This will delete all assignments. This cannot be undone.", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
            alert.addAction(UIAlertAction(title: "Clear all", style: .Default, handler: { action in
                switch action.style{
                case .Default:
                    print("Cleared")
                    
                    self.assignment.removeAll()
                    self.assignment = ["Tap \"new\" to add assignment."]
                    NSUserDefaults .standardUserDefaults() .setObject(self.assignment, forKey: "assignmentsarray2")
                    self.details.removeAll()
                    self.details = ["Tap \"clear\" to remove all."]
                    NSUserDefaults .standardUserDefaults() .setObject(self.details, forKey: "detailsarray2")
                    self.notes.removeAll()
                    self.notes = ["Your notes will be here."]
                    NSUserDefaults .standardUserDefaults() .setObject(self.notes, forKey: "notesarray2")
                    
                    print(self.assignment)
                    print(self.details)
                    print(self.notes)
                    
                    self.tableView.reloadData()
                    
                    self.assignmentlabel.text = "\(self.assignment.count-1) Assignments"
                    
                     NSUserDefaults .standardUserDefaults() .setInteger(self.assignment.count-1, forKey: "assigned")
                    
                    let thealert = UIAlertView(title: "Confirmation", message: "All assignments have been deleted.", delegate: self, cancelButtonTitle: "Ok")
                    thealert.show()
                    
                    
                case .Cancel:
                    print("cancel")
                    print("error")
                    
                case .Destructive:
                    print("destructive")
                }
            }))
         
 */
        }
        
    }
    
    func clearAllAssignments() {
        print("Cleared")
        
        self.assignment.removeAll()
        self.assignment = ["Tap \"new\" to add assignment."]
        NSUserDefaults .standardUserDefaults() .setObject(self.assignment, forKey: "assignmentsarray2")
        self.details.removeAll()
        self.details = ["Tap an assignment for more."]
        NSUserDefaults .standardUserDefaults() .setObject(self.details, forKey: "detailsarray2")
        self.notes.removeAll()
        self.notes = ["Your notes will be here."]
        NSUserDefaults .standardUserDefaults() .setObject(self.notes, forKey: "notesarray2")
        
        print(self.assignment)
        print(self.details)
        print(self.notes)
        
        self.tableView.reloadData()
        
        self.assignmentlabel.text = "\(self.assignment.count-1) Assignments"
        
        NSUserDefaults .standardUserDefaults() .setInteger(self.assignment.count-1, forKey: "assigned")
        
        let theAlert = SCLAlertView()
        theAlert.showSuccess("Cleared", subTitle: "All assignments have been deleted.", closeButtonTitle: "Ok")
        
    }
    
    func loadarraydata() {
        
        let tabledata = NSUserDefaults .standardUserDefaults() .arrayForKey("assignmentsarray2")
        assignment = tabledata as! [String]
        //print(assignment)
        
        let tabledata2 = NSUserDefaults .standardUserDefaults() .arrayForKey("detailsarray2")
        details = tabledata2 as! [String]
        //print(details)
        
        let tabledata3 = NSUserDefaults .standardUserDefaults() .arrayForKey("notesarray2")
        notes = tabledata3 as! [String]
        //print(notes)
        
        assignmentlabel.text = "\(assignment.count-1) Assignments"
    }
    
    
    func timeanddateupdater() {
        NSTimer .scheduledTimerWithTimeInterval(5, target: self, selector: #selector(HWViewController.setfulldate), userInfo: nil, repeats: true)
    }
    
    func setfulldate() {
        settime()
        let currentdate = NSDate()
        let currentdateFormatter:NSDateFormatter = NSDateFormatter()
        currentdateFormatter.dateFormat = "MM/dd/YYYY"
        fulldatelabel.text = "Today is: \(currentdateFormatter.stringFromDate(currentdate))"
        
    }
    
    func settime() {
        let date = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        hwclocklabel.text = dateFormatter.stringFromDate(date)
        
        
        let next8AM = NSCalendar.currentCalendar().nextDateAfterDate(NSDate(),
                                                                     matchingHour: 8,
                                                                     minute: 0,
                                                                     second: 0,
                                                                     options: .MatchNextTime)!
        let components = NSCalendar.currentCalendar().components([.Hour, .Minute],
                                                                 fromDate: NSDate(),
                                                                 toDate: next8AM,
                                                                 options: .MatchNextTime)
        countdownlabel.text = "\(components.hour):\(components.minute) until school."
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
