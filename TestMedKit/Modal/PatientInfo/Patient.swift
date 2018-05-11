//
//  File.swift
//  TestMedKit
//
//  Created by Student on 2018-02-21.
//  Copyright © 2018 Student. All rights reserved.
//

import Foundation

class Patient{
    var basicInfo: BasicInfo
    
    var surveyResults: [SurveyResult] = []
    
    init(basicInfo: BasicInfo) {
        self.basicInfo = basicInfo
    }
}
