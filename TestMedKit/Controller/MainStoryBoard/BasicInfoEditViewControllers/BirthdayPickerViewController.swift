//
//  BirthdayPickerViewController.swift
//  TestMedKit
//
//  Created by Student on 2018-02-21.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit

class BirthdayPickerViewController: BasicInfoEditViewController {

    @IBOutlet weak var birthdayPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = doneBarButton
        
        birthdayPicker.datePickerMode = .date
        birthdayPicker.date = patient.basicInfo.dateOfBirthInDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func getNewBasicInfo() -> BasicInfo? {
        var newBasicInfo = patient.basicInfo
        newBasicInfo.dateOfBirthInDate = birthdayPicker.date
        
        return newBasicInfo
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func updateStart() {
        super.updateStart()
        
        birthdayPicker.isUserInteractionEnabled = false
    }
    
    override func updateComplete() {
        super.updateComplete()
        
        birthdayPicker.isUserInteractionEnabled = true
    }
}
