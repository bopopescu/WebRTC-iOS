//
//  HomeVC.swift
//  WebRTC-iOS-Client
//
//  Created by Innovation on 3/8/17.
//  Copyright © 2017 Innovation. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var genderPicker: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startCall(_ sender: Any) {
        
        if nameField.text!.isEmpty{
            AppDelegate.showAlert("Sorrry", message: "Please enter a valid name", context: self)
            return
        }
        
        if genderPicker.selectedSegmentIndex == 0{
            AppDelegate.gender = "m"
        }else{
            AppDelegate.gender = "f"
        }
        AppDelegate.userId = nameField.text!
        
        performSegue(withIdentifier: "StartCallSegue", sender: self)
        
    }

}
