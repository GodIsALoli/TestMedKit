//
//  BasicInfo.swift
//  TestMedKit
//
//  Created by Student on 2018-04-03.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class BasicInfo: TaskInfo {
    var firstName: String
    var lastName: String
    var gender: String
    var dateOfBirth: String
    var phone: String?
    var email: String
    
    private let dateFormatter = DateFormatter()
    init(firstName: String, lastName: String, gender: String, dateOfBirth: String,phone: String?, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.dateOfBirth = dateOfBirth
        self.phone = phone
        self.email = email
        dateFormatter.dateFormat = "mm-dd-yyyy"
    }
    
    var dateOfBirthInDate: Date {
        
        get {
            return dateFormatter.date(from: dateOfBirth)!
        }
        set {
            dateOfBirth = dateFormatter.string(from: newValue)
        }
    }
    
    var fullName: String {
        get {
            return firstName + " \(lastName)"
        }
    }
    
    var age: Int {
        get {
            let currentDate = Date()
            
            let birthday = dateOfBirthInDate
            let timeInterval = currentDate.timeIntervalSince(birthday)
            return Int(timeInterval / (3600*24*365))
        }
    }
}
