//
//  add_Study_VM.swift
//  o_p_app
//
//  Created by OOPSLA on 24/03/2019.
//  Copyright © 2019 haeun. All rights reserved.
//

import Foundation
import UIKit
// 서버로 보낼 데이터 Model
class studyInfo {
    let title : String
    let description : String
    let studyWeekInfo : String
    let maxMember : Int
    let place : String
    
    init(title:String,
         description :String,
         studyWeekInfo : String,
         maxMember : Int,
         place : String) {
        self.title = title
        self.description = description
        self.studyWeekInfo = studyWeekInfo
        self.maxMember = maxMember
        self.place = place
    }
}

