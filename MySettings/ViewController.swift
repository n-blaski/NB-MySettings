//
//  ViewController.swift
//  MySettings
//
//  Created by webstudent on 11/2/15.
//  Copyright © 2015 Nic Blaski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func btnClear(sender: AnyObject) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "fullname")
        defaults.setObject(nil, forKey: "address")
        defaults.setObject(nil, forKey: "dob")
        
        defaults.synchronize()
        
        txtFullname.text = ""
        txtAddress.text = ""
        MyDOB.selectRow(0,inComponent: 0, animated: true)
        txtFullname.becomeFirstResponder()
    }
    
    //year
    var selectedYear:Int!
    let pickerYear = [Int](1920...2020)
    @IBAction func btnLoad(sender: AnyObject) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let userNameNotNull = defaults.objectForKey("fullname") as? String {
            self.txtFullname.text = defaults.objectForKey("fullname") as? String
        }
        
        if let passwordIsNotNill = defaults.objectForKey("address") as? String {
            self.txtAddress.text = defaults.objectForKey("address") as? String
        }
        
        
        if let colorIsNotNill = defaults.objectForKey("dob") as? String {
            var favoriteColorSelected = defaults.objectForKey("dob") as! Int
            let SelectedYear:Int = (pickerYear).indexOf(favoriteColorSelected)!
        }
        MyDOB.selectRow(selectedYear,inComponent: 0, animated: true)
    }
    
    @IBOutlet weak var txtFullname: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var MyDOB: UIPickerView!
    
    
    @IBAction func btnSave(sender: AnyObject) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.txtFullname.text, forKey: "fullname")
        defaults.setObject(self.txtAddress.text, forKey: "address")
        defaults.setObject(selectedYear, forKey: "dob")
        
        
        defaults.synchronize()
    }
    
    
    //Needed for picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerYear.count
    }
    
    
    //new method hiding keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches , withEvent: event)
    }
    //set delegate to all uitextfields
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFullname.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

